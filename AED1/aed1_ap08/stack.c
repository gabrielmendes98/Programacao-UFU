#include<stdio.h>
#include<stdlib.h>
#include "stack.h"

int empty(stack *s)
{
 if(s->top==-1)
      return(1);
 return(0);
}
//----------------------
int full(stack *s)
{
 if(s->top==MAX-1)
     return(1);
 return(0);
}
//-----------------------
void push(stack *s,int x)
{
 s->top=s->top+1;
 s->data[s->top]=x;
}
//-----------------------
int pop(stack *s)
{
 int x;
 x=s->data[s->top];
 s->top=s->top-1;
 return(x);
}
//------------------------
void transform(stack *s, int num)
{
    while((num!=0))
     {
       if(!full(s))
       {
            push(s,num%2);
            num=num/2;
       }
       else
       {
            printf("Pilha cheia.\n");
            exit(0);
       }
     }
}
//------------------------
void print(stack s)
{
    int aux;
    while(!empty(&s))
    {
       aux=pop(&s);
       printf("%d",aux);
    }
}
