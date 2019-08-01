#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {

	FILE *f;

	char nome[100];
	scanf("Digite o nome do arquivo: %s", nome);
	gets(nome);
	f = fopen(nome,"r");

	int num_linhas = 0;
	char lido;
	while((lido = getc(f))!=EOF){
        if(lido=='\n')
            num_linhas++;

	}

	printf("Numero de linhas: %d", num_linhas);
	fclose(f);

	return 0;
}
