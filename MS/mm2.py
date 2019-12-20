"""
Gabriel Mendes de Souza Santiago
Yan Lucas Damasceno Dias
"""

import numpy as np
import math
import statistics as st

tec = 0
tecRelogio = 1
ts = 2
tsIOp1 = 3
tempoFila = 4
tsFOp1 = 5
tlOp1 = 6
tsIOp2 = 7
tsFOp2 = 8
tlOp2 = 9
tempoClienteSistema = 10


'''
  Descricao:  Uma funcao simples para gerar numeros aleatorios.
  Recebe:     lower bound, upper bound, media e a distribuicao de probabilidade.
  Retorna:    Um numero aleatorio de acordo com a distribuicao escolhida.
'''
def roleta(a, b, media, dist_prob):
    r = np.random.uniform()
    if dist_prob == "uniforme":
        return round(a + (b - a) * r, 0)
    elif dist_prob == "exponencial":
        return round(-(1 / (1 / media)) * math.log(1 - r))


'''
  Descricao:  Gera uma Tabela de Simulacao baseada nos parametros passados e nos gerados aleatoriamente (se for o caso),
  preenchendo-a corretamente de acordo com os valores e calculos realizados.
  Recebe:     lower bound ou TEC, upper bound ou TS, media, numero de clientes, caracteristica do TEC e do TS 
              (aleatorio ou deterministico), e a distribuicao de probabilidade.
  Retorna:    Uma tabela de simulacao.
'''
def gera_matriz(a, b, media, clientes, carac, dist_prob):
    tabela_simulacao = [[0 for i in range(11)] for j in range(clientes)]
    final_servico_op1, final_servico_op2 = 0, 0
    for cliente in range(clientes):
        if carac == "aleatorio":
            tabela_simulacao[cliente][0] = roleta(a, b, media, dist_prob)  # Tempo desde a ultima chegada
        elif carac == "deterministico":
            tabela_simulacao[cliente][0] = a  # Tempo desde a ultima chegada

        if cliente == 0:
            tabela_simulacao[cliente][tecRelogio] = tabela_simulacao[cliente][tec]  # Tempo de chegada no relogio
            tabela_simulacao[cliente][tsIOp1] = tabela_simulacao[cliente][tecRelogio]  # Tempo de inicio do servico no relogio
            tabela_simulacao[cliente][tlOp1] = tabela_simulacao[cliente][tecRelogio]  # Tempo livre do operador1
            tabela_simulacao[cliente][tlOp2] = tabela_simulacao[cliente][tecRelogio]  # Tempo livre do operador2
        else:
            tabela_simulacao[cliente][tecRelogio] = tabela_simulacao[cliente][tec] + tabela_simulacao[cliente - 1][
                tecRelogio]  # Tempo de chegada no relogio
            if tabela_simulacao[cliente][tecRelogio] >= final_servico_op1:  # Checando se operador 1 livre
                tabela_simulacao[cliente][tsIOp1] = tabela_simulacao[cliente][tecRelogio]  # Tempo de inicio do servico no relogio
            else:
                if tabela_simulacao[cliente][tecRelogio] >= final_servico_op2:  # Checando se operador 2 livre
                    tabela_simulacao[cliente][tsIOp2] = tabela_simulacao[cliente][tecRelogio]
                else:  # Procurando o operador com menor tempo de termino de servico
                    if final_servico_op1 <= final_servico_op2:
                        tabela_simulacao[cliente][tsIOp1] = final_servico_op1  # Tempo de inicio do servico no relogio
                    else:
                        tabela_simulacao[cliente][tsIOp2] = final_servico_op2

            if tabela_simulacao[cliente][tsIOp1] > 0:  # Calculo do tempo livre dos operadores
                tabela_simulacao[cliente][tlOp1] = tabela_simulacao[cliente][
                                                   tsIOp1] - final_servico_op1  # Tempo livre do operador1
            if tabela_simulacao[cliente][tsIOp2] > 0:
                if final_servico_op2 == 0:
                    tabela_simulacao[cliente][tlOp2] = 0
                else:
                    tabela_simulacao[cliente][tlOp2] = tabela_simulacao[cliente][
                                                       tsIOp2] - final_servico_op2  # Tempo livre do operador2

        if carac == "aleatorio":
            tabela_simulacao[cliente][ts] = roleta(a, b, media, dist_prob)  # Tempo do servico
        elif carac == "deterministico":
            tabela_simulacao[cliente][ts] = b  # Tempo do servico

        if tabela_simulacao[cliente][tsIOp1] > 0:
            tabela_simulacao[cliente][tsFOp1] = tabela_simulacao[cliente][ts] + tabela_simulacao[cliente][
                tsIOp1]  # Tempo final do servico operador1
            final_servico_op1 = tabela_simulacao[cliente][tsFOp1]
            tabela_simulacao[cliente][tempoFila] = tabela_simulacao[cliente][tsIOp1] - tabela_simulacao[cliente][
                tecRelogio]  # Tempo do cliente na fila
            tabela_simulacao[cliente][tempoClienteSistema] = tabela_simulacao[cliente][tsFOp1] - tabela_simulacao[cliente][
                tecRelogio]  # Tempo do cliente no sistema
        if tabela_simulacao[cliente][tsIOp2] > 0:
            tabela_simulacao[cliente][tsFOp2] = tabela_simulacao[cliente][ts] + tabela_simulacao[cliente][
                tsIOp2]  # Tempo final do servico operador2
            final_servico_op2 = tabela_simulacao[cliente][tsFOp2]
            tabela_simulacao[cliente][tempoFila] = tabela_simulacao[cliente][tsIOp2] - tabela_simulacao[cliente][
                tecRelogio]  # Tempo do cliente na fila
            tabela_simulacao[cliente][tempoClienteSistema] = tabela_simulacao[cliente][tsFOp2] - tabela_simulacao[cliente][
                tecRelogio]  # Tempo do cliente no sistema

        # print(tabela_simulacao[cliente])

    return tabela_simulacao


