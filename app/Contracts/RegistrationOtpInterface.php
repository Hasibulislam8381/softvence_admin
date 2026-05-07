<?php

namespace App\Contracts;

use App\Models\EmailOtp;

interface RegistrationOtpInterface
{
    public function generate(string $email, array $data): int;
    public function verify(string $email, int $code): bool;
    public function resend(string $email): int;
    public function getActiveOtp(string $email): ?EmailOtp;
}
