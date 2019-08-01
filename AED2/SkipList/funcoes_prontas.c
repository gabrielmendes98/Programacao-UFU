// Cria a skiplist, alocando-a e alocando os nós dela.
// Retorna a skiplist ou retorna nulo, caso não tenha
// sido possível alocar memória para ela ou para os nós.
skiplist *criaSkipList(){

    // Faz a alocação da skiplist e dos nós.
    skiplist *sk = (skiplist*) malloc(sizeof(skiplist));
    no *cabecalhoPrimeiroNivel = (no*) malloc(sizeof(no));
    no *novo = (no*) malloc(sizeof(no));

    // Verifica se a alocação ocorreu com sucesso.
    // Retorna nulo caso não tenha sido.
    if(cabecalhoPrimeiroNivel == NULL || sk == NULL || novo == NULL)
        return NULL;

    // Seta os valores iniciais para uma skiplist vazia
    // e para seus respectivos nós.
    sk->level = 1;
    sk->inicio = novo;

    novo->info = 0;
    novo->abaixo = NULL;
    novo->prox = cabecalhoPrimeiroNivel;

    cabecalhoPrimeiroNivel->info = 0;
    cabecalhoPrimeiroNivel->prox = NULL;
    cabecalhoPrimeiroNivel->abaixo = NULL;

    return sk;
}

int insereSkipList(skiplist *sk, int numero){
    if(sk == NULL)
        return 0;

    int elementos = sk->inicio->info;
    int tamanho = sk->level, contador = sk->level-1;
    int i;

    no *andarNos = sk->inicio->prox; //aponta cabecalho
    no *salvaAnt[tamanho+1];
    no *salvaNovo[tamanho+1];
    no *aux3 = NULL;
    no *aux4 = NULL;

    //setar meu vetor em null para posterior verificação
    for( i = 0; i< tamanho+1; i++){
        salvaAnt[i] = NULL;
        salvaNovo[i] = NULL;

    }

    while(andarNos!=NULL){
        while(andarNos->prox!= NULL && andarNos->prox->info < numero){

            andarNos = andarNos->prox;


        }
        if(andarNos->prox!= NULL && andarNos->prox->info == numero){
            //reseta;
            return 0;
        }

        int pot = (int) pow(2,contador);

        if((elementos+1) % pot == 0){

            no *novo = (no *)malloc(sizeof(no));
            if(novo == NULL){
                //reseta()
                return 0;
            }
            novo->info = numero;
            novo->prox = andarNos->prox;
            andarNos->prox = novo;

            if(contador == sk->level-1){
                aux4 = novo;
            }
            salvaNovo[contador] = novo;
            salvaAnt[contador] = andarNos;
        }
        andarNos = andarNos->abaixo;

        contador --;


    }


    if((elementos+1) % ((int)pow(2,sk->level)) ==0){

        no *novo1 = (no *) malloc(sizeof(no));
        no *novo2 = (no *) malloc(sizeof(no));
        if(novo1 == NULL || novo2== NULL){
            //reseta
            return 0;
        }
        novo1 ->info = sk->level;
        novo1->abaixo = sk->inicio->prox;
        novo1->prox = novo2;
        sk->inicio->prox = novo1;
        novo2->info = numero;
        novo2->prox = NULL;
        novo2->abaixo = aux4;

        sk->level++;
    }
    for(i = 0; i < sk->level-1;i++){
        if(salvaNovo[i]== NULL)
            break;
        salvaNovo[i]->abaixo = aux3;
        aux3 = salvaNovo[i];
    }

    sk->inicio->info++;

    return 1;


}

// Recebe uma SkipList e imprime os
// elementos alocados nos nós mais
// abaixo da lista.
void imprimeSkipList(skiplist *sk) {

    // Verifica se a lista está vazia.
    if(sk == NULL || vaziaSkipList(sk)){
        printf("Lista vazia ou não alocada!\n");
        return;
    }

    // Aponta para o nó mais acima do cabeçalho.
    no *aux = sk->inicio->prox;

    // Desce até o nó mais abaixo do cabeçalho e
    // aponta para a primeira posição da lista.
    while(aux->abaixo != NULL)
        aux = aux->abaixo;
    aux = aux->prox;

    // Imprime cada elemento até chegar no último.
    while(aux != NULL){
        printf("%d", aux->info);
        if(aux->prox != NULL){
            printf(" -> ");
        }
        aux = aux->prox;
    }
    printf("\n");
}

// Recebe uma skilist e o valor que
// deseja-se saber se pertence a ela.
// Retorna 0 caso ela nao tenha sido
// alocada ou esteja vazia.
// Retorna 1 caso o elemento esteja na
// lista.
int buscaSkipList(skiplist *sk, int chave){

    // Verifica se a lista foi alocada e se
    // está vazia.
    if(sk == NULL || vaziaSkipList(sk))
        return 0;

    // Aponta para o nó mais acima do cabeçalho.
    no *x = sk->inicio->prox;

    // Enquanto o nó for diferente de nulo percorrer
    // a lista.
    while(x != NULL){

        // Se a chave for maior que o valor do nó atual,
        // ir para o proximo nó.
        while(x->prox != NULL && x->prox->info < chave)
            x = x->prox;

        // Verifica se o valor do nó atual é igual ao valor
        // da chave e retorna 1 caso seja.
        if(x->prox != NULL && x->prox->info == chave)
            return 1;

        // Caso não satisfaça nenhuma das condições acima,
        // vai para o nó abaixo e repete o processo.
        x = x->abaixo;
    }

    return 0;
}

// Recebe uma skiplist e retorna o
// tamanho dela. Retorna 0 caso ela
// não tenha sido alocada.
int tamanhoSkipList(skiplist *sk){
    if(sk == NULL)
        return 0;

    return sk->level;
}

// Recebe uma skiplist e verifica se
// está vazia. Retorna 0 caso esteja.
// Retorna 1 caso não esteja vazia.
int vaziaSkipList(skiplist *sk){
    if(sk == NULL || sk->inicio->info != 0)
        return 0;

    return 1;
}

// Recebe uma skiplist e libera a
// memória alocada para ela.
void liberaSkipList(skiplist *sk){

    // Só inicia se a skiplist for válida.
    if(sk != NULL){
        no *aux;
        no *aux2 = sk->inicio;

        // Percorre a lista liberando os
        // elementos.
        while(aux2 != NULL){
            aux = aux2;

            // Se o proximo for nulo, anda para baixo.
            // Senão, vai para o próximo.
            if(aux2->prox == NULL)
                aux2 = aux2->abaixo;
            else
                aux2 = aux2->prox;

            free(aux);
        }

        free(sk);
    }
}