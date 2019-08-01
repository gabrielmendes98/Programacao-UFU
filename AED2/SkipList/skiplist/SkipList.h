/*
Grupo GVY
Integrantes:
Gabriel Mendes de Souza Santiago - 11621BCC015
Vinícius Guardieiro Sousa - 11811BCC008
Yan Lucas Damasceno Dias - 11621BCC029
*/

#define level_max 6

typedef struct no{
    int info;
    struct no *prox, *abaixo;
} no;

typedef struct skiplist{
    int level;
    no* inicio;
} skiplist;

skiplist* criaSkipList();
void liberaSkipList(skiplist *sk);
int insereSkipList(skiplist *sk, int numero);
int removeSkipList(skiplist *sk, int valor);
int buscaSkipList(skiplist *sk, int chave);
int tamanhoSkipList(skiplist *sk);
int vaziaSkipList(skiplist *sk);
void imprimeSkipList(skiplist *sk);
