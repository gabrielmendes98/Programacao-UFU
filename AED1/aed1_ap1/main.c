#include <stdio.h>
#include <stdlib.h>

int main()
{
    int i, j;
    int n;

    printf("Digite o numero de alunos: ");
    scanf("%d", &n);
    float notas[3][n], media[3], total[n], maior=0, porcentagem=0;

    for(i=0;i<3;i++){
        media[i]=0;
        printf("Digite as notas da prova %d:\n", i+1);
        for(j=0;j<n;j++){
            printf("Aluno %d: ", j+1);
            scanf("%f", &notas[i][j]);
            media[i]=media[i]+(notas[i][j]/n);
        }
    }
    printf("\nMedias:\n");
    for(i=0;i<3;i++){
        printf("Prova %d: %f\n", i+1, media[i]);
    }

    maior=notas[2][0];
    for(i=0;i<n;i++){
        if(maior<notas[2][i])
            maior=notas[2][i];
    }

    porcentagem=10/maior;

    for(i=0;i<n;i++){
        notas[2][i]=notas[2][i]*porcentagem;
        total[i]=0;
    }

    for(i=0;i<n;i++){
        for(j=0;j<3;j++){
            total[i]=total[i]+notas[j][i];
        }
    }

    printf("\nNotas totais:\n");
    for(i=0;i<n;i++)
        printf("Total do aluno %d: %f\n",i+1,total[i]);

    return 0;
}
