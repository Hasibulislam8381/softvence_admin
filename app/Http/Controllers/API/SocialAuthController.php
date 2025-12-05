<?php

namespace App\Http\Controllers\Api;

use Exception;
use App\Models\User;
use App\Traits\ApiResponse;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Http;

class SocialAuthController extends Controller
{
    use ApiResponse;

    public function socialLogin(Request $request)
    {
        $request->validate([
            'token' => 'required|string',
            'provider' => 'required|in:google,facebook',
            'username' => 'required|string',
            'email' => 'nullable|email',
            'avatar' => 'nullable|string', // string URL only
        ]);

        // existing user?
        $user = User::where('email', $request->email)->first();

        // avatar string as it is
        $avatarUrl = $request->avatar ?? null;

        // Create new user
        if (!$user) {
            $user = User::create([
                'name' => $request->username,
                'email' => $request->email,
                'avatar' => $avatarUrl,      // store URL directly
                'provider' => $request->provider,
                'password' => bcrypt(Str::random(16)),
                'agree_to_terms' => false,
            ]);
        }
        // Update existing user
        else {
            $user->update([
                'name' => $request->username,
                'avatar' => $avatarUrl ?: $user->avatar,
            ]);
        }
        $token = $user->createToken('auth_token')->plainTextToken;

        return $this->success([
            'id' => $user->id,
            'name' => $user->name,
            'email' => $user->email,
            'avatar' => $user->avatar, // returns URL
            'provider' => $user->provider,
            'agree_to_terms' => $user->agree_to_terms,
            'token' => $token,
            'token_type' => 'Bearer'
        ], 'User authenticated successfully');
    }

}
