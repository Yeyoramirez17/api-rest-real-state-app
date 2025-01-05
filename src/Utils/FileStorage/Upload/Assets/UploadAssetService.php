<?php

namespace App\Utils\FileStorage\Upload\Assets;

use App\Utils\FileStorage\UploadInterface;
use Cloudinary\Api\ApiResponse;
use Cloudinary\Api\Exception\ApiError;
use Symfony\Component\Filesystem\Filesystem;
use Symfony\Component\HttpFoundation\File\UploadedFile;

class UploadAssetService implements UploadAssetInterface
{

    private UploadInterface $uploadFile;
    private string $targetDirectory;

    public function __construct(
        UploadInterface $uploadFile,
        string $targetDirectory
    )
    {
        $this->uploadFile = $uploadFile;
        $this->targetDirectory = $targetDirectory;
    }

    /**
     * Save the image to a FileStore system.
     *
     * @param UploadedFile $asset Asset to upload.
     * @param string $type Image|Video.
     * @param string|null $folder Folder, where you save the image, apart from the one set in settings.
     * @return ApiResponse
     */
    public function upload( UploadedFile $asset, string $type, string $folder = null ): ApiResponse
    {
        $fileSystem = new Filesystem();
        $fileName = md5( uniqid() ) . '.' . $asset->guessExtension();
        $asset->move( $this->targetDirectory, $fileName);

        $image = $this->targetDirectory . DIRECTORY_SEPARATOR . $fileName;

        try {
            /** @var ApiResponse $response */
            $response = $this->uploadFile->upload( file: $image, type: $type, folder: $folder );
        } catch ( ApiError $error ) {
            throw new \RuntimeException( $error->getMessage() );
        } finally {
            $fileSystem->remove( $image );
        }

        return $response;
    }

    public function remove(string $asset, string $type ): ApiResponse
    {
        return $this->uploadFile->remove( $asset );
    }
}