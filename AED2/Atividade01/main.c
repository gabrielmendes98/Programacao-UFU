#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "ListaSequencial.h"
//include "ListaDinEncad.h"

int main(){

    FILE *fp = fopen("temposListaSequencial.txt","a");

    struct aluno a = {1,"Gabriel",1,2,3};
    Lista* li = cria_lista();

    int n = 100000;
    int i;
    for(i=0;i<n;i++)
        insere_lista_final(li,a);

    /*---------------------------------------*/
    clock_t inicio,fim;
    unsigned long int tempo;
    inicio=clock();

    for(i=0;i<n;i++)
        consulta_lista_pos(li,i,&a);

    fim=clock();
    tempo=(fim-inicio)*1000/CLOCKS_PER_SEC;
    printf("tempo: %lu milissegundo\n",tempo);
    /*---------------------------------------*/

    fprintf(fp,"%d\t%lu\r\n",n,tempo);

    fclose(fp);

    return 0;
}
