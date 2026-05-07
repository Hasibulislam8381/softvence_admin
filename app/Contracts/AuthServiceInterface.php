<?php

namespace App\Contracts;

use App\Models\User;

interface AuthServiceInterface
{
    public function attemptLogin(string $email, string $password): ?User;
    public function generateToken(User $user): string;
    public function resetPassword(User $user, string $password): void;
    public function checkPassword(User $user, string $password): bool;
}
