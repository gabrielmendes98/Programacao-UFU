#include <stdio.h>
#include <stdlib.h>

int main()
{
    FILE *fp;
    fp = fopen("exemplo.txt","a");
    if(fp == NULL){
        printf("Erro na abertura.\n");
        system("pause");
        exit(1);
    }

    char nome[20]="teste";
    int idade=17;
    float altura=1.88;

    fprintf(fp,"%s %d %.2f\n",nome,idade,altura);

    fclose(fp);

    return 0;
}
