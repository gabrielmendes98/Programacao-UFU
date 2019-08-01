#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int calculaIdade(int dia, int mes, int ano, int diaP, int mesP, int anoP){
    int idade = ano - anoP;
    if(mes < mesP)
        idade--;
    if(mes == mesP && dia < diaP)
        idade--;
    return idade;
}

int main() {

    FILE *en, *sa;
    char entrada[20], saida[20];
    int dia, mes, ano;
    printf("Digite o nome do arq de entrada: ");
    gets(entrada);
    printf("Digite o nome do arq de saida: ");
    gets(saida);
    printf("Digite a data de nascimento DD MM AAAA: ");
    scanf("%d %d %d", &dia, &mes, &ano);

    en=fopen(entrada,"r");
    sa=fopen(saida,"w");

    int i;
    char c;
    int diaP,mesP,anoP;
    int idade;
    while(1){
        c=getc(en);
        fputc(c,sa);
        for(i=0;i<39;i++){
            c=fgetc(en);
            fputc(c,sa);
        }
        fscanf(en,"%d %d %d",&diaP,&mesP,&anoP);
        if(feof(en))
            break;

        idade = calculaIdade(dia,mes,ano,diaP,mesP,anoP);
        if(idade>18)
            fprintf(sa,"maior de idade\n");
        else if(idade<18)
            fprintf(sa,"menor de idade\n");
        else
            fprintf(sa,"entrando na maior idade\n");
    }

    fclose(en);
    fclose(sa);

	return 0;
}
