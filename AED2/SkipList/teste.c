typedef struct no{
    int info;
    struct no *prox, *abaixo;
}no;

typedef struct skiplist{
    int level;
    no* inicio;
}skiplist;

int busca(skiplist *sk, no *salva, int chave) {
	if(vaziaSkipList(sk))
		return 0;

    no *x = sk->inicio->prox;
    int i, level;
    while (1) {
    	if(x->info == chave){
    		salva = x;
    		return 1;
    	}

    	if(x->prox == NULL && x->abaixo != NULL)
    		x = x->abaixo;

        while (x->prox->info > chave){
        	if(x->abaixo == NULL){
        		printf("Valor nao existe\n");
        		return 0;
        	}
            x = x->abaixo;
        }

        if(x->prox == NULL){
        	printf("Valor nao existe\n");
        	return 0;
        }

        x = x->prox;
    }

    return 0;
}

void imprime(skiplist *sk) {
    no *aux = sk->inicio->prox;

    while(aux->abaixo != NULL)
        aux = aux->abaixo;

    aux = aux->prox;

    while(aux->prox != NULL){
        printf("%d -> ", aux->info);
        aux = aux->prox;
    }

    printf("NULL\n");
}
