#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int main() {

    FILE *f;
    char nome[20];
    printf("digite o nome do arq: ");
    gets(nome);
    f=fopen(nome,"r");

    if(f==NULL){
        printf("Erro na abertura!\n");
        exit(1);
    }

    int count[26];
    char c;
    int i;

    for(i=0;i<26;i++)
        count[i]=0;

    while(1){
        c = getc(f);
        c = tolower(c);
        if(c==EOF)
            break;
        if(isalpha(c)){
            i = (c - 'a');
            count[i]++;
        }
    }

    printf("letra/qtd\n");

    for(i=0;i<26;i++){
        c = 'a' + i;
        printf("%c = %d\n",c,count[i]);
    }

    fclose(f);

	return 0;
}
