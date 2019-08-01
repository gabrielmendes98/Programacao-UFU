#include<stdio.h>
#include<conio.h>
#include<ctype.h>
#include<string.h>
#include "pilha.h"
#define MAX 100

int main()
{
    stack s;
    char postfix[MAX];
    init(&s);

    printf("Entre com a expressao Infix: ");
    transforma(postfix, s);

    printf("Postfix: ");
    imprime(postfix);
    printf("\n");

    return 0;
}
