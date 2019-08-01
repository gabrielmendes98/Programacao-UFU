package com.poo2.transportadora.service;

import com.poo2.transportadora.domain.cliente.Cliente;
import com.poo2.transportadora.domain.veiculo.Veiculo;
import com.poo2.transportadora.repository.VeiculoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class VeiculoService {

    @Autowired
    VeiculoRepository veiculoRepository;

    public List<Veiculo> findAll(){
        return veiculoRepository.findAll();
    }

    /**
     * Retorna Veiculo pelo ID
     * @param id
     * @return
     */
    public Veiculo find(String id){
        Optional<Veiculo> obj = veiculoRepository.findById(id);
        return obj.orElseThrow(() -> new RuntimeException(
                "Veiculo nao encontrado"
        ));
    }

    /**
     * Insere um veiculo no banco de dados
     * @param veiculo
     * @return
     */
    public Veiculo insert(Veiculo veiculo){
        veiculo.setIdVeiculo(null);
        return veiculoRepository.insert(veiculo);
    }

    public Veiculo update(Veiculo veiculo){
        Veiculo newVeiculo = find(veiculo.getIdVeiculo());
        updateData(newVeiculo,veiculo);
        return veiculoRepository.save(newVeiculo);
    }

    //TODO terminar esse update
    private void updateData(Veiculo newVeiculo, Veiculo veiculo){
        newVeiculo.setCidadeAtual(veiculo.getCidadeAtual());
        newVeiculo.setPedidosCarregados(veiculo.getPedidosCarregados());
    }

}
