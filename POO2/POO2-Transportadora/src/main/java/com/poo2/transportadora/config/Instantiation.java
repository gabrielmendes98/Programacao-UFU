package com.poo2.transportadora.config;

import com.poo2.transportadora.controller.ClientController;
import com.poo2.transportadora.controller.PedidoController;
import com.poo2.transportadora.domain.enums.StatusVeiculo;
import com.poo2.transportadora.domain.enums.TipoItem;
import com.poo2.transportadora.domain.enums.TipoVeiculo;
import com.poo2.transportadora.domain.pedido.ItemPedido;
import com.poo2.transportadora.domain.pedido.Pedido;
import com.poo2.transportadora.domain.requests.ClienteRequest;
import com.poo2.transportadora.domain.cliente.Localidade;
import com.poo2.transportadora.domain.constantes.ConstantesDAO;
import com.poo2.transportadora.domain.enums.TipoCliente;
import com.poo2.transportadora.domain.requests.PedidoRequest;
import com.poo2.transportadora.domain.veiculo.Rota;
import com.poo2.transportadora.domain.veiculo.Veiculo;
import com.poo2.transportadora.domain.veiculo.VeiculoPequeno;
import com.poo2.transportadora.repository.*;
import com.poo2.transportadora.service.ConstantesService;
import com.poo2.transportadora.service.ClienteService;
import com.poo2.transportadora.service.PedidoService;
import com.poo2.transportadora.service.VeiculoService;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.core.aggregation.ArrayOperators;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Configuration
public class Instantiation implements CommandLineRunner {

    @Autowired
    ConstantesDAORepository constantesDAORepository;

    @Autowired
    RotaRepository rotaRepository;

    @Autowired
    ClienteRepository clienteRepository;

    @Autowired
    ClienteService clienteService;

    @Autowired
    VeiculoRepository veiculoRepository;

    @Autowired
    ConstantesService constantesService;

    @Autowired
    ClientController clientController;

    @Autowired
    PedidoService pedidoService;

    @Autowired
    PedidoRepository pedidoRepository;

    @Autowired
    PedidoController pedidoController;

    @Autowired
    VeiculoService veiculoService;

