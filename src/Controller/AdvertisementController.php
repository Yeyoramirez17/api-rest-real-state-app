<?php

namespace App\Controller;

use App\Dto\AdvertisementRequest;
use App\Enums\AdvertisementEnum;
use App\Service\IAdvertisementService;
use phpDocumentor\Reflection\Types\This;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route( path: '/api' )]
class AdvertisementController extends AbstractController
{
    public function __construct(
        private readonly IAdvertisementService $advertisementService
    )
    {}

    #[Route( path: '/advertisements/{id}', name: 'app_advertisement_show', methods: 'GET')]
    public function findByID( string $id ): JsonResponse
    {
        return $this->json(
            data: ['data' => $this->advertisementService->findByID( $id ) ],
            status: Response::HTTP_OK,
            context: [
                'groups' => [
                    'advertisement',
                    'advertisement.user',
                    'advertisement.typeProperty',
                    'advertisement.property',
                    'property.images',
                ]
            ]
        );
    }

    #[Route( path: '/advertisements', name: 'app_announcement_create', methods: 'POST')]
    public function create( Request $request ): JsonResponse
    {
        $data = json_decode( $request->getContent(), true);

        $request = AdvertisementRequest::new(
            $data['advertisement']
        );

        return $this->json(
            data: ['data' => $this->advertisementService->create( $request ) ],
            status: Response::HTTP_CREATED,
            context: [
                'groups' => [
                    'advertisement',
                    'advertisement.user',
                    'advertisement.typeProperty',
                    'advertisement.property',
                    'property.images',
                ]
            ]
        );
    }

    #[Route( path: '/advertisements/{id}/edit', name: 'app_announcement_edit', methods: 'PATCH')]
    public function update( Request $request, string $id ): JsonResponse
    {
        $data = json_decode( $request->getContent(), true);

        $request = AdvertisementRequest::new(
            $data['advertisement']
        );

        return $this->json(
            data: ['data' => $this->advertisementService->edit( $id, $request ) ],
            status: Response::HTTP_CREATED,
            context: [
                'groups' => [
                    'advertisement',
                    'advertisement.user',
                    'advertisement.typeProperty',
                    'advertisement.property',
                    'property.images',
                ]
            ]
        );
    }

    #[Route( path: '/advertisements/{id}', name: 'app_advertisement_delete', methods: 'DELETE')]
    public function delete( string $id ): JsonResponse
    {
        $this->advertisementService->delete( $id );

        return $this->json(
            data: null,status:
            Response::HTTP_NO_CONTENT
        );
    }

    #[Route( path: '/advertisements/{id}/add-images', name: 'app_advertisement_add_images', methods: 'POST')]
    public function uploadedImages( Request $request, string $id ): JsonResponse
    {
        $images = $request->files->all('images');

        return $this->json(
            data: ['data' => $this->advertisementService->addImages( $id, $images ) ],
            status: Response::HTTP_OK,
            context: [
                'groups' => [
                    'advertisement',
                    'advertisement.user',
                    'advertisement.typeProperty',
                    'advertisement.property',
                    'property.images',
                ]
            ]
        );
    }

    #[Route(path: '/advertisements/{id}/remove-images', name: 'app_advertisement_remove_images', methods: 'PATCH')]
    public function removeImages( string $id, Request $request ): JsonResponse
    {
        /** @var string[] $images */
        $images = json_decode( $request->getContent(), true)['images'];

        $this->advertisementService->removeImages( $id, $images);

        return $this->json(
            data: null,status:
            Response::HTTP_NO_CONTENT
        );
    }

    #[Route(path: '/advertisements/{id}/publish', name: 'app_advertisement_publish', methods: 'PATCH')]
    public function publishAdvertisement( string $id ): JsonResponse
    {
        return $this->json(
            data: ['data' => $this->advertisementService->publishAdvertisement( $id )],
            status: Response::HTTP_OK
        );
    }
}

