/* ========================================================================== */
#include <sys/time.h>
#include <stdio.h>
#include <stdlib.h>
#define INICIOARRANJO   1
#define MAXTAM          1000

typedef int TipoChave;

typedef int TipoApontador;

typedef struct {
  TipoChave Chave;
  /* outros componentes */
} TipoItem;

typedef struct {
  TipoItem Item[MAXTAM];
  TipoApontador Primeiro, Ultimo;
} TipoLista;

/* ========================================================================== */

void FLVazia(TipoLista *Lista)
{
  Lista -> Ultimo = -1;
}  /* FLVazia */

int Vazia(TipoLista Lista)
{ return (Lista.Ultimo == -1);
}  /* Vazia */

int cheia(const TipoLista* Lista){
    return (Lista->Ultimo >= MAXTAM - 1);
}

void Insere(TipoItem x, TipoLista *Lista)
{ if (cheia(Lista)) printf("Lista esta cheia\n");
  else { Lista -> Item[Lista -> Ultimo + 1] = x;
         Lista -> Ultimo++;
       }
}  /* Insere */

void InsereNaPosicao(TipoItem x, TipoApontador posicao, TipoLista* Lista) {
    int aux;
    if (Lista -> Ultimo < posicao-1) {
        printf("Posicao invalida");
        return;
    }
    if (cheia(Lista)) {
        printf("Lista esta cheia\n");
        return;
    }
    for (aux = Lista->Ultimo; aux >= posicao; aux--) {
        Lista->Item[aux+1] = Lista->Item[aux];
    }
    Lista->Item[posicao] = x;
    Lista->Ultimo++;
}

void Retira(TipoApontador p, TipoLista *Lista, TipoItem *Item)
{ int Aux;

  if (Vazia(*Lista) || p > Lista -> Ultimo)
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

  for (Aux = 0; Aux <= (Lista.Ultimo); Aux++)
    printf("%d\n", Lista.Item[Aux].Chave);
}  /* Imprime */

void retira_na_pos(TipoApontador pos, TipoLista *Lista){
    if(Vazia(*Lista)|| pos > Lista -> Ultimo){
            printf("Erro Posicao nao existe!\n");
            return;
    }
    int i;
    for(i=pos; i <= Lista->Ultimo; i++){
        Lista->Item[i]=Lista->Item[i+1];
    }
    Lista->Ultimo--;
}

/* ========================================================================== */

int main(int argc, char *argv[])
{ //struct timeval t;

  TipoLista lista;
  TipoItem item;
  FLVazia(&lista);

  printf("---\n%d\n---\n", Vazia(lista));

  item.Chave=33;
  InsereNaPosicao(item,0,&lista);

  item.Chave=99;
  Insere(item, &lista);
  InsereNaPosicao(item,0,&lista);

  item.Chave=11;
  InsereNaPosicao(item,1,&lista);

  Imprime (lista);

  printf("--------\n");
  retira_na_pos(0,&lista);
  Imprime (lista);

  printf("--------\n");
  retira_na_pos(0,&lista);
  Imprime (lista);

  printf("--------\n");
    retira_na_pos(0,&lista);
  Imprime (lista);

  printf("--------\n");
    retira_na_pos(0,&lista);
  Imprime (lista);

  printf("--------\n");
    retira_na_pos(0,&lista);
  Imprime (lista);

  printf("--------\n");
    retira_na_pos(0,&lista);
  Imprime (lista);
  return(0);
}
