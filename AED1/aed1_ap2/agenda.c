#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "agenda.h"

int cria_Agenda(){
    int nro_contatos, i;
    printf("Quantos contatos deseja cadastrar? ");
    scanf("%d", &nro_contatos);
    agenda = malloc(nro_contatos*sizeof(Agenda));
    for (i=0; i<nro_contatos; i++) {
        printf("Entre com o nome do contato %d: ",i+1);
        scanf("%s", agenda[i].nome);
        printf("Entre com o telefone do contato %d: ",i+1);
        scanf("%s", agenda[i].telefone);
    }
    return nro_contatos;
}

void pesquisa_Agenda(int tam) {
   char nome[20];
   int i = 0;
   printf("Pesquisando contatos...\n");
   printf("Qual o nome do contato que quer pesquisar? ");
   scanf("%s", nome);
   while (strcmp(agenda[i].nome, nome) != 0 && i < tam)
      i++;
   if (i < tam)
      printf("O telefone do contato eh: %s\n", agenda[i].telefone);
   else
      printf("Telefone nao encontrado!\n");
}

void libera_Agenda(Agenda* agenda){
    free(agenda);
}
