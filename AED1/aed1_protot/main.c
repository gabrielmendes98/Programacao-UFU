#include <sys/time.h>
#include <stdlib.h>
#include <stdio.h>
#define MAX 10

/* ========================================================================= */

typedef int TipoChave;

typedef struct {
  TipoChave Chave;
  /* outros componentes */
} TipoItem;

typedef struct TipoCelula *TipoApontador;

typedef struct TipoCelula {
  TipoItem Item;
  TipoApontador Prox;
} TipoCelula;

typedef struct {
  TipoApontador Primeiro, Ultimo;
} TipoLista;

/* ========================================================================= */

void FLVazia(TipoLista *Lista)
{ Lista -> Primeiro = (TipoApontador) malloc(sizeof(TipoCelula));
  Lista -> Ultimo = Lista -> Primeiro;
  Lista -> Primeiro -> Prox = NULL;
}

int Vazia(TipoLista Lista)
{ return (Lista.Primeiro == Lista.Ultimo);
}

int Tamanho(TipoLista *Lista)
{
  int t = 0;
  TipoApontador p;
  p = Lista->Primeiro;
  while (p != NULL)
  {
     p = p->Prox;
     t++;
  }
  return t;
}

void Insere(int Pos, TipoItem x, TipoLista *Lista)
{
  TipoApontador p, q;
  int i;
  p = Lista->Primeiro;
  if (Pos < Tamanho(Lista))
  {
    for(i = 0; i < Pos; i++)
        p = p->Prox;  //varre a lista até a posição desejada

    q = (TipoApontador) malloc(sizeof(TipoCelula));
    q->Item = x;
    q->Prox = p->Prox;
    p->Prox = q;
  }
}

void Retira(TipoApontador p, TipoLista *Lista, TipoItem *Item)
{ /*  ---   Obs.: o item a ser retirado e  o seguinte ao apontado por  p --- */
  TipoApontador q;
  if (Vazia(*Lista) || p == NULL || p -> Prox == NULL)
  { printf(" Erro   Lista vazia ou posi  c   a o n  a o existe\n");
    return;
  }
  q = p -> Prox;
  *Item = q -> Item;
  p -> Prox = q -> Prox;
  if (p -> Prox == NULL) Lista -> Ultimo = p;
  free(q);
}

void Imprime(TipoLista Lista)
{ TipoApontador Aux;
  Aux = Lista.Primeiro -> Prox;
  while (Aux != NULL)
    { printf("%d\n", Aux -> Item.Chave);
      Aux = Aux -> Prox;
    }
}


int main(int argc, char*argv[]){
   TipoLista lista1, lista2, resultado;
   TipoApontador p;
   int i;
   TipoItem item;

   FLVazia(&lista1);
   FLVazia(&lista2);


   for (i = 1; i<=3; i++) {
       item.Chave = i;
       Insere(0,item, &lista1);
   }

   for (i = 4; i<=5; i++) {
       item.Chave = i;
       Insere(0,item, &lista2);
   }
   printf("Lista1 \n");
   Imprime(lista1);

   printf("Lista2 \n");
   Imprime(lista2);

 printf("\n-----------\n\n");
   printf("Lista1 modificada\n");
   item.Chave = 100;
   Insere(2,item, &lista1);
   Imprime(lista1);

   printf("\n");

   printf("Lista1 modificada novamente\n");
   item.Chave = -99;
   Insere(3,item, &lista1);
   Imprime(lista1);


   return(0);
}
