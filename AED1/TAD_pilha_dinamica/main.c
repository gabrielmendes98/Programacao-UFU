#include <stdio.h>
#include <stdlib.h>

typedef struct celula
{
    int elemento;
    struct celula *next;
}celula;

typedef struct pilha
{
    celula *fundo;
    celula *topo;
    int tamanho;
}pilha;

void init(pilha *p)
{
    p->topo=malloc(sizeof(celula));
    p->fundo=p->topo;
    p->topo->next=NULL;
    p->tamanho=0;
}

int vazia(pilha p)
{
    return(p.tamanho==0);
}

void empilha(pilha *p, int elemento)
{
    celula *novo;
    novo=malloc(sizeof(celula));
    novo->elemento=elemento;
    if(vazia(*p)){
        p->fundo=novo;
        p->topo=novo;
        p->topo->next=NULL;
    }
    else{
        p->topo->next=novo;
        p->topo=novo;
        novo->next=NULL;
    }
    p->tamanho++;
}

void imprime(pilha p)
{
    if(vazia(p)){
        printf("Pilha vazia!\n");
        return;
    }
    int i;
    celula *aux;
    aux=malloc(sizeof(celula));
    aux=p.fundo;

    for(i=0;i<p.tamanho;i++){
        printf("%d\n",aux->elemento);
        aux=aux->next;
    }
}

int tamanho(pilha p)
{
    return(p.tamanho);
}

void desempilha(pilha *p)
{
    if(vazia(*p)){
        printf("Pilha vazia!\n");
        return;
    }
    celula *q;
    q=malloc(sizeof(celula));
    q=p->topo;
    p->topo=q->next;
    free(q);
    p->tamanho--;
}

void desempilha_e_pega(pilha *p,int *elemento)
{
    if(vazia(*p)){
        printf("Pilha vazia!\n");
        return;
    }
    celula *q;
    q=malloc(sizeof(celula));
    q=p->topo;
    p->topo=q->next;
    *elemento=q->elemento;
    free(q);
    p->tamanho--;
}

int main()
{
    pilha p;
    int i;

    init(&p);

    for(i=0;i<10;i++)
        empilha(&p,i);
    imprime(p);
    printf("-----\n");
    printf("Tamanho: %d\n",tamanho(p));

    int x;
    desempilha_e_pega(&p,&x);
    printf("-----\n");
    imprime(p);
    printf("-----\n");
    printf("Item pegado: %d\n",x);
    printf("-----\n");
    printf("Tamanho: %d\n",tamanho(p));

    return 0;
}
