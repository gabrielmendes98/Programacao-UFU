#ifndef STACK_H_INCLUDED
#define STACK_H_INCLUDED

#define MAX 10

typedef struct stack
{
 int data[MAX];
 int top;
}stack;

int empty(stack *s);
int full(stack *s);
void push(stack *s,int x);
int pop(stack *s);
void transform(stack *s, int num);
void print(stack s);

#endif // STACK_H_INCLUDED
