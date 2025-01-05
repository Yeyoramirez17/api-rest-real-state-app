<?php

namespace App\Utils\Types;

use App\Enums\AdvertisementEnum;
use Doctrine\DBAL\Platforms\AbstractPlatform;
use Doctrine\DBAL\Types\Type;

class AdvertisementType extends Type
{
    private array $values = [
        AdvertisementEnum::RENTING,
        AdvertisementEnum::SELLING,
        AdvertisementEnum::VACATION
    ];

    protected const ADVERTISEMENT_TYPE = 'advertisement_type';

    public function getSQLDeclaration(array $column, AbstractPlatform $platform): string
    {
        $values = array_map( fn (AdvertisementEnum $value ): string => "'{$value->value}'" , $this->values );
        return 'ENUM(' . implode(', ', $values) . ')';
    }

    public function convertToPHPValue($value, AbstractPlatform $platform): ?AdvertisementEnum
    {
        if( is_null( $value )) return null;
        return AdvertisementEnum::getAnnouncementFromString( $value );
    }

    public function convertToDatabaseValue($value, AbstractPlatform $platform)
    {
        /** @var AdvertisementEnum $value */
        if( is_null($value) ) return null;

        if( !in_array( $value, $this->values) ) {
            throw new \InvalidArgumentException( sprintf("Invalid '%s' value", $value->value) );
        }

        return $value->value;
    }

    public function canRequireSQLConversion(): bool
    {
        return true;
    }

    public function requiresSQLCommentHint(AbstractPlatform $platform): bool
    {
        return true;
    }

    public function getName(): string
    {
        return self::ADVERTISEMENT_TYPE;
    }
}