'''
  Descricao:  Permite que o usuario possa acompanhar a evolucao da simulacao do sistema, criando estatisticas baseadas
              nos dados de uma tabela, como tempo medio de espera na fila, tempo medio despendido no sistema, etc.
  Recebe:     Uma tabela de simulacao.
  Retorna:    Tempo medio de espera na fila, probabilidade de ter um cliente na fila, probabilidade de ter um operador
              livre, tempo medio de servico por cliente, tempo medio despendido no sistema.
'''
def gera_estatisticas(tabela_simulacao):
    tempo_espera_fila, nro_clientes_espera, tempo_livre_operador1, tempo_livre_operador2, tempo_servico, \
    tempo_no_sistema = 0, 0, 0, 0, 0, 0

    nro_clientes = len(tabela_simulacao)
    for cliente in range(nro_clientes):
        tempo_espera_fila += tabela_simulacao[cliente][tempoFila]
        tempo_livre_operador1 += tabela_simulacao[cliente][tlOp1]
        tempo_livre_operador2 += tabela_simulacao[cliente][tlOp2]
        tempo_servico += tabela_simulacao[cliente][ts]
        tempo_no_sistema += tabela_simulacao[cliente][tempoClienteSistema]
        if tabela_simulacao[cliente][tempoFila] > 0:
            nro_clientes_espera += 1

    tempo_medio_espera_fila = tempo_espera_fila / nro_clientes
    prob_cliente_fila = nro_clientes_espera / nro_clientes
    prob_operador1_livre = tempo_livre_operador1 / (
            tabela_simulacao[nro_clientes - 1][tecRelogio] + tabela_simulacao[nro_clientes - 1][ts] +
            tabela_simulacao[nro_clientes - 1][tempoFila])
    prob_operador2_livre = tempo_livre_operador2 / (
            tabela_simulacao[nro_clientes - 1][tecRelogio] + tabela_simulacao[nro_clientes - 1][ts] +
            tabela_simulacao[nro_clientes - 1][tempoFila])
    tempo_medio_servico = tempo_servico / nro_clientes
    tempo_medio_despendido = tempo_no_sistema / nro_clientes

    return (tempo_medio_espera_fila, prob_cliente_fila, prob_operador1_livre, prob_operador2_livre, tempo_medio_servico,
            tempo_medio_despendido)


'''
  Descricao:  Imprime os dados de uma tabela de simulacao e suas respectivas estatisticas.
  Recebe:     Uma tabela de simulacao e um conjunto de estatisticas (Ex: probabilidade de um cliente pegar fila, etc).
  Retorna:    Nada.
'''
def print_dados(tabela_simulacao, estatisticas):
    print(
        "Cliente\t\tTEC\t\tTECRelogio      TS           TS-I-OP1       TempoFila        TS-F-OP1   TL-OP1       "
        "TS-I-OP2         TS-F-OP2       TL-OP2      TempoClienteSistema")
    for i in range(len(tabela_simulacao)):
        print(str(i + 1) + "\t\t", end='')
        for data in tabela_simulacao[i]:
            print(str(int(data)) + "\t\t", end='')
        print("")

    (tempoMedioEsperaFila, probClienteFila, probOperador1Livre, probOperador2Livre, tempoMedioServico,
     tempoMedioDespendido) = estatisticas

    print("\nTempo medio de espera na fila: " + str(tempoMedioEsperaFila))
    print("Probabilidade de um cliente esperar na fila: " + str(probClienteFila))
    print("Probabilidade do operador 1 livre: " + str(probOperador1Livre))
    print("Probabilidade do operador 2 livre: " + str(probOperador2Livre))
    print("Tempo medio de servico: " + str(tempoMedioServico))
    print("Tempo medio despendido no sistema: " + str(tempoMedioDespendido))


