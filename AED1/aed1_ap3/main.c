#include <sys/time.h>
#include <stdio.h>
#include <stdlib.h>
#include "listaArray.h"

int main(int argc, char *argv[])
{ struct timeval t;

  TipoLista lista;
  TipoItem item;
  int vetor[MAXTAM];
  int i, j, k, n, max;
  gettimeofday(&t,NULL);
  srand((unsigned int)t.tv_usec);
  max = 10;
  FLVazia(&lista);

  /*Gera uma permutacao aleatoria de chaves entre 1 e max*/
  for(i = 0; i < max; i++) vetor[i] = i + 1;
  for(i = 0; i < max; i++)
    { k =  (int) (10.0 * rand()/(RAND_MAX + 1.0));
      j =  (int) (10.0 * rand()/(RAND_MAX + 1.0));
      n = vetor[k];
      vetor[k] = vetor[j];
      vetor[j] = n;
    }
  /*Insere cada chave na lista */
  for (i = 0; i < max; i++) {
      item.Chave = vetor[i];
      //Insere(item, &lista);
      InsereNaPosicao(item, i+1, &lista);
      printf("Inseriu %d na posicao %d: \n", item.Chave, i+1);
  }
  Imprime(lista);
  printf("-----------------\n");
  item.Chave = 99;
  InsereNaPosicao(item, 3, &lista);
  Imprime(lista);

//Inserção em uma posição qualquer da lista
 printf("\n----- INSERINDO EM UMA POSICAO QUALQUER DA LISTA -----\n");
 printf("Inserindo na posicao 2 e 7...\n");
 item.Chave = 999;
 InsereNaPosicao(item, 2, &lista);
 item.Chave = 666;
 InsereNaPosicao(item, 7, &lista);
 Imprime (lista);

  //Retira cada chave da lista
  printf("\n-----------------\n");
  for(i = 0; i < max; i++)
    { //escolhe uma chave aleatoriamente
      j = (int) ((lista.Ultimo - 1) * rand() / (RAND_MAX + 1.0));
      // retira chave apontada
      Retira(j, &lista, &item);
      printf("Retirou: %d\n", item.Chave);
    }
  Imprime (lista);

//Testando a função lista_cheia
 printf("\n----- TESTANDO LISTA CHEIA -----\n");
 lista_cheia(&lista);
 printf("%d\n", lista.Ultimo);

 //Testando a função lista_vazia
 printf("\n----- TESTANDO LISTA VAZIA -----\n");
 FLVazia(&lista);
 lista_vazia(&lista);
 printf("%d\n", lista.Ultimo);

 return 0;
}
