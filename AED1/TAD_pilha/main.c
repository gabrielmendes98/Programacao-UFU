#include <stdio.h>
#include <stdlib.h>
#define MAX 100

typedef struct stack
{
    int elemento[MAX];
    int topo;
}stack;

void init(stack *s)
{
    s->topo=-1;
}

int vazia(stack s)
{
    return(s.topo==-1);
}

int cheia(stack s)
{
    return(s.topo==MAX-1);
}

void empilha(stack *s,int elemento)
{
    if(cheia(*s)){
        printf("Lista cheia");
        return;
    }
    s->topo++;
    s->elemento[s->topo]=elemento;
}

void desempilha(stack *s)
{
    s->topo--;
}

void desempilha_e_pega(stack *s,int *elemento)
{
    if(vazia(*s)){
        printf("Lista vazia");
        return;
    }
    *elemento=s->elemento[s->topo];
    s->topo--;
}

void imprime_ft(stack s)
{
    int i;
    for(i=0;i<=s.topo;i++)
        printf("%d\n",s.elemento[i]);
}

void imprime_tf(stack s)
{
    int i;
    for(i=s.topo;i>=0;i--)
        printf("%d\n",s.elemento[i]);
}

int main()
{
    stack s;
    init(&s);

    int i;
    for(i=0;i<10;i++)
        empilha(&s,i);

    imprime_ft(s);
    printf("-------\n");
    desempilha(&s);
    imprime_tf(s);


    return 0;
}
