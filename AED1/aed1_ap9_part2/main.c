#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "FilaPrioridadeHeap.h"

int main(int argc, char **argv)
{
    int n;
    int i;
    PriorityQueue q;
    HeapNode hn;
    printf("Entre com o numero de elementos: ");
    //scanf("%d",&n);
    n=5000;
    initQueue(&q, n);
    srand(time(NULL));
    for (i = n; i >= 1; --i)
    {
        //hn.value = rand()%10000;
        hn.value = i;
        printf("enqueue node with value: %d\n", hn.value);
        enqueue(hn, &q);
    }
    printf("\ndequeue all values:\n");
    for (i = 0; i < n; ++i)
    {
        hn = dequeue(&q);
        printf("dequeued node with value: %d, queue size after removal: %d\n", hn.value, q.size);
    }

        time_t current_time;
    char* c_time_string;

    /* Obtain current time. */
    current_time = time(NULL);

    if (current_time == ((time_t)-1))
    {
        (void) fprintf(stderr, "Failure to obtain the current time.\n");
        exit(EXIT_FAILURE);
    }

    /* Convert to local time format. */
    c_time_string = ctime(&current_time);

    if (c_time_string == NULL)
    {
        (void) fprintf(stderr, "Failure to convert the current time.\n");
        exit(EXIT_FAILURE);
    }

    /* Print to stdout. ctime() has already added a terminating newline character. */
    (void) printf("Current time is %s", c_time_string);
    exit(EXIT_SUCCESS);
}
