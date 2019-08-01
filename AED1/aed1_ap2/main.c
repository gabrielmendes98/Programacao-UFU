#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "contato.h"
#include "agenda.h"

int main() {
    // Utilizando as fun��es dos arquivos contato.c e contato.h
    printf("### Funcoes do contato\n");
    // Fun��o cria_Contato
    Contato* c = cria_Contato("gabriel", "999");
    printf("%s\n",c->nome);
    printf("%s\n",c->telefone);
    // Fun��o atribui_Contato
    atribui_Contato(c, "mendes", "1234");
    printf("\n%s\n",c->nome);
    printf("%s\n",c->telefone);
    // Fun��o acessa_Contato
    char nome1[20];
    char telefone1[20];

    acessa_Contato(c, nome1, telefone1);
    printf("\n%s\n", nome1);
    printf("%s\n", telefone1);
    // Fun��o libera_Contato
    libera_Contato(c);


    // Utilizando as fun��es dos arquivos agenda.c e agenda.h
    printf("\n### Funcoes da agenda\n");
    // Fun��o cria_Agenda - "retorna o tamanho da agenda"
    int tamanho;
    tamanho = cria_Agenda();
    // Fun��o pesquisa_Agenda
    pesquisa_Agenda(tamanho);
    // Fun��o pesquisa_Agenda
    libera_Agenda(agenda);

    return 0;
}
