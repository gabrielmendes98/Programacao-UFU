#ifndef PILHA_H_INCLUDED
#define PILHA_H_INCLUDED

#include <stdio.h>
#include <stdlib.h>
#define MAX 100

typedef struct stackelmt_{
 int data;
 struct stackelmt_ *next;
} stackelmt;

typedef struct stack{
 int size;
 stackelmt *head;
 stackelmt *top;
} stack;

void Init(stack *s);
int Vazia(stack s);
void Empilha(stack *s, int x);
void Desempilha(stack *s, int *x);
int Tamanho(stack s);
void Imprime(stack *s);

#endif // PILHA_H_INCLUDED