    @Override
    public void run(String... args) throws Exception {
        constantesDAORepository.deleteAll();
//        veiculoRepository.deleteAll();
        ConstantesDAO constantesDAO = new ConstantesDAO();
        constantesDAO.setMultiplicadorTipoInflamavel(2.0);
        constantesDAO.setMultiplicadorTipoNormalELiquido(2.0);
        constantesDAO.setMultiplicadorTipoRadioativoEToxico(2.0);
        constantesDAO.setRealPorDistanciaExpress10(2.0);
        constantesDAO.setRealPorDistanciaNormal(2.0);
        constantesDAO.setRealPorDistanciaSarve(2.0);
        constantesDAO.setTaxaConversaoReiasPontos(2.0);
        constantesDAORepository.save(constantesDAO);
//        Rota rota = new Rota();
//        rota.setCidades(Arrays.asList("Uberlandia", "Pedrinopolis", "Montes Claros"));
//        rotaRepository.deleteAll();
//        rotaRepository.save(rota);
////        System.out.println(rotaRepository.findAll().get(0).getCidades());
////        System.out.println(constantesDAORepository.findAll().get(0).getMultiplicadorTipoInflamavel());
//        Constantes constantes = Constantes.getInstance();
//        constantes.atualizaValores(constantesDAORepository);
//        System.out.println(constantes.toString());
//
//        cliente cliente = new ClienteOuro();
//        cliente.setCpfOuCnpj("10837316618");
//        clienteRepository.save(cliente);
//
//        pedidoRepository.deleteAll();
//        Pedido pedido = new ItemPedido();
//        pedido.setValor(0.00);
//        pedido.setTipoItems(Arrays.asList(TipoItem.INFLAMAVEL));
//        pedido.setCidadePartida("uberlandia");
//        pedido.setCidadeDestino("pedrinopolis");
//        pedido.setPesoTotal(15.00);
//        pedido.setCliente(clienteRepository.findByCpfOrCnPj("10837316618").get());
//        pedido.setVeiculo(veiculoRepository.findById("0").get());
//        pedidoRepository.insert(pedido);
//
        pedidoRepository.deleteAll();
        PedidoRequest pedidoRequest = new PedidoRequest();
        pedidoRequest.setCidadePartida("uberlandia");
        pedidoRequest.setCidadeDestino("pedrinopolis");
        pedidoRequest.setPesoTotal(5.00);
        pedidoRequest.setTipoItems(Arrays.asList(TipoItem.INFLAMAVEL));
        pedidoController.efetuaPedido(pedidoRequest,veiculoRepository.findById("0").get(),clienteRepository.findByCpfOrCnPj("10837316618").get());

//        Veiculo veiculo = veiculoRepository.findById("1").get();
//        veiculo.alocaPedido(pedidoRepository.findAll().get(0));
//        veiculoService.update(veiculo);

        //
//        System.out.println(pedidoController.valorPedido(pedidoRequest).getVeiculo().getIdVeiculo());
//        pedidoController.efetuaPedido(pedidoRequest,pedidoController.valorPedido(pedidoRequest).getVeiculo(),clienteRepository.findByCpfOrCnPj("10837316618").get());

        //
//        veiculoRepository.deleteAll();
//        Veiculo veiculo = new VeiculoPequeno(
//                Arrays.asList(TipoItem.INFLAMAVEL),
//                new Rota(
//                        "1",
//                        Arrays.asList("uberlandia","santa juliana","pedrinopolis")),
//                "uberlandia",
//                0.00,
//                15.00);
//        Veiculo veiculo1 = new VeiculoPequeno(
//                Arrays.asList(TipoItem.INFLAMAVEL),
//                new Rota(
//                        "1",
//                        Arrays.asList("uberlandia","santa juliana","pedrinopolis")),
//                "uberlandia",
//                0.00,
//                16.00);
//        Veiculo veiculo2 = new VeiculoPequeno(
//                Arrays.asList(TipoItem.INFLAMAVEL),
//                new Rota(
//                        "1",
//                        Arrays.asList("uberlandia","santa juliana","pedrinopolis")),
//                "uberlandia",
//                0.00,
//                15.00);
//        veiculo.setIdVeiculo("0");
//        veiculo1.setIdVeiculo("1");
//        veiculo2.setIdVeiculo("2");
//        veiculo1.setStatusVeiculo(StatusVeiculo.INDO);
//        veiculo.setStatusVeiculo(StatusVeiculo.INDO);
//        veiculo2.setStatusVeiculo(StatusVeiculo.INDO);
//
//        veiculo.setTipoVeiculo(TipoVeiculo.NORMAL);
//        veiculo1.setTipoVeiculo(TipoVeiculo.EXPRESS10);
//        veiculo2.setTipoVeiculo(TipoVeiculo.SARVE);
//        veiculo.setPedidosCarregados(new ArrayList<>());
//        veiculo1.setPedidosCarregados(new ArrayList<>());
//        veiculo2.setPedidosCarregados(new ArrayList<>());
//        veiculoRepository.saveAll(Arrays.asList(veiculo,veiculo1,veiculo2));


////
//        List<veiculo> veiculo4 = veiculoRepository.findAll();
////

//
//        PedidoRequest pedidoRequest = new PedidoRequest("pedrinopolis","uberlandia",15.00,Arrays.asList(TipoItem.INFLAMAVEL));
//        pedidoService.adicionaPedido(pedidoRequest,veiculoRepository.findById("1").get());
        //
//        Optional<Veiculo> veiculo = veiculoRepository.findById("0");
//
//        Optional<Veiculo> veiculo1 = veiculoRepository.findById("1");
//
//        Optional<Veiculo> veiculo2 = veiculoRepository.findById("2");
//
//        veiculo.get().setNext(veiculo1.get());
//        veiculo.get().setNext(veiculo2.get());

//        System.out.println(veiculoRepository.findByTipoVeiculo(Tip));
//        System.out.println(veiculo1.get().podeEfetuarEntrega(pedido));
//        System.out.println(veiculo2.get().podeEfetuarEntrega(pedido));
////        System.out.println(veiculo1.get().verificaDestinos("pedrinopolis"));

//        System.out.println(veiculo.get().buscaVeiculo(pedido).getIdVeiculo());
//
//        System.out.println(constantes.CalculaFrete(veiculo,pedido, TipoVeiculo.EXPRESS10,constantesDAORepository));
//        System.out.println(constantes.getMultiplicadorTipoInflamavel());
//
//        clienteRepository.deleteAll();90
//
//        cliente cliente1 = new ClienteOuro();
//        cliente1.setNome("Yanzim");
//        cliente1.setCpfOuCnpj("10837316618");
//        cliente1.setPedidos(Arrays.asList(pedido));
//        System.out.println(cliente1.getCpfOuCnpj());
//        clienteService.insert(cliente1);

//        System.out.println(veiculo.verificaDestinos("santa juliana"));
//        System.out.println(veiculo.podeEfetuarEntrega(pedido));
//        System.out.println(veiculo.calculaDistancia(pedido));
//        System.out.println(constantesDAORepository.findAll());
       // constantesService.atualizaValores();
//        ClienteRequest clienteRequest1 = new ClienteRequest("juret","10837316618",25.0,new Localidade(),new ArrayList<>(),TipoCliente.BRONZE);
//        clientController.insereCliente(clienteRequest1, TipoCliente.OURO);
//        ClienteRequest clienteRequest = new ClienteRequest("dias", "10837316618", 22.22, new Localidade(), new ArrayList<>(),TipoCliente.BRONZE);
////
//        System.out.println(clienteService.findByCpf("10837316618").getNome());
//        System.out.println(clientController.procuraCliente("10837316618").getNome());
//        System.out.println("Chamando metodo de atualizar");
//        clientController.atualizaCliente(clienteRequest);
//        System.out.println(clientController.procuraCliente("10837316618").getNome());

//        System.out.println(constantesService.getTaxaConversao());
//        System.out.println(Constantes.getInstance().getMultiplicadorTipoInflamavel());

    }
}
