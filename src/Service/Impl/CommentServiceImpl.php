<?php

namespace App\Service\Impl;

use App\Dto\CommentRequest;
use App\Entity\Comment;
use App\Exception\NotFoundException;
use App\Repository\CommentRepository;
use App\Repository\PostRepository;
use App\Service\ICommentService;
use App\Utils\Validators\IValidatorService;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\SecurityBundle\Security;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;

class CommentServiceImpl implements ICommentService
{
    private EntityManagerInterface $entityManager;
    private Security $security;
    private PostRepository $postRepository;
    private CommentRepository $commentRepository;
    private IValidatorService $validatorService;

    public function __construct(
        EntityManagerInterface $entityManager,
        Security $security ,
        IValidatorService $validatorService,
        PostRepository $postRepository,
        CommentRepository $commentRepository,
    ) {
        $this->entityManager = $entityManager;
        $this->security = $security;
        $this->validatorService = $validatorService;
        $this->postRepository = $postRepository;
        $this->commentRepository = $commentRepository;
    }

    public function create(CommentRequest $commentDto ): ?Comment
    {
        $this->validatorService->validate( $commentDto )
            ->throwBadRequestException();

        $post = $this->postRepository->findOneBy(['id' => $commentDto->getPostId() ]);

        $comment  = new Comment();
        $comment->setBody( $commentDto->getBody() );
        $comment->setPost( $post );
        $comment->setUser( $this->security->getUser() );

        $this->entityManager->persist( $comment );
        $this->entityManager->flush();

        return $comment;
    }

    public function edit( string $idComment, CommentRequest $commentDto ): ?Comment
    {
        $comment = $this->findCommentById( $idComment );

        if( $comment->getUser() !== $this->security->getUser() ) {
            throw new AccessDeniedException();
        }
        $comment->setBody( $commentDto->getBody() );

        $this->entityManager->persist($comment);
        $this->entityManager->flush();

        return $comment;
    }

    public function delete(string $uuid): void
    {
        $comment = $this->findCommentById( $uuid );

        if( $comment->getUser() !== $this->security->getUser() ) {
            throw new AccessDeniedException();
        }

        $this->entityManager->remove( $comment );
        $this->entityManager->flush();;
    }

    /**
     * Retrieve a Comment using its ID.
     *
     * @param string $uuid ID Comment
     * @return Comment|null Retrieved Commentary
     * @throws NotFoundException
     */
    public function findCommentById( string $uuid ): ?Comment
    {
        $comment = $this->commentRepository->findOneBy(['id' => $uuid ]);
        if ( !$comment ) {
            throw new NotFoundException('Comment not found, with ID: ' . $uuid );
        }
        return $comment;
    }
}