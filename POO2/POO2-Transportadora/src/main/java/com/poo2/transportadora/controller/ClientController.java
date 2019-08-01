package com.poo2.transportadora.controller;

import com.poo2.transportadora.domain.cliente.*;
import com.poo2.transportadora.domain.enums.TipoCliente;
import com.poo2.transportadora.domain.requests.ClienteRequest;
import com.poo2.transportadora.domain.responses.ClienteResponse;
import com.poo2.transportadora.service.ClienteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Controladores que representam o fluxo de clientes
 */
@Controller
public class ClientController {

    @Autowired
    ClienteService clienteService;

    /**
     * Metodo responsavel por inserir um cliente novo
     * @param clienteRequest
     * @param tipoCliente
     * @return
     */
    public boolean insereCliente(ClienteRequest clienteRequest, TipoCliente tipoCliente){
        Cliente cliente = clienteRequest.toCliente(clienteRequest,tipoCliente);
        clienteService.insert(cliente);
        return true;
    }

    /**
     * Metodos Responsavel por procurar um cliente a partir do cpf
     * @param cpfOuCnpj
     * @return
     */
    public ClienteResponse procuraCliente(String cpfOuCnpj){
        ClienteResponse clienteResponse = new ClienteResponse(clienteService.findByCpf(cpfOuCnpj));
        return clienteResponse;
    }

    /**
     * Metodo responsavel por atualizar dados de um cliente
     * @param clienteRequest
     * @return
     */
    //TODO MUDAR DE CLIENTE PARA CLIENTERESPONSE
    public Cliente atualizaCliente(ClienteRequest clienteRequest) {
        Cliente cliente = clienteRequest.toCliente(clienteRequest,clienteRequest.getTipoCliente());
        return clienteService.update(cliente);
    }

}
