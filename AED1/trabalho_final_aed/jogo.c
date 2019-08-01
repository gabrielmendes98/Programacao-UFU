#include <stdio.h>
#include <stdlib.h>
#include "lista.h"
#include "jogo.h"
#include "pilha.h"
#include "fila_jogadores.h"

void cria_mapa(lista *mapa)
{
    init_lista(&mapa[0]);
    insere_ultimo(&mapa[0],'A',3);
    insere_ultimo(&mapa[0],'B',1);
    insere_ultimo(&mapa[0],'C',3);
    insere_ultimo(&mapa[0],'X',1);

    init_lista(&mapa[1]);
    insere_ultimo(&mapa[1],'B',1);
    insere_ultimo(&mapa[1],'D',2);

    init_lista(&mapa[2]);
    insere_ultimo(&mapa[2],'C',3);
    insere_ultimo(&mapa[2],'D',2);
    insere_ultimo(&mapa[2],'F',3);
    insere_ultimo(&mapa[2],'K',0);

    init_lista(&mapa[3]);
    insere_ultimo(&mapa[3],'D',2);
    insere_ultimo(&mapa[3],'Z',0);
    insere_ultimo(&mapa[3],'E',1);

    init_lista(&mapa[4]);
    insere_ultimo(&mapa[4],'E',1);
    insere_ultimo(&mapa[4],'H',999);

    init_lista(&mapa[5]);
    insere_ultimo(&mapa[5],'F',3);
    insere_ultimo(&mapa[5],'D',2);
    insere_ultimo(&mapa[5],'G',2);
    insere_ultimo(&mapa[5],'J',1);

    init_lista(&mapa[6]);
    insere_ultimo(&mapa[6],'G',2);
    insere_ultimo(&mapa[6],'H',999);
    insere_ultimo(&mapa[6],'I',0);

    init_lista(&mapa[7]);
    insere_ultimo(&mapa[7],'H',999);

    init_lista(&mapa[8]);
    insere_ultimo(&mapa[8],'I',0);

    init_lista(&mapa[9]);
    insere_ultimo(&mapa[9],'J',1);
    insere_ultimo(&mapa[9],'I',0);

    init_lista(&mapa[10]);
    insere_ultimo(&mapa[10],'K',0);

    init_lista(&mapa[11]);
    insere_ultimo(&mapa[11],'X',1);
    insere_ultimo(&mapa[11],'Y',0);

    init_lista(&mapa[12]);
    insere_ultimo(&mapa[12],'Y',0);

    init_lista(&mapa[13]);
    insere_ultimo(&mapa[13],'Z',0);
}

void imprime_mapa(lista *mapa)
{
    int i;
    for(i=0;i<14;i++)
        imprime_lista(mapa[i]);
}

void cria_pilha(pilha *pilha)
{
    init_pilha(&pilha[0]);
    init_pilha(&pilha[1]);
    init_pilha(&pilha[2]);
    init_pilha(&pilha[4]);
}

void cria_fila(fila *fila)
{
    init_fila(fila);
    adiciona_jogador(fila, "Jogador 1",0);
    adiciona_jogador(fila, "Jogador 2",0);
}
