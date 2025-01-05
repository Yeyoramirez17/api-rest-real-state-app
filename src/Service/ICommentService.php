<?php

namespace App\Service;

use App\Dto\CommentRequest;
use App\Entity\Comment;

interface ICommentService
{
    /**
     * @param CommentRequest $commentDto
     * @return Comment|null
     */
    public function create( CommentRequest $commentDto ): ?Comment;

    /**
     * @param string $idComment
     * @param CommentRequest $commentDto
     * @return Comment|null
     */
    public function edit( string $idComment, CommentRequest $commentDto ): ?Comment;

    /**
     * @param string $uuid
     * @return void
     */
    public function delete( string $uuid ): void;
}