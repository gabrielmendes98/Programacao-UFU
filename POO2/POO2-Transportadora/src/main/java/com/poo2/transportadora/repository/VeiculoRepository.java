package com.poo2.transportadora.repository;

import com.poo2.transportadora.domain.enums.TipoVeiculo;
import com.poo2.transportadora.domain.veiculo.Veiculo;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VeiculoRepository extends MongoRepository<Veiculo,String> {

    public List<Veiculo> findByTipoVeiculo(TipoVeiculo tipoVeiculo);
}
