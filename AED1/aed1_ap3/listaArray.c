#include <sys/time.h>
#include <stdio.h>
#include <stdlib.h>
#include "listaArray.h"

void FLVazia(TipoLista *Lista)
{
  Lista -> Ultimo = 1;
}  /* FLVazia */

int Vazia(TipoLista Lista)
{ return (0 == Lista.Ultimo);
}  /* Vazia */

void Insere(TipoItem x, TipoLista *Lista)
{ if (Lista -> Ultimo > MAXTAM) printf("Lista esta cheia\n");
  else { Lista -> Item[Lista -> Ultimo - 1] = x;
         Lista -> Ultimo++;
       }
}  /* Insere */

void InsereNaPosicao(TipoItem x, TipoApontador posicao, TipoLista* Lista) {
    int aux;
    if (Lista -> Ultimo < posicao) {
        printf("Posicao invalida");
        return;
    }
    if (Lista -> Ultimo > MAXTAM) {
        printf("Lista esta cheia\n");
        return;
    }
    for (aux = Lista->Ultimo-1; aux >= posicao; aux--) {
        Lista->Item[aux] = Lista->Item[aux-1];
    }
    Lista->Item[posicao-1] = x;
    Lista->Ultimo++;
}

void Retira(TipoApontador p, TipoLista *Lista, TipoItem *Item)
{ int Aux;

  if (Vazia(*Lista) || p >= Lista -> Ultimo)
  { printf(" Erro   Posicao nao existe\n");
    return;
  }
  *Item = Lista -> Item[p - 1];
  Lista -> Ultimo--;
  for (Aux = p; Aux < Lista -> Ultimo; Aux++)
    Lista -> Item[Aux - 1] = Lista -> Item[Aux];
}  /* Retira */

void Imprime(TipoLista Lista)
{ int Aux;

  for (Aux = 0; Aux <= (Lista.Ultimo - 2); Aux++)
    printf("%d\n", Lista.Item[Aux].Chave);
}  /* Imprime */

void lista_vazia(TipoLista *Lista){
    if(Lista -> Ultimo == 1)
        Lista -> Ultimo = -1;
}

void lista_cheia(TipoLista *Lista){
    if(Lista -> Ultimo > MAXTAM)
        Lista -> Ultimo = MAXTAM - 1;
}
