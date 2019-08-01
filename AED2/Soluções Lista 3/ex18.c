#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void bubbleSort(char *v){
    int i, j, n=0, aux;

    while(1){
        if(v[n]=='\0')
            break;
        n++;
    }

    for(i=0;i<n-1;i++){
        for(j=0;j<n-i-1;j++)
            if(v[j]>v[j+1]){
                aux=v[j+1];
                v[j+1]=v[j];
                v[j]=aux;
            }
    }
}

int main()
{
    char nome[]="gabriellaz";
    bubbleSort(nome);
    printf("%s\n",nome);

    return 0;
}
