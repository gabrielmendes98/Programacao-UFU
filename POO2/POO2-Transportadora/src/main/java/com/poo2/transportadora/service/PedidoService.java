package com.poo2.transportadora.service;

import com.poo2.transportadora.domain.cliente.Cliente;
import com.poo2.transportadora.domain.enums.TipoVeiculo;
import com.poo2.transportadora.domain.pedido.Pedido;
import com.poo2.transportadora.domain.requests.PedidoRequest;
import com.poo2.transportadora.domain.veiculo.Veiculo;
import com.poo2.transportadora.repository.PedidoRepository;
import com.poo2.transportadora.repository.VeiculoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class PedidoService {


    @Autowired
    private VeiculoService veiculoService;

    @Autowired
    private ConstantesService constantesService;

    @Autowired
    private PedidoRepository pedidoRepository;

    @Autowired
    private ClienteService clienteService;

    /**
     * Metodo Responsavel por buscar um veiculo para realizar um pedido passado
     * @param pedido
     * @return
     */
    //TODO MUDAR PARAMETRO PARA UM PEDIDO REQUEST
    public Veiculo buscaVeiculo(Pedido pedido){
        List<Veiculo> veiculoList = veiculoService.findAll();

        for(Integer i = 0; i<veiculoList.size()-1; i++){
            veiculoList.get(i).setNext(veiculoList.get(i+1));
        }

        return veiculoList.get(0).buscaVeiculo(pedido);
    }

//    //Versao com tipo de veiculo
//    private Veiculo buscaVeiculoNormal(Pedido pedido, TipoVeiculo tipoVeiculo){
//        List<Veiculo> veiculoList = new ArrayList<>();
//        if(tipoVeiculo == TipoVeiculo.NORMAL)
//            veiculoList = veiculoRepository.findByTipoVeiculo(TipoVeiculo.NORMAL);
//        if(tipoVeiculo == TipoVeiculo.SARVE)
//            veiculoList = veiculoRepository.findByTipoVeiculo(TipoVeiculo.SARVE);
//        if(tipoVeiculo == TipoVeiculo.EXPRESS10)
//            veiculoList = veiculoRepository.findByTipoVeiculo(TipoVeiculo.EXPRESS10);
//
//        for(Integer i = 0; i<veiculoList.size()-1; i++){
//            veiculoList.get(i).setNext(veiculoList.get(i+1));
//        }
//
//        return veiculoList.get(0).buscaVeiculo(pedido);
//    }


    /**
     * Metodo Reponsavel por retornar o valor do frete para que o cliente escolha o veiculo de entrega
     * @param pedido
     * @param veiculo
     * @return
     */
    public Double calculaPreco(Pedido pedido, Veiculo veiculo){
        return constantesService.CalculaFrete(veiculo,pedido);
    }

    /**
     * Metodo Reponsavel por retornar o valor do frete em pontos para que o cliente escolha o veiculo de entrega
     * @param pedido
     * @param veiculo
     * @return
     */
    public Double calculaPrecoEmPontos(Pedido pedido, Veiculo veiculo){
        return constantesService.CalculaFrete(veiculo,pedido)*constantesService.getTaxaConversao();
    }

    /**
     * Metodo Responsavel por Validar um pedido, atualiza valores do veiculo, adiciona observador do veiculo, adiciona pedido na DB
     * @param pedidoRequest
     * @param veiculo
     * @return
     */
    public Boolean adicionaPedido(Pedido pedidoRequest, Veiculo veiculo, Cliente cliente){
        Pedido pedido = constroiPedido(pedidoRequest,veiculo,cliente);


        pedidoRepository.insert(pedido);

        Pedido pedidoAux = pedidoRepository.findById(pedido.getIdPedido()).get();

        veiculo.alocaPedido(pedidoAux);
        cliente.ganhaPontos(pedidoAux);
        cliente.adicionaPedido(pedidoAux);

        veiculoService.update(veiculo);
        clienteService.update(cliente);

        return true;
    }



    /**
     * Metodo que controi um pedido
     * @param pedidoRequest
     * @param veiculo
     * @return
     */
    public Pedido constroiPedido(Pedido pedidoRequest, Veiculo veiculo, Cliente cliente){
        Pedido pedido = pedidoRequest; //construcao do pedido

        Double valorPedido = constantesService.CalculaFrete(veiculo,pedido);

        pedido.setValor(valorPedido);
        pedido.setValoEmPontos(valorPedido*constantesService.getTaxaConversao());
        pedido.setVeiculo(veiculo);
        pedido.setCliente(cliente);

        return pedido;
    }

    public Pedido find(String id){
        Optional<Pedido> obj = pedidoRepository.findById(id);
        return obj.orElseThrow(() -> new RuntimeException(
                "Pedido nao encontrado"
        ));
    }

    public Pedido update(Pedido pedido){
        Pedido newPedido = find(pedido.getIdPedido());
        updateData(newPedido, pedido);
        return pedidoRepository.save(newPedido);
    }

    //TODO terminar esse update
    private void updateData(Pedido newPedido, Pedido Pedido){
        newPedido.setCidadeAtual(Pedido.getCidadeAtual());
    }


}
