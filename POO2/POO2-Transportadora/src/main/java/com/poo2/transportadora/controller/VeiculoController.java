package com.poo2.transportadora.controller;

import com.poo2.transportadora.service.VeiculoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Controladores que representam o fluxo de veiculos
 */
@Controller
public class VeiculoController {

    @Autowired
    VeiculoService veiculoService;


}
