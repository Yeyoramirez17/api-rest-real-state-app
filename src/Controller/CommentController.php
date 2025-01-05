<?php

namespace App\Controller;

use App\Dto\CommentRequest;
use App\Service\ICommentService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route(path: '/api')]
class CommentController extends AbstractController
{
    public function __construct( private readonly ICommentService $commentService ) { }

    #[Route('/comments', name: 'app_create_comment', methods: ['POST'])]
    public function createComment( Request $request ): JsonResponse
    {
        $commentDto = CommentRequest::new([
            'body' => $request->request->get('body'),
            'postId' => $request->request->get('postId'),
        ]);

        return $this->json(
            data: [ 'data' => $this->commentService->create( $commentDto ) ],
            status: Response::HTTP_CREATED,
            context: ['groups' => ['comments_post']]
        );
    }

    #[Route( path: '/comments/{idComment}/edit', name: 'app_edit_comment',methods: 'PATCH' )]
    public function editComment( Request $request, string $idComment ): JsonResponse
    {
        $data = json_decode($request->getContent(), true );

        $commentRequest = CommentRequest::new([
            'body' => $data['body'],
            'postId' => $data['postId'],
        ]);

        return $this->json(
            data: [ 'data' => $this->commentService->edit( $idComment, $commentRequest) ],
            status: Response::HTTP_OK,
            context: ['groups' => ['comments_post']]
        );
    }

    #[Route(path: '/comments/{idComment}/delete', name: 'app_delete_comment', methods: 'DELETE')]
    public function deleteComment( string $idComment ):  JsonResponse
    {
        $this->commentService->delete( $idComment );

        return $this->json(
            data: null,
            status: Response::HTTP_NO_CONTENT
        );
    }
}
