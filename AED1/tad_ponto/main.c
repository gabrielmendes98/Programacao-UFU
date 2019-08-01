#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
   char nome[20];
   char telefone[20];
} contato;

contato *agenda;

int cria_agenda (){
    int nro_contatos, i;
    printf("Quantos contatos quer cadastrar? ");
    scanf("%d", &nro_contatos);
    agenda = malloc(nro_contatos*sizeof(contato));
    for (i=0; i<nro_contatos; i++) {
        printf("Entre com o nome %d:",i+1);
        scanf("%s", agenda[i].nome);
        printf("Entre com o telefone %d:",i+1);
        scanf("%s", agenda[i].telefone);
    }
    return nro_contatos;
}

void pesquisa_agenda (int tam) {
   char nome[20];
   int i =0;
   printf("Qual nome? ");
   scanf("%s", nome);
   while (strcmp(agenda[i].nome, nome) != 0 && i < tam)
      i++;
   if (i < tam)
      printf("O telefone e' %s \n", agenda[i].telefone);
   else
      printf("Telefone nao encontrado\n");
}
/* =========================================================== */
contato* cria_contato(char* nome, char* telefone){
    contato* c = (contato*) malloc(sizeof(contato));
    if(c == NULL){
        printf("Erro! Memoria insuficiente\n");
        exit(1);
    }
    strcpy(c->nome,nome);
    strcpy(c->telefone,telefone);
    return c;
}

void libera_contato(contato* c){
    free(c);
}

void acessa_contato(contato* c, char* nome, char* telefone){
    int i;
    strcpy(nome, c->nome);
    strcpy(telefone, c->telefone);
}

void atribui_contato(contato *c, char *nome, char *telefone){
    strcpy(c->nome, nome);
    strcpy(c->telefone, telefone);
}

/* =========================================================== */
int main() {
    contato* c;

    c = cria_contato("gabriel","999");
    printf("%s\n", c->nome);
    printf("%s\n", c->telefone);

    printf("---------------\n");

    char nom[20], tel[20];
    acessa_contato(c, nom, tel);
    printf("%s\n",nom);
    printf("%s\n",tel);

    printf("---------------\n");

    atribui_contato(c, "josnevaldo", "111");
    printf("%s\n", c->nome);
    printf("%s\n", c->telefone);

    printf("---------------\n");

    acessa_contato(c, nom, tel);
    printf("%s\n",nom);
    printf("%s\n",tel);

    free(c);
}
