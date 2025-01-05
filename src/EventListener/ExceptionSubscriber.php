<?php

namespace App\EventListener;

use App\Dto\ResponseDto;
use App\Exception\AppHttpException;
use Lexik\Bundle\JWTAuthenticationBundle\Events;
use Psr\Log\LoggerInterface;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Event\ExceptionEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;

class ExceptionSubscriber implements EventSubscriberInterface
{
    public function __construct( private readonly LoggerInterface $logger ) {}

    public static function getSubscribedEvents(): array
    {
        return [
            KernelEvents::EXCEPTION => [
                ['onKernelException', 2]
            ]
        ];
    }

    public function onKernelException( ExceptionEvent $event ): void
    {
        $exception = $event->getThrowable();

        $message = sprintf('%s:class : %s', get_class( $exception ), $exception->getMessage());
        $this->logger->error( $message );

        $data = new ResponseDto();

        if ( $exception instanceof AccessDeniedException) {
            $data ->status( Response::HTTP_FORBIDDEN )
                ->message( $exception->getMessage() );

        } elseif ( $exception instanceof AppHttpException ) {
            $data->status(  $exception->getStatusCode() )
                ->message( $exception->getMessage())
                ->errors( $exception->getErrors() );
        } else {
            $data->status( Response::HTTP_INTERNAL_SERVER_ERROR )
                ->message( $exception->getMessage() );
        }

        $event->setResponse(new JsonResponse( $data->toArray() , $data->getStatus() ));
    }

}