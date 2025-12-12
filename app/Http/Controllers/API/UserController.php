<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function balance(Request $request)
    {
        $user = Auth::user();
        $filter = $request->query('filter'); // weekly, monthly, yearly, or null

        $expenseQuery = \App\Models\Expense::where('user_id', $user->id);

        if ($filter === 'weekly') {
            $expenseQuery->whereBetween('date', [now()->startOfWeek(), now()->endOfWeek()]);
        } elseif ($filter === 'monthly') {
            $expenseQuery->whereYear('date', now()->year)
                         ->whereMonth('date', now()->month);
        } elseif ($filter === 'yearly') {
            $expenseQuery->whereYear('date', now()->year);
        }

        $totalExpense = $expenseQuery->sum('amount');

        // Recent 3 or 4 expenses
        $recentExpenses = \App\Models\Expense::where('user_id', $user->id)
                            ->orderBy('date', 'desc')
                            ->limit(4)
                            ->get();

        $totalIncome = $user->total_income ?? 0;
        $balance = $totalIncome - $totalExpense;

        return response()->json([
            'success' => true,
            'user' => [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
            ],
            'filter' => $filter ?? 'all',
            'total_income' => $totalIncome,
            'total_expense' => $totalExpense,
            'balance' => $balance,
            'recent_expenses' => $recentExpenses, // ✅ recent expenses included
        ]);
    }


}
