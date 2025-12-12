<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\IncomeHistory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class IncomeController extends Controller
{
    public function setIncome(Request $request)
    {
        $request->validate([
            'total_income' => 'required|numeric|min:0'
        ]);

        $user = Auth::user();
        $previousIncome = $user->total_income;

        // Save history
        IncomeHistory::create([
            'user_id' => $user->id,
            'previous_income' => $previousIncome,
            'new_income' => $request->total_income,
        ]);

        // Update user income
        $user->total_income = $request->total_income;
        $user->save();

        return response()->json([
            'success' => true,
            'message' => 'Income updated successfully',
            'data' => [
                'user_id' => $user->id,
                'total_income' => $user->total_income
            ]
        ]);
    }
    public function incomeHistory(Request $request)
    {
        $user = Auth::user();
        $history = IncomeHistory::where('user_id', $user->id)
            ->orderBy('created_at', 'desc')
            ->get();

        return response()->json([
            'success' => true,
            'user' => [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
            ],
            'data' => $history
        ]);
    }
}