'''
  Descricao:  Eh chamada quando o TEC e o TS sao aleatorios. Realiza 10 simulacoes, gerando suas tabelas de simulacao e
              estatisticas de cada uma delas. Ao final calcula uma serie de estatisticas finais, como o desvio padrao e
              a media das estatisticas das 10 tabelas geradas.
  Recebe:     lower bound, upper bound, media, numero de clientes, caracteristica do TEC e do TS, e a distribuicao de
              probabilidade.
  Retorna:    Nada.
'''
def realiza_simulacao(a, b, media, clientes, carac, distProb):
    num_rnum_repp = 10
    tempo_medio_espera_fila, prob_cliente_fila, prob_operador1_livre, prob_operador2_livre, tempo_medio_servico, \
    tempo_medio_despendido = [0] * num_rnum_repp, [0] * num_rnum_repp, [0] * num_rnum_repp, [0] * num_rnum_repp, \
                             [0] * num_rnum_repp, [0] * num_rnum_repp

    for i in range(num_rnum_repp):
        tabela_simulacao = gera_matriz(a, b, media, clientes, carac, distProb)
        (
            tempo_medio_espera_fila[i], prob_cliente_fila[i], prob_operador1_livre[i], prob_operador2_livre[i],
            tempo_medio_servico[i],
            tempo_medio_despendido[i]) = gera_estatisticas(tabela_simulacao)
        print_dados(tabela_simulacao, gera_estatisticas(tabela_simulacao))
        print("\n")

    print("Desvio padrao dos dados:")
    print("Tempo medio espera fila: " + str(st.stdev(tempo_medio_espera_fila)))
    print("Probabilidade de um cliente esperar na fila: " + str(st.stdev(prob_cliente_fila)))
    print("Probabilidade do operador 1 livre: " + str(st.stdev(prob_operador1_livre)))
    print("Probabilidade do operador 2 livre: " + str(st.stdev(prob_operador2_livre)))
    print("Tempo medio de servico: " + str(st.stdev(tempo_medio_servico)))
    print("Tempo medio despendido no sistema: " + str(st.stdev(tempo_medio_despendido)))

    print("\nMedia dos dados:")
    print("Tempo medio espera fila: " + str(st.mean(tempo_medio_espera_fila)))
    print("Probabilidade de um cliente esperar na fila: " + str(st.mean(prob_cliente_fila)))
    print("Probabilidade do operador 1 livre: " + str(st.mean(prob_operador1_livre)))
    print("Probabilidade do operador 2 livre: " + str(st.mean(prob_operador2_livre)))
    print("Tempo medio de servico: " + str(st.mean(tempo_medio_servico)))
    print("Tempo medio despendido no sistema: " + str(st.mean(tempo_medio_despendido)))


'''
  Descricao:  Funcao principal, que recebe os dados de entrada do usuario, coordena e faz a chamada das demais funcoes
              implementadas.
  Recebe: Nada.
  Retorna: Nada.
'''
def main():
    clientes = int(input("Digite a quantidade de clientes: "))
    carac = input("Tempos de chegada e saida (aleatorio / deterministico)? ")
    if carac == "deterministico":
        tc = int(input("Digite o tempo de entrada: "))
        ts = int(input("Digite o tempo de saida: "))
        tabela_simulacao = gera_matriz(tc, ts, None, clientes, carac, None)  # Gerando matriz de simulacao
        print_dados(tabela_simulacao, gera_estatisticas(tabela_simulacao))
    elif carac == "aleatorio":
        a, b, media = None, None, None
        dist_prob = input("Digite a distribuicao de probabilidade (uniforme / exponencial): ")
        if dist_prob == "uniforme":
            a = int(input("Digite o intervalo lower bound: "))
            b = int(input("Digite o intervalo upper bound: "))
        elif dist_prob == "exponencial":
            media = int(input("Digite a media: "))
        else:
            print('Digite os dados corretamente')
            return
        realiza_simulacao(a, b, media, clientes, carac, dist_prob)
    else:
        print("Digite os dados corretamente")


if __name__ == "__main__":
    main()
