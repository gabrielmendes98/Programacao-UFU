#include <sys/time.h>
#include <stdio.h>
#include <stdlib.h>
#define MAXTAM          1000

#ifndef LISTAARRAY_H_INCLUDED
#define LISTAARRAY_H_INCLUDED

typedef int TipoChave;

typedef int TipoApontador;

typedef struct {
  TipoChave Chave;
  /* outros componentes */
} TipoItem;

typedef struct {
  TipoItem Item[MAXTAM];
  TipoApontador Ultimo;
} TipoLista;

void FLVazia(TipoLista *Lista);
int Vazia(TipoLista Lista);
void Insere(TipoItem x, TipoLista *Lista);
void InsereNaPosicao(TipoItem x, TipoApontador posicao, TipoLista* Lista);
void Retira(TipoApontador p, TipoLista *Lista, TipoItem *Item);
void Imprime(TipoLista Lista);
void lista_vazia(TipoLista *Lista);
void lista_cheia(TipoLista *Lista);

#endif // LISTAARRAY_H_INCLUDED
