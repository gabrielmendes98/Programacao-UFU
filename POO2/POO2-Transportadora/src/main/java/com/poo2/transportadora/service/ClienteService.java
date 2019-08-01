package com.poo2.transportadora.service;

import com.poo2.transportadora.repository.ClienteRepository;
import com.poo2.transportadora.domain.cliente.Cliente;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class ClienteService {

    @Autowired
    ClienteRepository clienteRepository;

    /**
     * Retorna um cliente pelo ID
     * @param id
     * @return
     */
    public Cliente find(String id){
        Optional<Cliente> obj = clienteRepository.findById(id);
        return obj.orElseThrow(() -> new RuntimeException(
                "cliente nao encontrado"
        ));
    }

    public Cliente findByCpf(String cpf){
        Optional<Cliente> obj = clienteRepository.findByCpfOrCnPj(cpf);
        return obj.orElseThrow(() -> new RuntimeException(
                "cliente nao encontrado"
        ));
    }

    /**
     * Insere um cliente no banco de dados
     * @param cliente
     * @return
     */
    public Cliente insert(Cliente cliente){
        cliente.setIdCliente(null);
        return clienteRepository.insert(cliente);
    }

    /**
     * Atualiza os dados de um cliente
     * @param cliente
     * @return
     */
    public Cliente update(Cliente cliente){
        Cliente newCliente = findByCpf(cliente.getCpfOuCnpj());
        updateData(newCliente, cliente);
        return clienteRepository.save(newCliente);
    }

    private void updateData(Cliente newCliente, Cliente cliente){
        newCliente.setLocalidade(cliente.getLocalidade());
        newCliente.setNome(cliente.getNome());
        newCliente.setTipoCliente(cliente.getTipoCliente());
        newCliente.setPedidos(cliente.getPedidos());
        newCliente.setPontos(cliente.getPontos());
    }

}
