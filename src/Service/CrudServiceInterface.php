<?php

namespace App\Service;

/**
 * @template ID
 * @template R
 * @template T
 */
interface CrudServiceInterface
{

    /**
     * @param ID $id
     * @return T
     */
    public function findByID( $id );

    /**
     * @param R $request
     * @return T
     */
    public function create( $request );

    /**
     * @param ID $id
     * @param R $request
     * @return T
     */
    public function edit( $id, $request );

    /**
     * @param ID $id
     * @return void
     */
    public function delete( $id ): void;
}