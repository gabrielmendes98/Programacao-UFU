% Autor: Marcelo Rodrigues de Sousa
% Data: 26/06/2017

conta_elementos(Lista,Resposta) :-
    conta_elementos(Lista,[],Resposta).


%conta_elementos(Lista,Acumulador,Resposta)
conta_elementos([],Ac,Ac) :- !.  %para finalizar copia o Ac para a Resposta
conta_elementos([H|T],Ac,Resposta) :-
    insere_contando(H,Ac,NovoAc),
    conta_elementos(T,NovoAc,Resposta).
    
insere_contando(Elemento,[],[[Elemento,1]]) :- !.
insere_contando(Elemento,[[Elemento,N]|T],[[Elemento,NovoN]|T]) :-
     NovoN is N+1,!.
insere_contando(Elemento,[H|T],[H|NovoT]) :-
     !,
     insere_contando(Elemento,T,NovoT).
/* Explica��o
insere_contando(Elemento,[],[[Elemento,1]]) :- !.
A primeira vez que o Elemento � contado, ele vai para o acumulador na
forma [Elemento,1].

insere_contando(Elemento,[[Elemento,N]|T],[[Elemento,NovoN]|T]) :-
     NovoN is N+1,!.
Se o Elemento est� na cabe�a da lista de acumula��o ent�o tenho apenas
que substituir [Elemento,N] por [Elemento,N+1] na cabe�a da lista e
parar

insere_contando(Elemento,[H|T],[H|NovoT]) :-
     !,
     insere_contando(Elemento,T,NovoT).
Caso o Elemento n�o seja o primeiro elemento da lista de acumula��o
ent�o devemos manter a cabe�a da lista de acumula��o (H) na resposta e
inserir contando o Elemento na cauda da lista de acumula��o que resultar�
em uma nova cauda com o Elemento inserido corretamente (NovoT).
*/

/*
4 ?- conta_elementos([1,2,1,2,1,3],X).
X = [[1, 3], [2, 2], [3, 1]].

5 ?- conta_elementos([1,2,1,2,1,3,6,6,6,6,6,7,7,7,7,7,7,7,7,8,8,8,8,8,9,0,0,0,0,0,2,1,3,4,5,6],X).
X = [[1, 4], [2, 3], [3, 2], [6, 6], [7, 8], [8, 5], [9, 1], [0|...], [...|...]|...].

6 ?- conta_elementos([1,2,1,2,1,3,6,6,6,6,6,7,7,7,7,7,7,7,7,8,8,8,8,8,9,0,0,0,0,0,2,1,3,4,5,6],X), write(X),nl.
[[1,4],[2,3],[3,2],[6,6],[7,8],[8,5],[9,1],[0,5],[4,1],[5,1]]
X = [[1, 4], [2, 3], [3, 2], [6, 6], [7, 8], [8, 5], [9, 1], [0|...], [...|...]|...].
*/
     

     
    
    

    