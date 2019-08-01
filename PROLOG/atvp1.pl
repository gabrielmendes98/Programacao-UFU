% telefone(P, T) :-
% o n. de telefone da casa da pessoa P e� T.
telefone(maria, 123).
telefone(joaquim, 234).
telefone(marco, 345).
telefone(pedro, 456).
telefone(ana, 567).
telefone(juliana, 678).
% visita(X, Y) :-
% a pessoa X esta� visitando a pessoa Y.
visita(juliana, maria).
visita(ana, joaquim).
visita(marco, juliana).
visita(pedro, juliana).
% emCasa(X) :- X esta� em casa.
emCasa(joaquim).
emCasa(maria).

acompanhada(X):-
    visita(_,X).

inconsistente():-
    emCasa(X),
    visita(X,_).

emcasade(X,Y):-
    visita(X,Y).
emcasade(X,Y):-
    visita(X,Z),
    emcasade(Z,Y).

contato(X,Y):-
    emcasade(X,X1),
    telefone(X1,Y).

pai(pedro, ana).
pai(pedro,maria).
pai(joaquim,pedro).
pai(manoel,joaquim).

ancestral(X,Y):-
    pai(X,Y).
ancestral(X,Y):-
    pai(X,Z),
    ancestral(Z,Y).

estrada(a,b,25).
estrada(a,d,23).

estrada(b,c,19).
estrada(b,e,32).

estrada(c,d,14).
estrada(c,f,28).

estrada(d,f,30).
estrada(e,f,26).

dist(A,B,D):-
    estrada(A,B,D).
dist(A,B,D):-
    estrada(A,C,D1),
    dist(C,B,D2),
    D is D1+D2.
