#include <stdio.h>
#include <stdlib.h>
#include "lista.h"

void init_lista(lista *l)
{
    l->head=malloc(sizeof(celula_lista));
    l->head=NULL;
    l->tail=l->head;
}

int lista_vazia(lista l)
{
    return(l.head==NULL);
}

void insere_ultimo(lista *l, char elemento, int possibilidades)
{
    celula_lista *novo;
    novo=malloc(sizeof(celula_lista));
    novo->elemento=elemento;
    novo->possibilidades=possibilidades;

    if(lista_vazia(*l)){
        l->head=novo;
        l->tail=novo;
        novo->next=NULL;
    }

    else{
        l->tail->next=novo;
        l->tail=novo;
        novo->next=NULL;
    }
}

void imprime_lista(lista l)
{
    if(lista_vazia(l)){
        printf("Lista Vazia!\n");
        exit(1);
    }

    celula_lista *p;
    p=malloc(sizeof(celula_lista));
    p=l.head;
    while(p!=NULL){
        printf("%c->",p->elemento);
        p=p->next;
    }
    printf("NULL\n");
}

void insere_na_pos(lista *l, char elemento, int pos)
{
    if(lista_vazia(*l)){
        printf("Lista Vazia!\n");
        exit(1);
    }

    celula_lista *anterior, *novo;
    anterior=malloc(sizeof(celula_lista));
    novo=malloc(sizeof(celula_lista));
    anterior=l->head;

    if(pos==0){
        novo->elemento=elemento;
        novo->next=l->head;
        l->head=novo;
    }

    else{
        int i;
        for(i=0;i<pos-1;i++)
            anterior=anterior->next;

        novo=malloc(sizeof(celula_lista));
        novo->elemento=elemento;
        novo->next=anterior->next;
        anterior->next=novo;
    }

    if(novo->next==NULL){
        l->tail=novo;
        l->tail->next=NULL;
    }
}

void remove_pos(lista *l, int pos)
{
    celula_lista *p, *q;
    p=malloc(sizeof(celula_lista));
    q=malloc(sizeof(celula_lista));
    p=l->head;

    if(pos==0){
        q=p->next;
        l->head=q;
        free(p);
    }
    else{
        int i;
        for(i=0;i<pos-1;i++)
            p=p->next;
        q=p->next;
        p->next=q->next;
        free(q);
    }

    if(p->next==NULL){
        l->tail=p;
        l->tail->next=NULL;
    }
}

void pega_pos(lista *l, int pos, char *elemento, int *possibilidades)
{
    celula_lista *p;
    p=malloc(sizeof(celula_lista));
    p=l->head;

    if(pos==0){
        *elemento=p->elemento;
        *possibilidades=p->possibilidades;
    }
    else{
            int i;
        for(i=0;i<pos-1;i++)
            p=p->next;
        *elemento=p->elemento;
        *possibilidades=p->possibilidades;
    }

}
