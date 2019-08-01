package com.poo2.transportadora.repository;

import com.poo2.transportadora.domain.veiculo.Rota;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RotaRepository extends MongoRepository<Rota, String> {
}
