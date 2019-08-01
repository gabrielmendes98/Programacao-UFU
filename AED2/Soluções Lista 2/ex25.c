#include <stdio.h>
#include <stdlib.h>

int buscaBinaria(int *v, int n, int alvo){
    int i,inicio,meio,fim;
    inicio=0;
    fim=n-1;
    while(inicio<=fim){
        meio=(inicio+fim)/2;
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
    int v[12] = {1,2,3,4,5,7,8,9,10,11,12,13};
    int x = buscaBinaria(v,12,6);
    printf("%d\n",x);
    return 0;
}
