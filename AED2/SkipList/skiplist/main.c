/*
Grupo GVY
Integrantes:
Gabriel Mendes de Souza Santiago - 11621BCC015
Vinícius Guardieiro Sousa - 11811BCC008
Yan Lucas Damasceno Dias - 11621BCC029
*/

#include<stdio.h>
#include<stdlib.h>
#include "SkipList.h"

int main()
{
    skiplist *sk = criaSkipList();
    insereSkipList(sk, 2);
    insereSkipList(sk, 3);
    insereSkipList(sk, 7);
    insereSkipList(sk, 6);
    insereSkipList(sk, 5);
    insereSkipList(sk, 4);
    imprimeSkipList(sk);

    printf("Tamanho? %d\n",tamanhoSkipList(sk));
    removeSkipList(sk,6);
    printf("Tamanho? %d\n",tamanhoSkipList(sk));

    printf("Numero 4 pertence? %d\n", buscaSkipList(sk,4));

    liberaSkipList(sk);
    sk = NULL;

    printf("Vazia? %d\n",vaziaSkipList(sk));

    return 0;
}
