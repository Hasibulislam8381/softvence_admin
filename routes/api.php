<?php

use App\Http\Controllers\Api\Auth\LoginController;
use App\Http\Controllers\Api\Auth\RegisterController;
use App\Http\Controllers\Api\ExpenseController;
use App\Http\Controllers\Api\IncomeController;
use App\Http\Controllers\Api\SocialAuthController;
use App\Http\Controllers\Api\SocialMediaController;
use App\Http\Controllers\Api\SystemSettingController;
use App\Http\Controllers\Api\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');

Route::post('/social-login', [SocialAuthController::class, 'socialLogin']);

Route::controller(RegisterController::class)->prefix('users/register')->group(function () {
    // User Register
    Route::post('/', 'userRegister');

    // Verify OTP
    Route::post('/otp-verify', 'otpVerify');

    // Resend OTP
    Route::post('/otp-resend', 'otpResend');
    //email exists check
    Route::post('/email-exists', 'emailExists');
});
Route::controller(LoginController::class)->prefix('users/login')->group(function () {

    // User Login
    Route::post('/', 'userLogin');

    // Verify Email
    Route::post('/email-verify', 'emailVerify');

    // Resend OTP
    Route::post('/otp-resend', 'otpResend');

    // Verify OTP
    Route::post('/otp-verify', 'otpVerify');

    //Reset Password
    Route::post('/reset-password', 'resetPassword');
});

Route::middleware('auth:sanctum')->group(function () {
    Route::controller(SystemSettingController::class)->group(function () {
        Route::get('/site-settings', 'index');
    });

    Route::controller(SocialMediaController::class)->group(function () {
        Route::get('/social-links', 'index');
    });
    Route::controller(ExpenseController::class)->group(function () {
        Route::get('/expenses', 'index');
        Route::post('/upload', 'upload');
        Route::get('/monthly-summary', 'monthlySummary');
        Route::get('/monthly-summary-download', 'monthlyPdfDownload');

    });
    Route::controller(IncomeController::class)->group(function () {
        Route::post('/set-income', 'setIncome');
        Route::get('/income-history', 'incomeHistory');
    });
    Route::controller(UserController::class)->group(function () {
        Route::get('/balance', 'balance');
    });
});
