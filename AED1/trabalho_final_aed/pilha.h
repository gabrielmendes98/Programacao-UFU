#ifndef PILHA_H_INCLUDED
#define PILHA_H_INCLUDED

typedef struct celula_pilha
{
    int elemento;
    struct celula_pilha *next;
}celula_pilha;

typedef struct pilha
{
    celula_pilha *fundo;
    celula_pilha *topo;
    int tamanho;
}pilha;

void init_pilha(pilha *p);
int pilha_vazia(pilha p);
void empilha(pilha *p, int elemento);
void imprime_pilha(pilha p);
int tamanho(pilha p);
void desempilha(pilha *p);
void desempilha_e_pega(pilha *p,int *elemento);

#endif // PILHA_H_INCLUDED
