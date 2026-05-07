<?php

namespace App\Services;

use App\Models\EmailOtp;
use App\Models\User;

class UserRegistrationService
{
    public function createFromOtp(EmailOtp $tempUser): User
    {
        return User::create([
            'name'              => $tempUser->name,
            'email'             => $tempUser->email,
            'password'          => $tempUser->password,
            'phone_code'        => $tempUser->phone_code,
            'phone'             => $tempUser->phone,
            'email_verified_at' => now(),
            'avatar'            => $tempUser->avatar,
        ]);
    }

    public function generateToken(User $user): string
    {
        return $user->createToken('auth_token')->plainTextToken;
    }
}
