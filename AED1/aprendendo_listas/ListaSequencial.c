#include <stdio.h>
#include <stdlib.h>
#include "ListaSequencial.h"

#define MAX 100
struct lista{
    int qtd; //Quantas posições ja ocupei da lista
    struct aluno dados[MAX]
};

Lista* cria_lista(){
    Lista *li;
    li = (Lista*) malloc(sizeof(Lista));
    if(li != NULL)
        li->qtd = 0;
    return li;
}

void libera_lista(Lista* li){
    free(li);
}

int tamanho_lista(Lista* li){
    if(li == NULL)
        return -1;
    return li->qtd;
}

int lista_vazia(Lista* li){
    if(li==NULL)
        return -1;
    return (li->qtd==0);
}

int lista_cheia(Lista* li){
    if(li == NULL)
        return -1;
    return(li->qtd==MAX);
}

int insere_lista_final(Lista* li, struct aluno al){
    if(li==NULL)
        return 0;
    if(lista_cheia(li))
        return 0;
    li->dados[li->qtd] = al;
    li->qtd++;
    return 1;
}
