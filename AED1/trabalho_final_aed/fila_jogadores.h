#ifndef FILA_JOGADORES_H_INCLUDED
#define FILA_JOGADORES_H_INCLUDED

typedef struct celula_fila
{
    char nome[20];
    int tentativas;
    struct celula_fila *next;
}celula_fila;

typedef struct fila
{
    celula_fila *frente;
    celula_fila *tras;
}fila;

void init_fila(fila *f);
int fila_vazia(fila f);
void adiciona_jogador(fila *f, char *nome, int tentativas);
void desenfileira_jogador(fila *f, char *nome);
void imprime_jogador(fila *f, char *nome);

#endif // FILA_JOGADORES_H_INCLUDED
