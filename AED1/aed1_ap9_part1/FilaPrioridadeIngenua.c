#include<stdio.h>
#include<stdlib.h>
#include "FilaPrioridadeIngenua.h"

void PQinsert(int elem, int pre, PriorityQ *PQ, Prioridade *pri)
{
    int i;       /* Function for Insert operation */
    if(Qfull(*pri)) printf("\n\n Overflow!!!!\n\n");
    else
    {
        i=pri->r;
        ++pri->r;
        while(PQ[i].pr >= pre && i >= 0) /* Find location for new elem */
        {
            PQ[i+1]=PQ[i];
            i--;
        }
        PQ[i+1].ele=elem;
        PQ[i+1].pr=pre;
    }
}

PriorityQ PQdelete(PriorityQ *PQ, Prioridade *pri)
{
    /* Function for Delete operation */
    PriorityQ p;
    if(Qempty(*pri))
    {
        printf("\n\nUnderflow!!!!\n\n");
        p.ele=-1;
        p.pr=-1;
        return(p);
    }
    else
    {
        p=PQ[pri->f];
        pri->f=pri->f+1;
        return(p);
    }
}

int Qfull(Prioridade pri)
{
    /* Function to Check Queue Full */
    if ( (pri.r==SIZE-1) && (pri.f==0) )return 1;
    return 0;
}

int Qempty(Prioridade pri)
{
    /* Function to Check Queue Empty */
    if(pri.f > pri.r) return 1;
    return 0;
}

display(PriorityQ *PQ,Prioridade pri)
{
    /* Function to display status of Queue */
    int i;
    if(Qempty(pri)) printf(" \n Empty Queue\n");
    else
    {
        printf("Front->");
        for(i=pri.f; i<=pri.r; i++)
            printf("[%d,%d] ",PQ[i].ele,PQ[i].pr);
        printf("<-Rear\n");
    }
}

void init_pri(Prioridade *pri)
{
    pri->f=0;
    pri->r=-1;
}

