#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "fila_jogadores.h"

void init_fila(fila *f)
{
    f->frente=malloc(sizeof(celula_fila));
    f->tras=f->frente;
    f->frente->next=NULL;
}

int fila_vazia(fila f)
{
    return(f.frente==f.tras);
}

void adiciona_jogador(fila *f, char *nome, int tentativas)
{
    f->tras->next=malloc(sizeof(celula_fila));
    f->tras=f->tras->next;
    strcpy(f->tras->nome,nome);
    f->tras->tentativas=tentativas;
    f->tras->next=NULL;
}

void desenfileira_jogador(fila *f, char *nome)
{
    if(fila_vazia(*f)){
        printf("Fila vazia!\n");
        return;
    }
    celula_fila *q;
    q=malloc(sizeof(celula_fila));
    q=f->frente;
    f->frente=f->frente->next;
    strcpy(nome,f->frente->nome);
    free(q);
}

void imprime_jogador(fila *f, char *nome)
{
    celula_fila *q;
    q=malloc(sizeof(celula_fila));
    q=f->frente;
    while(q!=NULL){
        if(strcmp(q->nome,nome)==0){
            printf("Jogador: %s\n", q->nome);
            printf("Tentativas: %c\n",q->tentativas);
            break;
        }
        else
            q=q->next;
    }
}
