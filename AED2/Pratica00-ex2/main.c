#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
    FILE *fp;
    fp = fopen("notas.txt", "r");

    if(fp == NULL){
        printf("Erro na abertura!\n");
        system("pause");
        exit(1);
    }

    char nome[20], jump[20], alunoMaiorNota[20];
    float nota;
    float total = 0;
    float media;
    float maior = 0;
    int qtdAlunos = 0;

    while(1){
        fscanf(fp, "%s %s %s %f", jump, nome, jump, &nota);
        if(feof(fp))
            break;
        total += nota;
        if(nota > maior){
            maior = nota;
            strcpy(alunoMaiorNota, nome);
        }
        qtdAlunos++;
    }

    media = total/qtdAlunos;

    printf("Total: %f\n", total);
    printf("Media: %.2f\n", media);
    printf("Aluno com a maior nota: %s - Nota: %.2f\n", alunoMaiorNota, maior);

    fclose(fp);

    return 0;
}
