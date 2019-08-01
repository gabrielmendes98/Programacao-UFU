#include <sys/time.h>
#include <stdlib.h>
#include <stdio.h>

#include <assert.h>
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

void Insere_Pos(unsigned int pos, TipoItem x, TipoLista *Lista)
{
    TipoApontador p;
    p = Lista->Primeiro;

    for(unsigned int i=0; i<pos; i++){
        p = p -> Prox;
        if(!p)
            return;
    }

    TipoApontador novo = malloc(sizeof *novo);
    novo->Item = x;

    novo->Prox = p->Prox;
    p->Prox = novo;

    if(p==Lista->Ultimo)
        Lista->Ultimo=novo;
}

void Insere_Ult(TipoItem x, TipoLista *Lista)
{ Lista -> Ultimo -> Prox = (TipoApontador) malloc(sizeof(TipoCelula));
  Lista -> Ultimo = Lista -> Ultimo -> Prox;
  Lista -> Ultimo -> Item = x;
  Lista -> Ultimo -> Prox = NULL;
}

void Concatena(const TipoLista *lista1, const TipoLista *lista2, TipoLista *resultado){
    FLVazia(resultado);
    TipoApontador p;

    p = lista1->Primeiro->Prox;
    while(p){
        Insere_Ult(p->Item, resultado);
        p=p->Prox;
    }

    p=lista2->Primeiro->Prox;
    while(p){
        Insere_Ult(p->Item, resultado);
        p=p->Prox;
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
   FLVazia(&lista1); FLVazia(&lista2);
   TipoItem item;
   for (i = 1; i<=3; i++) {
       item.Chave = i;
       Insere_Ult(item, &lista1);
   }
   for (i = 4; i<=5; i++) {
       item.Chave = i;
       Insere_Ult(item, &lista2);
   }

   printf("Lista1 \n");
   Imprime(lista1);

   p = lista1.Primeiro;
   Retira(p, &lista1, &item);

   printf("Lista 1\n");
   Imprime(lista1);

   p = lista2.Primeiro;
   Retira(p, &lista2, &item);
   printf("Lista 2\n");
   Imprime(lista2);

   printf("-----------\n");
   Concatena(&lista1,&lista2,&resultado);
   Imprime(resultado);

   return(0);
}
