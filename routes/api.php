<?php

use App\Http\Controllers\Api\Auth\LoginController;
use App\Http\Controllers\Api\Auth\RegisterController;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\BlogController;
use App\Http\Controllers\API\SocialMediaController;
use App\Http\Controllers\API\SystemSettingController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');

Route::post("register", [AuthController::class, 'register']);
Route::post("login", [AuthController::class, 'login']);

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

    Route::controller(BlogController::class)->group(function () {
        Route::get('/blogs', 'index');
    });
});
