#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define max 6

void insertionSort(char v[][20], int n){
    int i,j;
    char aux[20];
    for(i=1;i<n;i++){
        strcpy(aux, v[i]);
        for(j=i; (j>0) && (strcmp(aux,v[j-1]) < 0) ; j--)
            strcpy(v[j],v[j-1]);
         strcpy(v[j],aux);
    }
}

void insereNome(char v[][20], int n, char *nome){
    strcpy(v[n],nome);
    insertionSort(v,n+1);
}

int main()
{
    int n=0;
    char nomes[max][20];

    insereNome(nomes, n++, "gabriel");
    insereNome(nomes, n++, "yan");
    insereNome(nomes, n++, "gabriella");

    insereNome(nomes, n++, "pedro");
    insereNome(nomes, n++, "joao");
    insereNome(nomes, n++, "vezono");

    int i;
    for(i=0;i<max;i++){
        printf("%s\n",nomes[i]);
    }

    return 0;
}
