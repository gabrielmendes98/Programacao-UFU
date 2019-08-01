#ifndef FILAPRIORIDADEINGENUA_H_INCLUDED
#define FILAPRIORIDADEINGENUA_H_INCLUDED

#define SIZE 5000            /* Size of Queue */
typedef struct PRQ
{
    int ele;
    int pr;
} PriorityQ;

typedef struct aaa
{
    int f;
    int r;
} Prioridade;

void PQinsert(int elem, int pre, PriorityQ *PQ, Prioridade *pri);
PriorityQ PQdelete(PriorityQ *PQ, Prioridade *pri);
int Qfull(Prioridade pri);
int Qempty(Prioridade pri);
display(PriorityQ *PQ,Prioridade pri);
void init_pri(Prioridade *pri);

#endif // FILAPRIORIDADEINGENUA_H_INCLUDED
