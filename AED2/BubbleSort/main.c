#include <stdio.h>
#include <stdlib.h>

void bubbleSort(int *v, int n){
    int i,j,aux;
    for(i=0;i<n-1;i++){
        for(j=0;j<n-i-1;j++){
            if(v[j]>v[j+1]){
                aux=v[j];
                v[j]=v[j+1];
                v[j+1]=aux;
            }
        }
    }
}

int main()
{
    int v[] = {3,6,5,8,7,2,1,4};
    bubbleSort(v,8);
    int i;
    for(i=0;i<8;i++)
        printf("%d\n",v[i]);
    return 0;
}
