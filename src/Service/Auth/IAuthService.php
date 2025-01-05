<?php

namespace App\Service\Auth;

use App\Dto\ResponseDto;
use App\Dto\UserRequest;
use Symfony\Component\Security\Core\User\UserInterface;

interface IAuthService
{
    /**
     * Saves user information.
     *
     * @param UserRequest $request
     * @return ResponseDto
     */
    public function register(UserRequest $request ): ResponseDto;

    /**
     * Retrieves the information of a currently authenticated user.
     *
     * @return UserInterface|null
     */
    public function profile(): ?UserInterface;

    /**
     * @param string $token
     * @return ResponseDto
     */
    public function confirmAccount( string $token ): ResponseDto;
}