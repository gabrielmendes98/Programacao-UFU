#include <stdio.h>
#include <stdlib.h>
#include "pilha.h"

void init_pilha(pilha *p)
{
    p->topo=malloc(sizeof(celula_pilha));
    p->fundo=p->topo;
    p->topo->next=NULL;
    p->tamanho=0;
}

int pilha_vazia(pilha p)
{
    return(p.tamanho==0);
}

void empilha(pilha *p, int elemento)
{
    celula_pilha *novo;
    novo=malloc(sizeof(celula_pilha));
    novo->elemento=elemento;
    if(pilha_vazia(*p)){
        p->fundo=novo;
        p->topo=novo;
        p->topo->next=NULL;
    }
    else{
        p->topo->next=novo;
        p->topo=novo;
        novo->next=NULL;
    }
    p->tamanho++;
}

void imprime_pilha(pilha p)
{
    if(pilha_vazia(p)){
        printf("Pilha vazia!\n");
        return;
    }
    int i;
    celula_pilha *aux;
    aux=malloc(sizeof(celula_pilha));
    aux=p.fundo;

    for(i=0;i<p.tamanho;i++){
        printf("%d\n",aux->elemento);
        aux=aux->next;
    }
}

int tamanho(pilha p)
{
    return(p.tamanho);
}

void desempilha(pilha *p)
{
    if(pilha_vazia(*p)){
        printf("Pilha vazia!\n");
        return;
    }
    celula_pilha *q;
    q=malloc(sizeof(celula_pilha));
    q=p->topo;
    p->topo=q->next;
    free(q);
    p->tamanho--;
}

void desempilha_e_pega(pilha *p,int *elemento)
{
    if(pilha_vazia(*p)){
        printf("Pilha vazia!\n");
        return;
    }
    celula_pilha *q;
    q=malloc(sizeof(celula_pilha));
    q=p->topo;
    p->topo=q->next;
    *elemento=q->elemento;
    free(q);
    p->tamanho--;
}
