#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "lista.h"
#include "jogo.h"
#include "fila_jogadores.h"
#include "pilha.h"

int main()
{
    srand(time(NULL));
    lista mapa[14], mapa2[14];
    fila fila;

    cria_mapa(mapa);
    cria_mapa(mapa2);
    cria_fila(&fila);

    int x,i,j;
    char atual='A', nome[20];
    int possibilidades = 3;
    int lugar_atual=0;
    int tentativas=1;

    printf("\t   Comecou!");

    for(i=0;i<2;i++){
        printf("\n\n**********NOVO JOGO**************\n\n");
        desenfileira_jogador(&fila, nome);
        while(1){
            printf("%c->",atual);

            x=1+rand()%possibilidades;
            pega_pos(&mapa[lugar_atual], x+1, &atual, &possibilidades);

            if(possibilidades==0){
                printf("%c->",atual);
                printf("NULL\n");
                printf("Voce perdeu!\n");
                printf("\n\ttentando novamente\n\n");
                tentativas++;
                lugar_atual=0;
                atual='A';
                possibilidades = 3;
            }
            else if(possibilidades==999){
                printf("%c->",atual);
                printf("FIM\n");
                printf("Voce chegou ao fim!\n");
                break;
            }
            lugar_atual=0;
            while(1){
                if(mapa[lugar_atual].head->elemento==atual)
                    break;
                else
                    lugar_atual++;
            }
        }
        printf("\n%s - TENTATIVAS: %d\n",nome,tentativas);
        adiciona_jogador(&fila,nome,tentativas);
        tentativas=1;
        lugar_atual=0;
        atual='A';
        possibilidades = 3;
    }

    printf("\n************\n");

    if(fila.frente->tentativas > fila.tras->tentativas)
        printf("%s ganhou!\n", fila.tras->nome);
    else if(fila.frente->tentativas < fila.tras->tentativas)
        printf("%s ganhou!\n", fila.frente->nome);
    else
        printf("Empate!\n");

    printf("************\n");

    return 0;
}
