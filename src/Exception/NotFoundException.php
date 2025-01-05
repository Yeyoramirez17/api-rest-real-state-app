<?php

namespace App\Exception;

use Symfony\Component\HttpFoundation\Response;

final class NotFoundException extends AppHttpException
{
    public function __construct(string $message = '',string|array $errors = '',\Throwable $previous = null,array $headers = [],int $code = 0)
    {
        $message = ( strlen($message) > 0 ) ? $message : "I don't know how to find the requested resource";
        $errors = is_array($errors) ? $errors : [ $errors ];

        parent::__construct( Response::HTTP_NOT_FOUND, $message, $errors, $previous, $headers, $code );
    }
}
