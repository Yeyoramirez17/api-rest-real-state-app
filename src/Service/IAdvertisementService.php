<?php

namespace App\Service;

use App\Dto\AdvertisementRequest;
use App\Entity\Advertisement;

interface IAdvertisementService extends CrudServiceInterface
{
    public function addImages( string $id, array $images ): ?Advertisement;
    public function removeImages( string $id, array $images ):void;
    public function publishAdvertisement( string $id ): bool;
}
