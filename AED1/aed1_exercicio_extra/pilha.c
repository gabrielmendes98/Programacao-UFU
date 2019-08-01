#include <stdio.h>
#include <stdlib.h>
#include "pilha.h"

void Init(stack *s)
{
    s->top = malloc(sizeof(stackelmt));
    s->head = s->top;
    s->top->next = NULL;
    s->size = 0;
}

int Vazia(stack s)
{
    return (s.top == s.head);
}

void Empilha(stack *s, int x)
{
    stackelmt *Aux;
    Aux = malloc(sizeof(stackelmt));

    s->top->data = x;
    Aux->next = s->top;
    s->top = Aux;
    s->size++;
}

void Desempilha(stack *s, int *x)
{
    stackelmt *q;
    if (Vazia(*s)) {
        printf ("Erro: lista vazia.\n");
        return;
    }
    q = s->top;
    s->top = q->next;
    *x = q->next->data;
    free(q);
    s->size--;
}

int Tamanho(stack s)
{
    return(s.size);
}

void Imprime(stack *s)
{
    stack Pilhaux;
    int x;
    Init(&Pilhaux);
    while(!Vazia(*s)){
        Desempilha(s, &x);
        Empilha(&Pilhaux, x);
    }
    while(!Vazia(Pilhaux)){
        Desempilha(&Pilhaux, &x);
        printf("%d",x);
        printf("\n");
    }
}
