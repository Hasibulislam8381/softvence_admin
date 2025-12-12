<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Expense;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;
use Smalot\PdfParser\Parser; // PDF extract library
use thiagoalessio\TesseractOCR\TesseractOCR;

class ExpenseController extends Controller
{
    public function index(Request $request)
    {
        $user = Auth::user();
        $filter = $request->query('filter');

        $query = Expense::where('user_id', $user->id);

        if ($filter === 'weekly') {
            $query->whereBetween('date', [now()->startOfWeek(), now()->endOfWeek()]);
        }

        if ($filter === 'monthly') {
            $query->whereYear('date', now()->year)
                  ->whereMonth('date', now()->month);
        }

        if ($filter === 'yearly') {
            $query->whereYear('date', now()->year);
        }

        $expenses = $query->orderBy('id', 'DESC')->paginate(20);

        $totalAmount = $query->sum('amount');

        return response()->json([
            'success' => true,
            'user' => [
                'id'    => $user->id,
                'name'  => $user->name,
                'email' => $user->email,
            ],
            'filter' => $filter ?? 'all',
            'total_expense_amount' => $totalAmount,
            'data' => $expenses
        ]);
    }
    public function upload(Request $request)
    {
        $request->validate([
            'files'   => 'nullable|array',
            'files.*' => 'file|mimes:jpg,jpeg,JPG,JPEG,png,PNG,pdf,PDF|max:15240',
            'note'    => 'nullable|string|max:500',
            'text'    => 'nullable|string'
        ]);

        $user = Auth::user();
        $uploadedExpenses = [];

        $files = $request->file('files', []);

        foreach ($files as $file) {
            $text = $this->extractText($file);
            $uploadedExpenses[] = $this->createExpenseFromText($user, $text, $file->store('expenses', 'public'), $request->note);
        }

        if ($request->filled('text')) {
            $uploadedExpenses[] = $this->createExpenseFromText($user, $request->text, null, $request->note);
        }

        return response()->json([
            'success' => true,
            'data'    => $uploadedExpenses
        ]);
    }
    private function extractText($file)
    {
        $extension = $file->getClientOriginalExtension();

        if (in_array($extension, ['jpg', 'jpeg', 'png'])) {
            $path = $file->getRealPath();
            return (new TesseractOCR($path))
                        ->executable('C:/Program Files/Tesseract-OCR/tesseract.exe')
                        ->run();
        }
        if ($extension === 'pdf') {
            $parser = new Parser();
            $pdf = $parser->parseFile($file->getRealPath());
            return $pdf->getText();
        }

        return '';
    }
    private function createExpenseFromText($user, $text, $filePath = null, $note = null)
    {
        // Step 1: Clean text
        $text = preg_replace('/[^\x20-\x7E]/', ' ', $text);
        $text = preg_replace('/\s+/', ' ', $text);
        $text = trim($text);

        // Step 2: Send to OpenAI
        $prompt = "
            Extract vendor (store name), total amount, date, and category from this invoice.

            Rules:
            - Vendor = business name at the top.
            - Amount = use 'Grand Total' value. Remove any currency symbols.
            - Date = convert DD-MM-YYYY or YYYY-MM-DD into YYYY-MM-DD.
            - Category = guess based on product name.

            Return ONLY valid JSON like this:
            {
            \"vendor\": \"...\",
            \"amount\": 1234,
            \"date\": \"YYYY-MM-DD\",
            \"category\": \"...\"
            }

            Here is the text:
            $text
            ";

        $response = Http::withToken(env('OPENAI_API_KEY'))
            ->post('https://api.openai.com/v1/chat/completions', [
                "model" => "gpt-4o-mini",
                "messages" => [
                    ["role" => "user", "content" => $prompt]
                ],
                "temperature" => 0
            ]);

        $content = $response['choices'][0]['message']['content'] ?? '{}';

        // Step 3: Extract JSON safely
        preg_match('/\{.*\}/s', $content, $match);
        $json = json_decode($match[0] ?? '{}', true);

        $vendor = $json['vendor'] ?? 'Unknown';
        $amount = $json['amount'] ?? 0;
        $dateString = $json['date'] ?? null;
        $date = now(); // default

        if ($dateString) {
            try {
                $parsedDate = Carbon::parse($dateString);
                $date = $parsedDate;
            } catch (\Exception $e) {
                // invalid date, keep default
            }
        }

        $category = $json['category'] ?? 'Other';

        return Expense::create([
            'user_id'     => $user->id,
            'vendor_name' => $vendor,
            'amount'      => $amount,
            'date'        => $date,
            'note'        => $note,
            'category'    => $category,
            'file_url'    => $filePath,
        ]);
    }
    public function monthlySummary()
    {
        $user = Auth::user();

        // Monthly summary data
        $summary = Expense::where('user_id', $user->id)
            ->selectRaw("DATE_FORMAT(date, '%Y-%m') as month, SUM(amount) as total")
            ->groupBy('month')
            ->orderBy('month', 'ASC')
            ->get()
            ->map(function ($item) {
                // Format month: 2025-01 ➝ January 2025
                $formattedMonth = Carbon::parse($item->month . '-01')->format('F Y');

                return [
                    'month' => $formattedMonth,
                    'total' => $item->total
                ];
            });

        return response()->json([
            'success' => true,
            'summary' => $summary
        ]);
    }
    public function monthlyPdfDownload(Request $request)
    {
        $request->validate([
            'month' => 'required|integer|min:1|max:12',
            'year'  => 'required|integer|min:2000|max:2100',
        ]);

        $user = Auth::user();
        $month = $request->month;
        $year = $request->year;

        // Expenses for specific month
        $expenses = Expense::where('user_id', $user->id)
            ->whereYear('date', $year)
            ->whereMonth('date', $month)
            ->orderBy('date')
            ->get();

        if ($expenses->isEmpty()) {
            return response()->json([
                'success' => false,
                'message' => 'No expenses found for this month.',
            ], 404);
        }

        // Total amount of the month
        $total = $expenses->sum('amount');

        // Formatted month-year (e.g., January 2025)
        $monthName = Carbon::createFromDate($year, $month, 1)->format('F');
        $title = "$monthName $year";


        // Load PDF View
        $pdf = Pdf::loadView('pdf.month_expense', [
            'user' => $user,
            'title' => $title,
            'expenses' => $expenses,
            'total' => $total
        ]);

        return $pdf->download("expense-summary-$month-$year.pdf");
    }

}
