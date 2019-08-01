#ifndef AGENDA_H_INCLUDED
#define AGENDA_H_INCLUDED

typedef struct{
   char nome[20];
   char telefone[20];
} Agenda;
Agenda* agenda;

int cria_Agenda();
void pesquisa_Agenda(int tam);

#endif // AGENDA_H_INCLUDED
