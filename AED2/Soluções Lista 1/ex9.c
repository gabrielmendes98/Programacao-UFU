#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int main() {

    FILE *f1, *f2, *fr;
    char nome1[20];
    char nome2[20];
    gets(nome1);
    gets(nome2);

    f1=fopen(nome1,"r");
    f2=fopen(nome2,"r");
    fr=fopen("arqResult.txt","a");

    char linha[40];
    while(1){
        fgets(linha,40,f1);
        if(feof(f1))
            break;
        fprintf(fr,"%s",linha);
    }

    while(1){
        fgets(linha,40,f2);
        if(feof(f2))
            break;
        fprintf(fr,"%s",linha);
    }

    fclose(f1);
    fclose(f2);
    fclose(fr);

	return 0;
}
