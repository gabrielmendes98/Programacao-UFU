#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "FilaPrioridadeHeap.h"

void insert(HeapNode aNode, HeapNode* heap, int size)
{
    int iUp;
    HeapNode tmp;
    iUp = size + 1;
    heap[iUp] = aNode;
    while (heap[iUp].value < heap[iUp/2].value && iUp > 1)
    {
        tmp = heap[iUp];
        heap[iUp] = heap[iUp/2];
        heap[iUp/2] = tmp;
        iUp /= 2; // parent
    }
}

void shiftdown(HeapNode* heap, int size, int iParent)
{
    int iChild;        //index for child
    HeapNode tmp;
    for (;;)
    {
        iChild = iParent*2;
        if (iChild > size)
        {
            break;   //it has no child
        }
        if (iChild < size)
        {
            if (heap[iChild].value > heap[iChild+1].value) // choose sibling
            {
                ++iChild;
            }
        }
        //swap if necessary else stop
        if (heap[iChild].value < heap[iParent].value)
        {
            tmp = heap[iChild];
            heap[iChild] = heap[iParent];
            heap[iParent] = tmp;
            iParent = iChild;
        }
        else
        {
            break;
        }
    }
}

HeapNode removeMin(HeapNode* heap, int size)
{
    HeapNode min = heap[1];
    //printf("%d:%d:%dn", size, heap[1].value, heap[size].value);
    heap[1] = heap[size];
    --size;
    shiftdown(heap, size, 1);
    return min;
}
void enqueue(HeapNode node, PriorityQueue *q)
{
    insert(node, q->heap, q->size);
    ++q->size;
}

HeapNode dequeue(PriorityQueue *q)
{
    HeapNode min = removeMin(q->heap, q->size);
    --q->size;
    return min;
}

void initQueue(PriorityQueue *q, int n)
{
    q->size = 0;
    q->heap = (HeapNode*)malloc(sizeof(HeapNode)*(n+1));
}
