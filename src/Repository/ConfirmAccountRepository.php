<?php

namespace App\Repository;

use App\Entity\ConfirmAccount;
use App\Entity\User;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<ConfirmAccount>
 *
 * @method ConfirmAccount|null find($id, $lockMode = null, $lockVersion = null)
 * @method ConfirmAccount|null findOneBy(array $criteria, array $orderBy = null)
 * @method ConfirmAccount[]    findAll()
 * @method ConfirmAccount[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ConfirmAccountRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ConfirmAccount::class);
    }

//    /**
//     * @return ConfirmationAccount[] Returns an array of ConfirmationAccount objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('c')
//            ->andWhere('c.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('c.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

    public function findUserByTokenConfirmation( string $token ): ?User
    {
        $entityManager = $this->getEntityManager();
        $qb = $entityManager->createQueryBuilder();

        $dql = $qb->select('u')
            ->from('App\Entity\User', 'u')
            ->where('c.token = :token')
            ->join('App\Entity\ConfirmAccount', 'c', Join::WITH, 'c.user = u.id' )
            ->setParameter('token', $token)
            ->getQuery();

        return $dql->getOneOrNullResult();
    }
}
