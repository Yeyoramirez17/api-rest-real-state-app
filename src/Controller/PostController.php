<?php

namespace App\Controller;

use App\Dto\PostRequest;
use App\Service\IPostService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Attribute\MapQueryParameter;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;

#[Route( path: '/api')]
class PostController extends AbstractController
{
    private IPostService $postService;
    
    public function __construct(IPostService $postService) {
        $this->postService = $postService;
    }

    #[Route(path: '/posts', name: 'app_posts_find_all', methods: ['GET'])]
    public function findAll(
        #[MapQueryParameter] int $page = 1,
        #[MapQueryParameter] int $limit = 10,
        #[MapQueryParameter] int $offset = 10
    ): JsonResponse
    {
        $posts = $this->postService->findAll( $page, $limit, $offset );
        return $this->json(
            data: $posts,
            context: ['groups' => ['post', 'post_images']]
        );
    }

    #[Route(path: '/posts/{uuid}', name: 'app_post_show' ,methods: ['GET'])]
    public function findById( string $uuid ): JsonResponse
    {
        return $this->json(
            data: ['data' => $this->postService->findById($uuid)],
            context: ['groups' => ['post', 'user_detail_post', 'post_images' ]]
        );
    }

    #[Route(path: '/posts/{uuid}/comments', name: 'app_post_show_with_comments' ,methods: ['GET'])]
    public function findWithCommentsById( string $uuid ): JsonResponse
    {
        return $this->json(
            data: ['data' => $this->postService->findById($uuid)],
            context: ['groups' => ['comments_post', 'user_detail_comment']]
        );
    }

    #[Route(path: '/posts', name: 'app_create_post', methods: ['POST'])]
    public function save( Request $request ): JsonResponse
    {
         $postSaved = $this->postService->save(
             PostRequest::make([
                 'title' => $request->request->get('title'),
                 'body' => $request->request->get('body'),
                 'images' => $request->files->get('images') ?? []
             ])
         );

        return $this->json(
            data: ['data' => $postSaved ],
            status: Response::HTTP_CREATED,
            context: ['groups' => ['post', 'post_images']]
        );
    }

    #[Route(path: '/posts/{uuid}', name: 'app_update_post', methods: 'PUT')]
    public function update( Request $request, string $uuid ): JsonResponse
    {
        $postUpdated = $this->postService->update(
            $uuid,
            PostRequest::make([
                'title' => $request->request->get('title'),
                'body' => $request->request->get('body'),
                'images' => []
            ]),
        );

        return $this->json(
            data: ['data' => $postUpdated],
            status: Response::HTTP_OK,
            context: ['groups' => ['post', 'post_images']]
        );
    }

    #[Route( path: '/posts/{uuid}', name: 'app_delete_post', methods: ['DELETE'])]
    public function delete( string $uuid ): JsonResponse
    {
        $this->postService->delete( $uuid );

        return $this->json(
            data: null,
            status: Response::HTTP_NO_CONTENT
        );
    }

    #[Route( path: '/posts/{uuid}/publish', name: 'app_publish_post', methods: ['PATCH'])]
    public function publishPost( string $uuid ):JsonResponse
    {
        $post = $this->postService->publishPost( $uuid );

        return $this->json(
            data: ['data' => $post],
            status: Response::HTTP_OK,
            context: ['groups' => ['post']]
        );
    }

    #[Route( path: '/posts/{postId}/remove-images', name: 'app_remove_images_post', methods: ['PATCH'])]
    public function removeImage( string $postId, Request $request ): JsonResponse
    {
        $images = json_decode( $request->getContent(), true)['images'];
        $result = $this->postService->removeImages( $postId, $images );

        return $this->json(
            data: ['result' => $result ],
            status: $result ? Response::HTTP_OK : Response::HTTP_NOT_FOUND
        );
    }

    #[Route(path: '/posts/{postId}/add-images', name: 'app_add_images_post', methods: ['POST'])]
    public function addImages( Request $request, string $postId ): JsonResponse
    {
        /** @var UploadedFile[] $images */
        $images = $request->files->all('images');

        return  $this->json(
            data: [ 'data' => $this->postService->addImages( $postId, $images )],
            status: Response::HTTP_OK,
            context: ['groups' => ['post', 'post_images']]
        );
    }

}