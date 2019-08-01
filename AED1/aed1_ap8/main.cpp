#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

typedef struct _dslist_node
{
    int node_value;
 	struct _dslist_node * prev;
    struct _dslist_node * next;

}dslist_node;

int main(int argc, char *argv[])
{
    int key, i;
    dslist_node *head, *temp, *current, *tail;
    /* Condicao inicial para a lista */
    head = NULL;
    tail = NULL;
    temp = NULL;
    curr
    ent = NULL;
    printf ("Doubly circular linked list demo application\n");
    do
    {

        /* Insere ate o usuario digitar 'n' */
        printf ("Add a node [y/n] : ");
        key = getch();
        if(key == 'y')
        {
        temp = (dslist_node *)malloc(sizeof(dslist_node));
        if(temp != NULL)
        {
            printf ("Value of this node : ");
            scanf ("%d", &temp->node_value);
            /* se head == vazia, significa que a lista esta vazia */
            if(head == NULL)
            {
            /* primeira posicao, entao head = tail */
            current = temp;
            head = temp;
            head->next = head;
            head->prev = head;
            }
            else /* significa que a lista tem cabeca */
            {
            /* temp eh o novo tail */
            current->next = temp;
            temp->prev = current;
            temp->next = head;
            head->prev = temp;
            current = temp;
            }
        }
        else
        {
            printf ("Memory allocation error!");
            return -1;
        }
        }
        else /* se o usuario digitar 'n' sai da funcao */
            break;
    } while (1);

    /* interacao head - tail */
    tail = current;
    current = head;
    int c=0;
    system("cls");
    printf("Menu:\n 1-> Next element\n 2-> Prev element\n 3-> Quit\n");
    printf ("\nElemento atual: %d\n", current->node_value);
    while(c!=3)
    {
        printf("Digite uma opcao: ");
        scanf("%d", &c);
        if(c == 1){
            current = current->next;
            printf ("\nElemento atual: %d\n", current->node_value);
        }
        if(c == 2){
            current = current->prev;
            printf ("\nElemento atual: %d\n", current->node_value);
        }
    };

    /* Libera a lista */
    current = head;
    while(current)
    {
        temp = current;
        current = current->next;
        free (temp);
        if(current == tail)
        {
        break;
        }
    }
    return 0;
}
