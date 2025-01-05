<?php

namespace App\Utils\Validators;

use App\Exception\BadRequestException;
use Symfony\Component\Validator\Constraint;
use Symfony\Component\Validator\Constraints\GroupSequence;

interface IValidatorService
{

    /**
     * It validates the data and returns to itself.
     *
     * @param mixed $value Value to validate.
     * @param array|Constraint|null $constraints
     * @return static
     */
    public function validate( mixed $value, array|Constraint $constraints = null, string|array|GroupSequence $groups = null ): static;

    /**
     * Returns errors, like an array
     *
     * @return array errors
     */
    public  function getViolationsToArray(): array;

    /**
     * Valid, if it fails throws an BadRequestException.
     *
     * @throws BadRequestException $exception
     * @return void
     */
    public function throwBadRequestException(): void;
    
}
