'''
   Alunos: Gabriel Mendes de Souza Santiago
           Yan Lucas Damasceno Dias
'''

import numpy as np
import math
import statistics as st

tec = 0
tecRelogio = 1
ts = 2
tsRelogio = 3
tempoFila = 4
tempoFinalServico = 5
tempoClienteSistema = 6
tempoLivreOperador = 7

'''
  Descricao:  Uma funcao simples para gerar numeros aleatorios.
  Recebe:     lower bound, upper bound, media e a distribuicao de probabilidade.
  Retorna:    Um numero aleatorio de acordo com a distribuicao escolhida.
'''
def roleta(low, upper, media, distProb):
    r = np.random.uniform()
    if distProb == "uniforme":
        return round(low + (upper - low) * r, 0)
    elif distProb == "exponencial":
        return round(-(1 / (1 / media)) * math.log(1 - r))

'''
  Descricao:  Gera uma Tabela de Simulacao baseada nos parametros passados e nos gerados aleatoriamente (se for o caso),
  preenchendo-a corretamente de acordo com os valores e calculos realizados.
  Recebe:     lower bound ou TEC, upper bound ou TS, media, numero de clientes, caracteristica do TEC e do TS 
              (aleatorio ou deterministico), e a distribuicao de probabilidade.
  Retorna:    Uma tabela de simulacao.
'''
def geraMatriz(a, b, media, clientes, carac, distProb):
    # Tabela de simulacao tem 8 colunas. A coluna de clientes nao entra, entao a coluna 0 eh o TEC e assim por diante
    tabelaSimulacao = [[0 for i in range(8)] for j in range(clientes)]
    for cliente in range(clientes):
        if carac == "aleatorio":  # Usa uma roleta para gerar o tempo aleatorio.
            tabelaSimulacao[cliente][tec] = roleta(a, b, media, distProb)  # Tempo desde a ultima chegada (TEC)
        elif carac == "deterministico":  # Passado no inicio da simulacao
            tabelaSimulacao[cliente][tec] = a  # Tempo desde a ultima chegada (TEC)

        if cliente == 0:  # primeiro cliente
            tabelaSimulacao[cliente][tecRelogio] = tabelaSimulacao[cliente][tec]  # Tempo de chegada no relogio (TECRelogio)
            tabelaSimulacao[cliente][tsRelogio] = tabelaSimulacao[cliente][tecRelogio]  # Tempo de inicio do servico no relogio (TSRelogio)
            tabelaSimulacao[cliente][tempoLivreOperador] = tabelaSimulacao[cliente][tecRelogio]  # Tempo livre do operador
        else:  # demais clientes
            tabelaSimulacao[cliente][tecRelogio] = tabelaSimulacao[cliente][tec] + tabelaSimulacao[cliente - 1][tecRelogio]  # TECRelogio
            # Se um cliente chegou depois que o cliente anterior foi atendido, o seu Tempo de Inicio sera igual seu
            # tempo de Chegada
            if tabelaSimulacao[cliente][tecRelogio] >= tabelaSimulacao[cliente - 1][tempoFinalServico]:
                tabelaSimulacao[cliente][tsRelogio] = tabelaSimulacao[cliente][tecRelogio]
            else:  # Senao, seu tempo de inicio sera o mesmo que o Tempo Final de Servico do outro cliente (assim que
                   # um saiu, o outro eh atendido)
                tabelaSimulacao[cliente][tsRelogio] = tabelaSimulacao[cliente - 1][tempoFinalServico]  # Tempo de inicio do servico no relogio
            tabelaSimulacao[cliente][tempoLivreOperador] = tabelaSimulacao[cliente][tsRelogio] - tabelaSimulacao[cliente - 1][
                tempoFinalServico]  # Tempo livre do operador eh o tempo de inicio do cliente atual menos o tempo final do anterior

        if carac == "aleatorio":
            tabelaSimulacao[cliente][ts] = roleta(a, b, media, distProb)  # Tempo do servico aleatorio
        elif carac == "deterministico":
            tabelaSimulacao[cliente][ts] = b  # Tempo do servico passado por parametro (ts)

        tabelaSimulacao[cliente][tempoFila] = tabelaSimulacao[cliente][tsRelogio] - tabelaSimulacao[cliente][
            tecRelogio]  # Tempo do cliente na fila
        tabelaSimulacao[cliente][tempoFinalServico] = tabelaSimulacao[cliente][ts] + tabelaSimulacao[cliente][
            tsRelogio]  # Tempo final do servico no relogio
        tabelaSimulacao[cliente][tempoClienteSistema] = tabelaSimulacao[cliente][tempoFinalServico] - tabelaSimulacao[cliente][
            tecRelogio]  # Tempo do cliente no sistema
        # print(tabelaSimulacao[cliente])

    return tabelaSimulacao

