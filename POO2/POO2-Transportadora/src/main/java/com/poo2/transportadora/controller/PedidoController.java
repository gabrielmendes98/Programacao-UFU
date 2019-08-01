package com.poo2.transportadora.controller;

import com.poo2.transportadora.domain.cliente.Cliente;
import com.poo2.transportadora.domain.pedido.Pedido;
import com.poo2.transportadora.domain.requests.PedidoRequest;
import com.poo2.transportadora.domain.responses.PedidoResponse;
import com.poo2.transportadora.domain.veiculo.Veiculo;
import com.poo2.transportadora.service.PedidoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class PedidoController {

    @Autowired
    private PedidoService pedidoService;

    /**
     * Retorna um objeto de Resposta com os valores para realizar a entrega, para que o cliente selecione qual veiculo ultilizar
     * @param pedidoRequest
     * @return
     */
    public PedidoResponse valorPedido(PedidoRequest pedidoRequest){
        PedidoResponse pedidoResponse = new PedidoResponse();
        Pedido pedido = pedidoRequest.toPedido();

        Veiculo veiculo = pedidoService.buscaVeiculo(pedidoRequest.toPedido());

        pedidoResponse.setVeiculo(veiculo);
        pedidoResponse.setValor(pedidoService.calculaPreco(pedido,veiculo));
        pedidoResponse.setValorEmPontos(pedidoService.calculaPrecoEmPontos(pedido,veiculo));
        pedidoResponse.setPedido(pedidoRequest);

        return pedidoResponse;
    }

    /**
     * Metodo que efetua um pedido
     * @param pedidoRequest
     * @param veiculo
     * @param cliente
     * @return
     */
    public boolean efetuaPedido(PedidoRequest pedidoRequest, Veiculo veiculo, Cliente cliente){
        return pedidoService.adicionaPedido(pedidoRequest.toPedido(),veiculo,cliente);
    }

}
