#include <stdio.h>
#include <stdlib.h>

int main()
{
    FILE *fp;
    fp = fopen("compra.txt", "r");

    if(fp == NULL){
        printf("Erro na abertura!\n");
        system("pause");
        exit(1);
    }

    char nome[20];
    int qtd;
    float preco;
    float total;

    while(1){
        fscanf(fp, "%s %d %f", nome, &qtd, &preco);
        if(feof(fp))
            break;
        total += qtd*preco;
    }

    printf("Total: %.2f\n", total);

    fclose(fp);

    return 0;
}
