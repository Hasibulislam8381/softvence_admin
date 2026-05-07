<?php

namespace App\Contracts;

use App\Models\User;

interface UserOtpInterface
{
    public function generateForUser(User $user): int;
    public function verifyForUser(User $user, int $code): bool;
}