'''
  Descricao:  Permite que o usuario possa acompanhar a evolucao da simulacao do sistema, criando estatisticas baseadas
              nos dados de uma tabela, como tempo medio de espera na fila, tempo medio despendido no sistema, etc.
  Recebe:     Uma tabela de simulacao.
  Retorna:    Tempo medio de espera na fila, probabilidade de ter um cliente na fila, probabilidade de ter um operador
              livre, tempo medio de servico por cliente, tempo medio despendido no sistema.
'''
def geraEstatisticas(tabelaSimulacao):
    tempoEsperaFila, nroClientesEspera, tLivreOperador, tempoServico, tempoNoSistema = 0, 0, 0, 0, 0
    nroClientes = len(tabelaSimulacao)
    for i in range(nroClientes):
        tempoEsperaFila += tabelaSimulacao[i][tempoFila]
        tLivreOperador += tabelaSimulacao[i][tempoLivreOperador]
        tempoServico += tabelaSimulacao[i][ts]
        tempoNoSistema += tabelaSimulacao[i][tempoClienteSistema]
        if tabelaSimulacao[i][tempoFila] > 0:
            nroClientesEspera += 1

    tempoMedioEsperaFila = tempoEsperaFila / nroClientes
    probClienteFila = nroClientesEspera / nroClientes
    probOperadorLivre = tLivreOperador / tabelaSimulacao[nroClientes - 1][tempoFinalServico]
    tempoMedioServico = tempoServico / nroClientes
    tempoMedioDespendido = tempoNoSistema / nroClientes

    return (tempoMedioEsperaFila, probClienteFila, probOperadorLivre, tempoMedioServico, tempoMedioDespendido)

'''
  Descricao:  Imprime os dados de uma tabela de simulacao e suas respectivas estatisticas.
  Recebe:     Uma tabela de simulacao e um conjunto de estatisticas (Ex: probabilidade de um cliente pegar fila, etc).
  Retorna:    Nada.
'''
def printDados(tabelaSimulacao, estatisticas):
    print("Cliente\t\tTEC\t\tTECRelogio      TS        TSRelogio      TempoFila   TempoFinalServico  "
          "TempoClienteSistema  TempoLivreOperador")
    for i in range(len(tabelaSimulacao)):
        print(str(i + 1) + "\t\t", end='')
        for data in tabelaSimulacao[i]:
            print(str(data) + "\t\t", end='')
        print("")

    (tempoMedioEsperaFila, probClienteFila, probOperadorLivre, tempoMedioServico, tempoMedioDespendido) = estatisticas

    print("\nTempo medio de espera na fila: " + str(tempoMedioEsperaFila))
    print("Probabilidade de um cliente esperar na fila: " + str(probClienteFila))
    print("Probabilidade do operador livre: " + str(probOperadorLivre))
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
def realizaSimulacao(a, b, media, clientes, carac, distProb):
    numRep = 10
    tempoMedioEsperaFila, probClienteFila, probOperadorLivre, tempoMedioServico, tempoMedioDespendido = [0] * numRep, [
        0] * numRep, [0] * numRep, [0] * numRep, [0] * numRep
    for i in range(numRep):
        tabelaSimulacao = geraMatriz(a, b, media, clientes, carac, distProb)
        (tempoMedioEsperaFila[i], probClienteFila[i], probOperadorLivre[i], tempoMedioServico[i],
         tempoMedioDespendido[i]) = geraEstatisticas(tabelaSimulacao)
        printDados(tabelaSimulacao, geraEstatisticas(tabelaSimulacao))
        print("\n")

    print("Desvio padrao dos dados:")
    print("Tempo medio espera fila: " + str(st.stdev(tempoMedioEsperaFila)))
    print("Probabilidade de um cliente esperar na fila: " + str(st.stdev(probClienteFila)))
    print("Probabilidade do operador livre: " + str(st.stdev(probOperadorLivre)))
    print("Tempo medio de servico: " + str(st.stdev(tempoMedioServico)))
    print("Tempo medio despendido no sistema: " + str(st.stdev(tempoMedioDespendido)))

    print("\nMedia dos dados:")
    print("Tempo medio espera fila: " + str(st.mean(tempoMedioEsperaFila)))
    print("Probabilidade de um cliente esperar na fila: " + str(st.mean(probClienteFila)))
    print("Probabilidade do operador livre: " + str(st.mean(probOperadorLivre)))
    print("Tempo medio de servico: " + str(st.mean(tempoMedioServico)))
    print("Tempo medio despendido no sistema: " + str(st.mean(tempoMedioDespendido)))

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
        tabelaSimulacao = geraMatriz(tc, ts, None, clientes, carac, None)  # Gera matriz de simulacao
        printDados(tabelaSimulacao, geraEstatisticas(tabelaSimulacao))
    elif carac == "aleatorio":
        a, b, media = None, None, None
        distProb = input("Digite a distribuicao de probabilidade (uniforme / exponencial): ")
        if distProb == "uniforme":
            a = int(input("Digite o intervalo lower bound: "))
            b = int(input("Digite o intervalo upper bound: "))
        elif distProb == "exponencial":
            media = int(input("Digite a media: "))
        else:
            print('Digite os dados corretamente')
            return
        realizaSimulacao(a, b, media, clientes, carac, distProb)
    else:
        print("Digite os dados corretamente")


if __name__ == "__main__":
    main()
