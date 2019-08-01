#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include "pilha.h"

void imprime(const char *postfix){
    int i;
    setbuf(stdin, NULL);
    for(i=0;i<strlen(postfix)-3;i++)
        printf("%c",postfix[i]);
}
//---------------------------------------------
void init(stack *s)
{
   s->top=-1;
}
//---------------------------------------------
int empty(stack *s)
{
    if(s->top==-1)
        return(1);
    else
        return(0);
}
//---------------------------------------------
int full(stack *s)
{
    if(s->top==MAX-1)
        return(1);
    else
        return(0);
}
//---------------------------------------------
void push(stack *s,char x)
{
  s->top=s->top+1;
  s->data[s->top]=x;
}
//---------------------------------------------
char pop(stack *s)
{
   int x;
   x=s->data[s->top];
   s->top=s->top-1;
   return(x);
}
//---------------------------------------------
char top(stack *s)
{
   return(s->data[s->top]);
}
