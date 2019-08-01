#include<stdio.h>
#include<conio.h>
#include<ctype.h>
#include<string.h>
#include "pilha.h"

void transforma(char *postfix, stack s){
    int token, i=0;
    char x;
    while((token=getchar())!='\n')
      {
        if(isalnum(token))
           postfix[i++]=token;

        else
           if(token == '(')
               push(&s,'(');
           else
           {
             if(token == ')')
                 while((x=pop(&s))!='(')
                 postfix[i++]=x;
             else
             {
             while(priority(token)<=priority(top(&s)) && !empty(&s)){
                 x=pop(&s);
                 postfix[i++]=x;
                 }
             push(&s,token);
             }
           }
      }
    while(!empty(&s)){
        x=pop(&s);
        postfix[i++]=x;
    }
}
//---------------------------------------------
int priority(char x)
{
   if(x == '(')
        return(0);
   if(x == '+' || x == '-')
        return(1);
   if(x == '*' || x == '/' || x == '%')
        return(2);
   return(3);
}
