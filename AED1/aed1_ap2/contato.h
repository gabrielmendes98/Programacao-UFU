#ifndef CONTATO_H_INCLUDED
#define CONTATO_H_INCLUDED

typedef struct contato{
   char nome[20];
   char telefone[20];
}Contato;

Contato* cria_Contato(char *nome, char *telefone);
void libera_Contato(Contato* c);
void acessa_Contato(Contato* c, char *nome, char *telefone);
void atribui_Contato(Contato* c, char *nome, char *telefone);

#endif // CONTATO_H_INCLUDED
