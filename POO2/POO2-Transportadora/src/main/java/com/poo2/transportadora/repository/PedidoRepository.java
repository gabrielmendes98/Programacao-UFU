package com.poo2.transportadora.repository;

import com.poo2.transportadora.domain.pedido.Pedido;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PedidoRepository extends MongoRepository<Pedido,String> {
}
