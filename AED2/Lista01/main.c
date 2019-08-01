#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void insereAluno(char *nome, char **vetor, int tamanho){
    strcpy(vetor[tamanho-1],nome);
    vetor = (char **) realloc(vetor, (tamanho+1)*sizeof(char));
    vetor[tamanho] = (char *) realloc(vetor[tamanho], 40*sizeof(char));
}

void insereNota(float nota, float *vetor, int tamanho){
    vetor[tamanho-1] = nota;
    vetor = (float *) realloc(vetor,(tamanho+1)*sizeof(float)) ;
}

void exibirMenu(){
    printf("1 - Inserir aluno e notas.\n");
    printf("2 - Exibir media.\n");
    printf("3 - Exibir aprovados.\n");
    printf("4 - Ordenar por nota.\n");
    printf("5 - Salvar os dados em disco.\n");
    printf("0 - Sair.\n");

}

void exirMedia(char *nomeArquivo){
    FILE *fp = fopen(nomeArquivo,"r");

    char c;
    float nota;
    float media=0;
    int nAlunos=0;
    int i;

    while(1){
        c = fgetc(fp);
        if(feof(fp))
            break;
        for(i=0;i<38;i++)
            c = fgetc(fp);
        fscanf(fp,"%f",&nota);
        if(feof(fp))
            break;
        printf("%f\n",nota);
        media += nota;
        printf("%f\n",media);
        nAlunos++;
    }
    media = media/nAlunos;

    printf("Media dos alunos que ja estao no arquivo: %f\n\n", media);

    fclose(fp);
}

void completaNomes(char **vetorAlunos, int qtdAlunos){
    int i,j;

    for(i=0;i<qtdAlunos-1;i++){
        for(j=strlen(vetorAlunos[i]);j<40;j++){
            strcat(vetorAlunos[i]," ");
        }
    }
}


void salvaDados(char *nomeArquivo, char **vetorAlunos, float *vetorNotas, int qtdAlunos){
    FILE *fp = fopen(nomeArquivo,"a");
    int i;

    if(fp == NULL){
        printf("Erro ao abrir arquivo!\n");
        exit(1);
        system("pause");
    }

    completaNomes(vetorAlunos, qtdAlunos);

    for(i=0;i<qtdAlunos-1;i++)
        fprintf(fp,"%s%.2f\r\n",vetorAlunos[i],vetorNotas[i]);

    printf("Os dados foram salvos no disco!\n");

    fclose(fp);
}

// inserir aluno e nota
// exibir media
// exibir aprovados
// ordenar por nota
// salvar os dados em disco
// sair

int main() {

    char **alunos = (char **) malloc(sizeof(char *));
    alunos[0] = (char *) malloc(40*sizeof(char));

    float *notas = (float *) malloc(sizeof(float));

    char nomeArquivo[20];
    printf("Digite o nome do arquivo: ");
    scanf("%[^\n]", nomeArquivo);

    int opcaoMenu=1;
    char nomeAluno[40];
    float notaAluno;
    int contadorAlunos = 1;

    while(opcaoMenu != 0){
        exibirMenu();
        scanf("%d", &opcaoMenu);
        switch(opcaoMenu){
            case 1:
                scanf("%*[^\n]"); scanf("%*c");
                printf("Digite o nome do aluno: ");
                scanf("%[^\n]", nomeAluno);
                insereAluno(nomeAluno, alunos, contadorAlunos);
                printf("Digite a nota do aluno: ");
                scanf("%f",&notaAluno);
                insereNota(notaAluno, notas, contadorAlunos++);
            break;
            case 2:
                exirMedia(nomeArquivo);
            break;
            case 5:
                salvaDados(nomeArquivo, alunos, notas, contadorAlunos);
            break;
            case 0:
                exit(1);
            break;
            default:
                printf("Valor invalido!\n");
        }
    }


    //system("pause");
	return 0;
}
