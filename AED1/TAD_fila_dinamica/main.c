#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

typedef struct celula
{
    char nome[20];
    int pontos;
    struct celula *next;
}celula;

typedef struct fila
{
    celula *frente;
    celula *tras;
}fila;

void init_fila(fila *f)
{
    f->frente=malloc(sizeof(celula));
    f->tras=f->frente;
    f->frente->next=NULL;
}

int fila_vazia(fila f)
{
    return(f.frente==f.tras);
}

void adiciona_jogador(fila *f, char *nome, int pontos)
{
    f->tras->next=malloc(sizeof(celula));
    f->tras=f->tras->next;
    f->tras->pontos=pontos;
    strcpy(f->tras->nome,nome);
    f->tras->next=NULL;
}

void desenfileira(fila *f, char *nome, int *pontos)
{
    if(fila_vazia(*f)){
        printf("Fila vazia!\n");
        return;
    }
    celula *q;
    q=malloc(sizeof(celula));
    q=f->frente;
    f->frente=f->frente->next;
    *pontos = f->frente->pontos;
    strcpy(nome,f->frente->nome);
    free(q);
}

void imprime_jogador(fila *f, char *nome)
{
    celula *q;
    q=malloc(sizeof(celula));
    q=f->frente;
    while(q!=NULL){
        if(strcmp(q->nome,nome)==0){
            printf("Jogador: %s\nPontos: %d\n", q->nome,q->pontos);
            break;
        }
        else
            q=q->next;
    }
}

int tira_dado()
{
    int dado;
    dado = 1 + rand() % 6;
    return dado;
}

int main()
{
    fila f;
    init_fila(&f);
    char nome[20];
    int pontos=0, dado;
    srand(time(NULL));

    adiciona_jogador(&f,"gabriel",0);
    adiciona_jogador(&f,"yan",0);
    adiciona_jogador(&f,"marcelo",0);

    while(pontos<20){
        desenfileira(&f,nome,&pontos);
        dado=tira_dado();
        pontos=pontos+dado;
        printf("%s tirou %d no dado, totalizando %d pontos\n", nome, dado, pontos);
        adiciona_jogador(&f,nome,pontos);
    }

    printf("\n************\n%s ganhou!\n************\n",nome);

    return 0;
}
