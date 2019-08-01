#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define max 5

int conta(char *nome){
    int n=0;
    while(1){
        if(nome[n]=='\0')
            return n;
        n++;
    }
}

void selectionSort(char v[][20], int n){
    int i,pos,menor,j;
    char aux[20];

    for(i=0;i<n-1;i++){
        menor=conta(v[i]);
        for(j=i+1;j<n;j++)
            if(conta(v[j])<menor){
                menor=conta(v[j]);
                pos=j;
            }
        if(conta(v[i])!=menor){
            strcpy(aux,v[pos]);
            strcpy(v[pos],v[i]);
            strcpy(v[i],aux);
        }
    }

}

int main()
{
    char v[max][20];
    scanf("%s",v[0]);
    scanf("%s",v[1]);
    scanf("%s",v[2]);
    scanf("%s",v[3]);
    scanf("%s",v[4]);

    selectionSort(v,max);

    int i;
    for(i=0;i<max;i++)
        printf("%s ",v[i]);

    return 0;
}
