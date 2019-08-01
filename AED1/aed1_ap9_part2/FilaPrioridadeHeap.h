#ifndef FILAPRIORIDADEHEAP_H_INCLUDED
#define FILAPRIORIDADEHEAP_H_INCLUDED

typedef struct heapData
{
    //dummy
} heapData;

typedef struct HeapNode
{
    int value;
    heapData data;               //dummy
} HeapNode;

typedef struct PriorityQueue
{
    HeapNode* heap;
    int size;
} PriorityQueue;

void insert(HeapNode aNode, HeapNode* heap, int size);
void shiftdown(HeapNode* heap, int size, int iParent);
HeapNode removeMin(HeapNode* heap, int size);
void enqueue(HeapNode node, PriorityQueue *q);
HeapNode dequeue(PriorityQueue *q);
void initQueue(PriorityQueue *q, int n);

#endif // FILAPRIORIDADEHEAP_H_INCLUDED
