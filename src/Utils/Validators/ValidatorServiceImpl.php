<?php

namespace App\Utils\Validators;
use App\Exception\BadRequestException;
use Symfony\Component\Validator\Constraint;
use Symfony\Component\Validator\Constraints\GroupSequence;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class ValidatorServiceImpl implements IValidatorService
{
    private array $violations = [];

    public function __construct( private readonly ValidatorInterface $validator ) {}

    public function validate( mixed $value, array|Constraint $constraints = null, string|array|GroupSequence $groups = null ): static
    {
        $violationsList = $this->validator->validate( $value, $constraints, $groups );

        if ( count($violationsList) > 0 )
        {
            $this->violations = [];
            foreach ($violationsList as $violation) {
                $this->violations[] = [
                    $violation->getPropertyPath() => $violation->getMessage()
                ];
            }
        }
        return $this;
    }

    public function throw( callable $callable ): void
    {
        $callable( $this->violations );
    }
    public function throwBadRequestException(): void
    {
        if ( count($this->violations) > 0) {
            throw new BadRequestException(
                message: "Looks like you've been having validation issues",
                errors: $this->violations
            );
        }
    }

    public  function getViolationsToArray(): array
    {
        return $this->violations;
    }

}
