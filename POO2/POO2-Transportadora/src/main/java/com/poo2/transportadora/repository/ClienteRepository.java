package com.poo2.transportadora.repository;

import com.poo2.transportadora.domain.cliente.Cliente;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ClienteRepository extends MongoRepository<Cliente,String> {

    @Query("{ 'cpfOuCnpj': { $regex: ?0, $options: 'i' } }")
    Optional<Cliente> findByCpfOrCnPj(String cpfOuCnpj);
}
