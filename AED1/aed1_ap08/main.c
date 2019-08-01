#include<stdio.h>
#include<stdlib.h>
#include "stack.h"

int main()
{
    stack s;
    int num, numaux;
    s.top=-1;

    printf("Entre com o numero decimal: ");
    scanf("%d",&num);
    numaux=num;

    transform(&s, num);

    printf("\n%d em binario: ", numaux);
    print(s);
    printf("\n");

    return 0;
}
