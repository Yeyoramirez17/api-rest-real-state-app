<?php

namespace Database\Factory;

use App\Entity\ImagePost;
use Doctrine\ORM\EntityRepository;
use Zenstruck\Foundry\ModelFactory;
use Zenstruck\Foundry\Proxy;
use Zenstruck\Foundry\RepositoryProxy;

/**
 * @extends ModelFactory<ImagePost>
 *
 * @method        ImagePost|Proxy create(array|callable $attributes = [])
 * @method static ImagePost|Proxy createOne(array $attributes = [])
 * @method static ImagePost|Proxy find(object|array|mixed $criteria)
 * @method static ImagePost|Proxy findOrCreate(array $attributes)
 * @method static ImagePost|Proxy first(string $sortedField = 'id')
 * @method static ImagePost|Proxy last(string $sortedField = 'id')
 * @method static ImagePost|Proxy random(array $attributes = [])
 * @method static ImagePost|Proxy randomOrCreate(array $attributes = [])
 * @method static EntityRepository|RepositoryProxy repository()
 * @method static ImagePost[]|Proxy[] all()
 * @method static ImagePost[]|Proxy[] createMany(int $number, array|callable $attributes = [])
 * @method static ImagePost[]|Proxy[] createSequence(iterable|callable $sequence)
 * @method static ImagePost[]|Proxy[] findBy(array $attributes)
 * @method static ImagePost[]|Proxy[] randomRange(int $min, int $max, array $attributes = [])
 * @method static ImagePost[]|Proxy[] randomSet(int $number, array $attributes = [])
 */
final class ImagePostFactory extends ModelFactory
{
    /**
     * @see https://symfony.com/bundles/ZenstruckFoundryBundle/current/index.html#factories-as-services
     *
     * @todo inject services if required
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * @see https://symfony.com/bundles/ZenstruckFoundryBundle/current/index.html#model-factories
     *
     * @todo add your default values here
     */
    protected function getDefaults(): array
    {
        $image = self::faker()->unique()->imageUrl;
        return [
            'name' => $image,
            'imageUrl' => $image,
            'publicId' => $image
        ];
    }

    /**
     * @see https://symfony.com/bundles/ZenstruckFoundryBundle/current/index.html#initialization
     */
    protected function initialize(): self
    {
        return $this
            // ->afterInstantiate(function(ImagePost $imagePost): void {})
        ;
    }

    protected static function getClass(): string
    {
        return ImagePost::class;
    }
}
