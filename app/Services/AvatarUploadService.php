<?php

namespace App\Services;

use Illuminate\Http\UploadedFile;

class AvatarUploadService
{
    public function upload(?UploadedFile $file): ?string
    {
        if (!$file) {
            return null;
        }
        return uploadImage($file, 'avatars');
    }
}
