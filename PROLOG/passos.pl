% Autor:
% Data: 26/07/2017

arco(1,2).
arco(2,3).
arco(2,4).
arco(3,5).
arco(5,6).
arco(4,6).

ligacao(X,Y):-
        arco(X,Y);
        arco(Y,X).

caminho(X,X,T,T).
caminho(X,Y,T,L):-
        ligacao(X,Z),
        \+ member(Z,T),
        caminho(Z,Y,[Z|T],L).

seq(X,Y,Sol):-
        caminho(X,Y,[X],C),
        reverse(C,Sol).

passo(X-Y,n,X-Y1):- !,
        Y1 is Y+1.

passo(X-Y,s,X-Y1):- !,
        Y1 is Y-1.

passo(X-Y,l,X1-Y):- !,
        X1 is X+1.

passo(X-Y,o,X1-Y):- !,
        X1 is X-1.

passo(X-Y,ne,X1-Y1):- !,
        X1 is X+1,
        Y1 is Y+1.

passo(X-Y,no,X1-Y1):- !,
        X1 is X-1,
        Y1 is Y+1.

passo(X-Y,se,X1-Y1):- !,
        X1 is X+1,
        Y1 is Y-1.

passo(X-Y,so,X1-Y1):- !,
        X1 is X-1,
        Y1 is Y-1.