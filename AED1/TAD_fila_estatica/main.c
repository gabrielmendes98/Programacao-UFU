#include <stdio.h>
#include <stdlib.h>
#define MAXTAM 6

typedef struct fila
{
    int elemento[MAXTAM];
    int front, rear;
    int tamanho;
}fila;

void init(fila *f)
{
    f->front=1;
    f->rear=f->front;
    f->tamanho=0;
}

int vazia(fila f)
{
    return(f.rear==f.front);
}

int cheia(fila f)
{
    return(f.rear%MAXTAM+1==f.front);
}

void enfileira(fila *f, int elemento)
{
    if(cheia(*f)){
        printf("Fila Cheia!\n");
        return;
    }
    f->elemento[f->rear-1]=elemento;
    f->rear=f->rear%MAXTAM+1;
    f->tamanho++;
}

void desenfilera(fila *f)
{
    if(vazia(*f)){
        printf("Fila Vazia!\n");
        return;
    }

    f->front=(f->front%MAXTAM)+1;
    f->tamanho--;
}

int main()
{
    int i;
    fila f;
    init(&f);

    return 0;
}
