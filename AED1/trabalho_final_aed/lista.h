#ifndef LISTA_H_INCLUDED
#define LISTA_H_INCLUDED

typedef struct celula_lista
{
    char elemento;
    int possibilidades;
    struct celula_lista *next;
}celula_lista;

typedef struct lista
{
    celula_lista *head;
    celula_lista *tail;
}lista;

void init_lista(lista *l);
int lista_vazia(lista l);
void insere_ultimo(lista *l, char elemento, int possibilidades);
void imprime_lista(lista l);
void insere_na_pos(lista *l, char elemento, int pos);
void remove_pos(lista *l, int pos);
void pega_pos(lista *l, int pos, char *elemento, int *possibilidades);

#endif // LISTA_H_INCLUDED
