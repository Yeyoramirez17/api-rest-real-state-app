<?php

namespace App\Utils\FileStorage\Upload\Assets;

use Symfony\Component\HttpFoundation\File\UploadedFile;

interface UploadAssetInterface
{
    public function upload( UploadedFile $asset, string $type, string $folder = null ): mixed;

    public function remove( string $asset, string $type ): mixed;
}