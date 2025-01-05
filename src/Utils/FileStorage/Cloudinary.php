<?php

namespace App\Utils\FileStorage;

use Cloudinary\Api\Admin\AdminApi;
use Cloudinary\Api\ApiResponse;
use Cloudinary\Api\Exception\ApiError;
use Cloudinary\Cloudinary as CloudinaryApi;
use Cloudinary\Configuration\Configuration;
use Psr\Container\ContainerExceptionInterface;
use Psr\Container\NotFoundExceptionInterface;
use Psr\Log\LoggerInterface;
use Symfony\Component\DependencyInjection\ParameterBag\ContainerBagInterface;

class Cloudinary implements UploadInterface
{
    private CloudinaryApi $cloudinary;

    public function __construct(
        private readonly ContainerBagInterface $containerBag,
        private readonly LoggerInterface $logger
    )
    {
        $this->cloudinary =  new CloudinaryApi( self::configuration() );
    }

    /**
     * @param string $file File to upload.
     * @param string $type Image|Video
     * @param string|null $folder
     * @return ApiResponse
     * @throws ApiError
     */
    public function upload( string $file, string $type, ?string $folder = null ): ApiResponse
    {
        return $this->cloudinary->uploadApi()->upload( $file, [
            'folder' => $this->folder( $folder ),
            'resource_type' => $type,
            'use_filename' => true,
            'unique_filename' => false,
        ] );
    }

    /**
     * @param string $file File to delete.
     * @return ApiResponse
     */
    public function remove( string $file ): ApiResponse
    {
        return $this->cloudinary->uploadApi()->destroy( $file );
    }

    /**
     * @param string|null $folder
     * @return string
     * @throws ApiError
     */
    private function folder( ?string $folder = null ): string
    {
        $cloudinaryFolder = $this->getCloudinaryFolder();

        if ( is_null($folder) ) return $cloudinaryFolder;

        /** @var array $subFolders */
        $subFolders = $this->cloudinary->adminApi()
            ->subFolders( $cloudinaryFolder )
            ->offsetGet('folders');

        $path = sprintf('%s/%s', $cloudinaryFolder, $folder );

        foreach ( $subFolders as $subFolder ) {
            if ( $subFolder['path'] == $path ) {
                return $subFolder['path'];
            }
        }

        $response = $this->cloudinary
            ->adminApi()
            ->createFolder( $path );

        return $response->offsetGet('path');
    }

    private function configuration(): Configuration
    {
        $config = Configuration::instance();

        try {
            $config->cloud->cloudName = $this->containerBag->get('cloudinary.cloudName');
            $config->cloud->apiKey = $this->containerBag->get('cloudinary.apiKey');
            $config->cloud->apiSecret = $this->containerBag->get('cloudinary.apiSecret');
            $config->url->secure = $this->containerBag->get('cloudinary.secure');
        } catch (NotFoundExceptionInterface| ContainerExceptionInterface $ex) {
            $this->logger->error(
                sprintf('%s:class : %s', get_class( $ex), $ex->getMessage())
            );
        }

        return $config;
    }

    private function getCloudinaryFolder(): string
    {
        try {
            return $this->containerBag->get('cloudinary.folder');
        } catch (NotFoundExceptionInterface|ContainerExceptionInterface $ex) {
            $this->logger->error(
                sprintf('%s:class : %s', get_class( $ex), $ex->getMessage())
            );
            throw new \RuntimeException( $ex->getMessage() );
        }
    }

}