package com.poo2.transportadora.service;

import com.poo2.transportadora.domain.constantes.Constantes;
import com.poo2.transportadora.domain.constantes.ConstantesDAO;
import com.poo2.transportadora.domain.enums.TipoItem;
import com.poo2.transportadora.domain.enums.TipoVeiculo;
import com.poo2.transportadora.domain.pedido.Pedido;
import com.poo2.transportadora.domain.veiculo.Veiculo;
import com.poo2.transportadora.repository.ConstantesDAORepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ConstantesService {

    @Autowired
    ConstantesDAORepository constantesDAORepository;


    /**
     * Calcula o frete dado um veiculo  um pedido
     * @param veiculo
     * @param pedido
     * @return
     */
    public double CalculaFrete(Veiculo veiculo, Pedido pedido){
        Constantes constantes = Constantes.getInstance();
        this.atualizaValores(); // ATUALIZA OS VALORES ANTES DE REALIZAR O CALCULO
        if (veiculo.getTipoItemsCarregados().contains(TipoItem.RADIOATIVO) || veiculo.getTipoItemsCarregados().contains(TipoItem.TOXICO))
            return calculoFinal(constantes.getMultiplicadorTipoRadioativoEToxico(),pedido,veiculo);
        if (veiculo.getTipoItemsCarregados().contains(TipoItem.INFLAMAVEL))
            return calculoFinal(constantes.getMultiplicadorTipoInflamavel(),pedido,veiculo);
        if (veiculo.getTipoItemsCarregados().contains(TipoItem.NORMAL) || veiculo.getTipoItemsCarregados().contains(TipoItem.NORMAL))
            return calculoFinal(constantes.getMultiplicadorTipoNormalELiquido(),pedido,veiculo);
        return 0.00;
    }

    public double getTaxaConversao(){
        this.atualizaValores();
        return Constantes.getInstance().getTaxaConversaoReiasPontos();
    }

    private Double calculoFinal(Double multiplicador, Pedido pedido, Veiculo veiculo){
        Constantes constantes = Constantes.getInstance();
        Integer distancia = calculaDistancia(pedido,veiculo);
        Double peso = pedido.getPesoTotal();
        if(veiculo.getTipoVeiculo()==TipoVeiculo.EXPRESS10)
            return multiplicador*distancia*constantes.getRealPorDistanciaExpress10()*peso;
        if(veiculo.getTipoVeiculo()==TipoVeiculo.SARVE)
            return multiplicador*distancia*constantes.getRealPorDistanciaSarve()*peso;
        if(veiculo.getTipoVeiculo()==TipoVeiculo.NORMAL)
            return multiplicador*distancia*constantes.getRealPorDistanciaNormal()*peso;
        return 0.0;
    }

    private Integer calculaDistancia(Pedido pedido, Veiculo veiculo){
        Integer cidadeDestino = veiculo.getRota().getCidades().indexOf(pedido.getCidadeDestino());
        Integer cidadePartida = veiculo.getRota().getCidades().indexOf(pedido.getCidadePartida());
        return cidadeDestino-cidadePartida;
    }

    private void atualizaValores(){ // Atualiza os valores das constantes com base nos valores da base de dados
        ConstantesDAO constantesDAO;
        constantesDAO = constantesDAORepository.findAll().get(0);
        Constantes constantes = Constantes.getInstance();
        constantes.setMultiplicadorTipoInflamavel(constantesDAO.getMultiplicadorTipoInflamavel());
        constantes.setMultiplicadorTipoNormalELiquido(constantesDAO.getMultiplicadorTipoNormalELiquido());
        constantes.setMultiplicadorTipoRadioativoEToxico(constantesDAO.getMultiplicadorTipoRadioativoEToxico());
        constantes.setRealPorDistanciaExpress10(constantesDAO.getRealPorDistanciaExpress10());
        constantes.setRealPorDistanciaNormal(constantesDAO.getRealPorDistanciaNormal());
        constantes.setRealPorDistanciaSarve(constantesDAO.getRealPorDistanciaSarve());
        constantes.setTaxaConversaoReiasPontos(constantesDAO.getTaxaConversaoReiasPontos());
    }
}
