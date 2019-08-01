#include <stdio.h>
#include <stdlib.h>

int buscaBinaria(int *v, int n, int alvo){
    int i,inicio,meio,fim;
    inicio=0;
    fim=n-1;
    while(inicio<=fim){
        meio=(inicio+fim)/2;
        printf("meio: %d\n",v[meio]);
        if(alvo<v[meio])
            fim=meio-1;
        else if(alvo>v[meio])
            inicio=meio+1;
        else
            return v[meio];
    }

    return -1;
}

int main()
{
    int v[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31};
    int x = buscaBinaria(v,31,1);
    printf("%d\n",x);
    return 0;
}
