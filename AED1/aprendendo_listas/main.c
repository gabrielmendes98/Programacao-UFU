#include <stdio.h>
#include <stdlib.h>
#include "ListaSequencial.h"

int main()
{
    Lista *li;
    int x;
    //////////
    li = cria_lista();
    //li = insere_lista_final(li, "dados do aluno");

    x = tamanho_lista(li);
    printf("%d\n", x);
    x = lista_vazia(li);
    printf("%d\n", x);
    x = lista_cheia(li);
    printf("%d\n", x);

    libera_lista(li);

    return 0;
}
