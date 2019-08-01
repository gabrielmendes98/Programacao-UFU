#include <stdio.h>
#include <stdlib.h>

void deslocaVetor(int *v,int n, int pos){
    int i;
    for(i=n-2;i>=pos;i--){
        v[i+1]=v[i];
    }
}

void insereOrdenado(int *v, int n, int elem){
    int i;

    n=n+1;
    v=(int*) realloc(v,n*sizeof(int));

    for(i=0;i<n-1;i++){
        if(v[i]>=elem){
            deslocaVetor(v,n,i);
            v[i]=elem;
            return;
        }
    }
    v[n-1]=elem;
}

int main()
{
    int x;
    scanf("%d",&x);

    int *v=(int*)malloc(4*sizeof(int));
    v[0]=1;
    v[1]=2;
    v[2]=3;
    v[3]=4;

    insereOrdenado(v,4,x);

    int i;
    for(i=0;i<5;i++)
        printf("%d ",v[i]);

    return 0;
}
