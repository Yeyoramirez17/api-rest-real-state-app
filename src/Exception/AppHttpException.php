<?php

namespace App\Exception;

use Symfony\Component\HttpKernel\Exception\HttpExceptionInterface;

class AppHttpException extends \RuntimeException implements HttpExceptionInterface
{
    private int $statusCode;
    private array $headers;
    private array $errors;
    public function __construct(int $statusCode,string $message = '',array $errors = [],\Throwable $previous = null,array $headers = [],int $code = 0)
    {
        $this->statusCode = $statusCode;
        $this->headers = $headers;
        $this->errors = $errors;

        parent::__construct( $message, $code, $previous );
    }

    public function getErrors(): array 
    {
        return $this->errors;
    }

    public function getStatusCode(): int
    {
        return $this->statusCode;
    }

    public function getHeaders(): array
    {
        return $this->headers;
    }
}
