#ifndef PILHA_H_INCLUDED
#define PILHA_H_INCLUDED

#include<stdio.h>
#include<conio.h>
#include<ctype.h>
#include<string.h>
#define MAX 100

typedef struct stack
{
 int data[MAX];
 int top;
}stack;

//pilha.c
void init(stack *);
int empty(stack *);
int full(stack *);
char pop(stack *);
void push(stack *,char);
char top(stack *);
void imprime(const char *postfix);

//transforma.c
void transforma(char *postfix, stack s);
int priority(char);

#endif // PILHA_H_INCLUDED
