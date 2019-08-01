#include <stdio.h>
#include <stdlib.h>

void verificaOrdenado(int *vetor, int tamanho){
    int i, j, menor;
    for(i=0;i<tamanho;i++){
        menor=vetor[i];
        for(j=i+1;j<tamanho;j++){
            if(menor>vetor[j]){
                printf("NAO ORDENADO.\n");
                return;
            }
        }
    }
    printf("ORDENADO.\n");
}

int main()
{
    int v[5] = {1,2,3,4,5};
    verificaOrdenado(v,5);
    return 0;
}
