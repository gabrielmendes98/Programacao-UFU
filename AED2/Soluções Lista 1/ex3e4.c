#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int ehVogal(char c){

    if(c=='a' || c=='e' || c=='i' || c=='o' || c=='u')
        return 1;
    return 0;

}

int main() {

    FILE *f;
    char nome[20];
    printf("Digite o nome do arquivo: ");
    gets(nome);
    f=fopen(nome,"r");

    if(f==NULL){
        printf("Erro na abertura.\n");
        exit(1);
    }

    int vogalCount=0;
    int consoanteCount=0;
    char c;
    while((c=getc(f))!=EOF){
        if(ehVogal(c))
            vogalCount++;
        else if(isalpha(c)){
            consoanteCount++;
        }
    }

    printf("%d vogais e %d consoantes\n", vogalCount, consoanteCount);

    fclose(f);

	return 0;
}
