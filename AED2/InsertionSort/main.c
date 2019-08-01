#include <stdio.h>
#include <stdlib.h>

void insertionSort(int *v,int n){
    int i,j,aux;
    for(i=1;i<n;i++){
        aux=v[i];
        for(j=i;(j>0) && (aux<v[j-1]); j--)
            v[j] = v[j-1];
        v[j]=aux;
    }
}


int main()
{
    int v[8] = {1,7,8,4,3,2,6,5};
    insertionSort(v,8);
    int i;
    for(i=0;i<8;i++)
        printf("%d\n",v[i]);
    return 0;
}
