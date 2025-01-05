<?php
namespace App\Exception;

use Symfony\Component\HttpFoundation\Response;

final class BadRequestException extends AppHttpException
{
    public function __construct(string $message = '', string|array $errors = '',\Throwable $previous = null,array $headers = [],int $code = 0)
    {
        $message = ( strlen($message) > 0 ) ? $message : "Request failed, please try again.";
        $errors = is_array($errors) ? $errors : [ $errors ];

        parent::__construct( Response::HTTP_BAD_REQUEST, $message, $errors, $previous, $headers, $code );
    }
}
