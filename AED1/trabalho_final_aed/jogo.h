#ifndef JOGO_H_INCLUDED
#define JOGO_H_INCLUDED

#include "pilha.h"
#include "fila_jogadores.h"
#include "lista.h"

void cria_mapa(lista *mapa);
void imprime_mapa(lista *mapa);
void cria_pilha(pilha *pilha);
void cria_fila(fila *fila);

#endif // JOGO_H_INCLUDED
