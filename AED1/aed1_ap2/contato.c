#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "contato.h"

Contato* cria_Contato(char *nome, char *telefone){
    Contato* c=(Contato*) malloc(sizeof(Contato));
    if(c==NULL){
        printf("Memoria insuficiente!\n");
        exit(1);
    }
    strcpy(c->nome,nome);
    strcpy(c->telefone,telefone);
    return c;
}

void libera_Contato(Contato* c){
    free(c);
}

void acessa_Contato(Contato* c, char *nome, char *telefone){
    strcpy(nome,c->nome);
    strcpy(telefone,c->telefone);
}

void atribui_Contato(Contato* c, char *nome, char *telefone){
    strcpy(c->nome,nome);
    strcpy(c->telefone,telefone);
}
