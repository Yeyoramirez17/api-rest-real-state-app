<?php
namespace App\Enums;

enum AdvertisementEnum: string
{
    case SELLING = 'Selling';
    case RENTING = 'Renting';
    case VACATION = 'Vacation';

    public static function getAnnouncementFromString( string $type ): AdvertisementEnum
    {
        return match ( $type ) {
            self::VACATION->value => self::VACATION,
            self::RENTING->value => self::RENTING,
            self::SELLING->value => self::SELLING,
        };
    }

    public static function valuesToArray(): array
    {
        return array_map( fn (AdvertisementEnum $enum ): string => $enum->value , self::cases() );
    }
}
