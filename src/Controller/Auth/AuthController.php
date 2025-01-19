<?php

namespace App\Controller\Auth;

use App\Dto\UserRequest;
use App\Service\Auth\IAuthService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route( path: '/api/auth')]
class AuthController extends AbstractController
{
    public function __construct(
        private readonly IAuthService $authService
    ) {}

    #[Route(path: '/register',name: 'app_auth_register', methods: ['POST'])]
    public function register( Request $request ): JsonResponse

    {
        $data = UserRequest::new([
            'name' => $request->request->get('name'),
            'email' => $request->request->get('email'),
            'password' => $request->request->get('password'),
            'photoProfile' => $request->files->get('photoProfile')
        ]);

        $response = $this->authService->register( $data );

        return $this->json(
            data: $response->toArray(),
            status: Response::HTTP_CREATED,
        );
    }
    #[Route(path: '/profile', name: 'app_auth_profile', methods: ['GET'])]
    public function profile(): JsonResponse
    {
        return $this->json(
            data: ['data' => $this->authService->profile()],
            context: ['groups' => ['user']]
        );
    }

    #[Route(path: '/confirm-account/{token}', name: 'app_confirm_account', methods: ['GET'])]
    public function verifyAccount( string $token ): JsonResponse
    {
        $response = $this->authService->confirmAccount( $token );

        return $this->json(
            data: $response->toArray(),
            status: $response->getStatus()
        );
    }
}