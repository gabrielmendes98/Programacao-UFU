#include <stdio.h>
#include <stdlib.h>

typedef struct ListElmt_{
 int data;
 struct ListElmt_ *next;
} ListElmt;
typedef struct List_ {
 int size;
 ListElmt *head;
 ListElmt *tail;
} List;

void list_init(List *list) {
 list->size = 0;
 list->head = malloc(sizeof(ListElmt));
 list->tail = list->head;
 list->head->next = NULL;
}

void Imprime(List list)
{ ListElmt *Aux;
  Aux = list.head->next;
  while (Aux != NULL)
    { printf("%d\n", Aux -> data);
      Aux = Aux -> next;
    }
}

void insere_pos(List *list, int pos, int x){
    ListElmt *p, *novo;
    int i;
    p = list->head;

    for(i=0; i<pos; i++)
        p = p->next;

    novo = malloc(sizeof(ListElmt));
    novo->data = x;
    novo->next = p->next;
    p->next = novo;

    if(p==list->tail)
        list->tail=novo;
}

void remove_na_pos(List *list, int pos){
    if(list==NULL)
        return;

    ListElmt *p, *aux;
    int i;

    p = list->head;
    for(i=0;i<pos;i++)
        p = p->next;

    aux=p->next;
    p->next=aux->next;
    free(aux);
}

void remove_primeiro(List *list, int *removido){
    ListElmt *p;
    p=list->head->next;
    *removido=p->data;
    remove_na_pos(list, 0);
}

void insere_final(List *list, int x){
    list->tail->next = malloc(sizeof(ListElmt));
    list->tail = list->tail->next;
    list->tail->data=x;
    list->tail->next = NULL;
}

void remove_iesimo(List *list, int pos, int *removido){
    ListElmt *p;
    p=list->head;

    int i;
    for(i=0; i<pos; i++)
        p = p->next;

    *removido=p->data;

    remove_na_pos(list, pos-1);
}

void remove_ij(List *list, int i, int j){
    if(i>j){
        printf("i deve ser menor que j");
        return;
    }
    int var_de_controle = i-1, pos_removida = i-1;
    for(; var_de_controle<j; var_de_controle++)
        remove_na_pos(list, pos_removida);
}

int main()
{
    List lista;
    int i, removido;
    list_init(&lista);

    for(i=0;i<5;i++)
        insere_pos(&lista, i, (i+1)*10);

    printf("Lista Inicial:\n");
    Imprime(lista);

    //Remove primeiro elemento e armazena em removido (Questao 1)
    remove_primeiro(&lista, &removido);
    printf("-------------\n");
    printf("Elemento Removido: %d\nNova Lista:\n", removido);
    Imprime(lista);

    //Insere no final da lista (Questao 2)
    printf("-------------\n");
    printf("Inserindo no final...\n");
    int x=99;
    insere_final(&lista, x);
    Imprime(lista);

    //Remove de i-esimo e retorna elemento removido (Questao 3)
    printf("-------------\n");
    int pos = 3;
    remove_iesimo(&lista, pos, &removido);
    printf("Removendo da posicao %d\nElemento removido: %d\n", pos, removido);
    printf("Nova lista:\n");
    Imprime(lista);

    //Cria nova lista para testes
    printf("-------------\n");
    list_init(&lista);
    for(i=0;i<7;i++)
        insere_pos(&lista, i, (i+1)*10);
    printf("Lista Inicial:\n");
    Imprime(lista);

    //Remove de i a j (Questao 4)
    printf("-------------\n");
    printf("Removido das posicoes 2 ate 5\n");
    printf("Nova lista:\n");
    int de=2, ate=5;
    remove_ij(&lista, de, ate);
    Imprime(lista);

    return 0;
}
