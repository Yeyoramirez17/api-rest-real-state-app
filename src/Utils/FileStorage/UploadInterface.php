<?php

namespace App\Utils\FileStorage;

interface UploadInterface
{
    public function upload( string $file, string $type, ?string $folder = null ): mixed;

    public function remove( string $file ): mixed;

}