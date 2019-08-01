#include<stdio.h>
#include<stdlib.h>
#include <time.h>
#include "FilaPrioridadeIngenua.h"

main()
{
    /* Main Program */
    int opn;
    PriorityQ PQ[SIZE];
    PriorityQ p;
    Prioridade pri;
    init_pri(&pri);

    //teste

    //printf("## Testes automatizados ##\n\n\n");
    srand(time(NULL));
    int i,random;
    for(i=0; i<5000;i++){
        random=rand() % 5000;
        PQinsert(i,random,&PQ,&pri);
    }
    printf("Lista inicial:\n");
    display(&PQ,pri);

    /*
    p=PQdelete(&PQ,&pri);
    printf("\n\nDeleted Element is %d \n",p.ele);
    printf("Lista nova:\n");
    display(&PQ,pri);

    printf("\nAdd 10 com prioridade 10\n");
    printf("Lista nova:\n");
    PQinsert(10,10,&PQ,&pri);
    display(&PQ,pri);
    */

   /*
    do
    {
        printf("\n ### Priority Queue Operations(DSC order) ### \n\n");
        printf("\n Press 1-Insert, 2-Delete,3-Display,4-Exit\n");
        printf("\n Your option ? ");
        scanf("%d",&opn);
        switch(opn)
        {
        case 1:
            printf("\n\nRead the element and its Priority?");
            scanf("%d%d",&p.ele,&p.pr);
            PQinsert(p.ele,p.pr,&PQ,&pri);
            break;
        case 2:
            p=PQdelete(&PQ,&pri);
            if( p.ele != -1)
                printf("\n\nDeleted Element is %d \n",p.ele);
            break;
        case 3:
            printf("\n\nStatus of Queue\n\n");
            display(&PQ,pri);
            break;
        case 4:
            printf("\n\n Terminating \n\n");
            break;
        default:
            printf("\n\nInvalid Option !!! Try Again !! \n\n");
            break;
        }
        //printf("\n\n\n\n  Press a Key to Continue . . . ");
        //getch();
    }
    while(opn != 4);
    */
}
