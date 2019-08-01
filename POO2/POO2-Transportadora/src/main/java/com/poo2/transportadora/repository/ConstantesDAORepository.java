package com.poo2.transportadora.repository;

import com.poo2.transportadora.domain.constantes.ConstantesDAO;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ConstantesDAORepository extends MongoRepository<ConstantesDAO,String> {
}
