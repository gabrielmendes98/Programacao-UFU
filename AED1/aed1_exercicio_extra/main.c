#include <stdio.h>
#include <stdlib.h>
#include "pilha.h"

int main()
{
    stack s;
    int x;
    Init(&s);

    printf("Empilha 1, depois 2:\n");
    printf("Lembrando que minha funcao imprime ja imprime ela invertida...\n");
    Empilha(&s, 1);
    Empilha(&s, 2);
    Imprime(&s);

    printf("--------\n");
    printf("Resultado de desempilhar uma vez:\n");
    Empilha(&s, 1);
    Empilha(&s, 2);
    Desempilha(&s, &x);
    Imprime(&s);

    printf("--------\n");
    printf("Resultado de desempilhar a segunda vez:\n");
    Empilha(&s, 1);
    Empilha(&s, 2);
    Desempilha(&s, &x);
    Desempilha(&s, &x);
    Imprime(&s);

    printf("--------\n");
    printf("Tentar desempilhar a terceira vez:\n");
    Empilha(&s, 1);
    Empilha(&s, 2);
    Desempilha(&s, &x);
    Desempilha(&s, &x);
    Desempilha(&s, &x);

    return 0;
}
