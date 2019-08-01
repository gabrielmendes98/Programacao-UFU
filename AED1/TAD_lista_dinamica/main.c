#include <stdio.h>
#include <stdlib.h>

typedef struct celula
{
    int elemento;
    struct celula *next;
}celula;

typedef struct lista
{
    celula *head;
    celula *tail;
}lista;

void init(lista *l)
{
    l->head=malloc(sizeof(celula));
    l->head=NULL;
    l->tail=l->head;
}

int vazia(lista l)
{
    return(l.head==NULL);
}

void insere_ultimo(lista *l, int elemento)
{
    celula *novo;
    novo=malloc(sizeof(celula));
    novo->elemento=elemento;

    if(vazia(*l)){
        l->head=novo;
        l->tail=novo;
        novo->next=NULL;
    }

    else{
        l->tail->next=novo;
        l->tail=novo;
        novo->next=NULL;
    }
}

void imprime(lista l)
{
    if(vazia(l)){
        printf("Lista Vazia!\n");
        exit(1);
    }

    celula *p;
    p=malloc(sizeof(celula));
    p=l.head;
    while(p!=NULL){
        printf("%d->",p->elemento);
        p=p->next;
    }
    printf("NULL\n");
}

void insere_na_pos(lista *l, int elemento, int pos)
{
    if(vazia(*l)){
        printf("Lista Vazia!\n");
        exit(1);
    }

    celula *anterior, *novo;
    anterior=malloc(sizeof(celula));
    novo=malloc(sizeof(celula));
    anterior=l->head;

    if(pos==0){
        novo->elemento=elemento;
        novo->next=l->head;
        l->head=novo;
    }

    else{
        int i;
        for(i=0;i<pos-1;i++)
            anterior=anterior->next;

        novo=malloc(sizeof(celula));
        novo->elemento=elemento;
        novo->next=anterior->next;
        anterior->next=novo;
    }

    if(novo->next==NULL){
        l->tail=novo;
        l->tail->next=NULL;
    }
}

void remove_pos(lista *l, int pos)
{
    celula *p, *q;
    p=malloc(sizeof(celula));
    q=malloc(sizeof(celula));
    p=l->head;

    if(pos==0){
        q=p->next;
        l->head=q;
        free(p);
    }
    else{
        int i;
        for(i=0;i<pos-1;i++)
            p=p->next;
        q=p->next;
        p->next=q->next;
        free(q);
    }

    if(p->next==NULL){
        l->tail=p;
        l->tail->next=NULL;
    }
}

int main()
{
    int i;
    lista l;
    init(&l);

    for(i=0;i<=9;i++)
        insere_ultimo(&l,i);

    imprime(l);

    remove_pos(&l, 7);
    imprime(l);

    printf("%d\n",l.tail->elemento);

    return 0;
}
