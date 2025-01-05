<?php
namespace App\Dto;
use Symfony\Component\HttpFoundation\Response;

class ResponseDto
{
    private array $content = [];

    public function __construct( mixed $data = null )
    {
        if ( $data ) $this->content['data'] = $data;

        $this->content['type'] = Response::$statusTexts[ 200 ];
        $this->content['status'] = 200;
        $this->content['message'] = null;
    }

    public static function make( mixed $data = null ): ResponseDto
    {
        return new self( $data );
    }

    public function data( mixed $data ): ResponseDto
    {
        $this->content['data'] = $data;
        return $this;
    }

    public function message( string $message ): ResponseDto
    {
        unset( $this->content['message']);
        $this->content['message'] = $message;
        return $this;
    }

    public function status( int $status ): ResponseDto
    {
        unset( $this->content['status']);
        unset( $this->content['type']);

        $this->content['status'] = $status;
        $this->content['type'] = Response::$statusTexts[ $status ];
        return $this;
    }

    public function errors( array $errors = null ): ResponseDto
    {
        if( $errors ) $this->content['errors'] = $errors;
        return $this;
    }

    public function toArray(): array
    {
        return $this->content;
    }

    public function getStatus(): ?int
    {
        return $this->content['status'];
    }

    public function getMessage(): ?string
    {
        return $this->content['message'];
    }

}