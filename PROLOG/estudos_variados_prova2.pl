% Autor:
% Data: 29/06/2017

/*
dados(um).
dados(dois).
dados(tres).

cut_teste_a(X) :-
   dados(X),!.
cut_teste_a('ultima_clausula').

n(1).
n(2).
n(3).

teste :-
    n(_), !.
teste.

cut_teste_b(X):-
   dados(X), !.
cut_teste_b('ultima_clausula').

cut_teste_c(X,Y) :-
   dados(X),
   !,
   dados(Y).
cut_teste_c('ultima_clausula').

max(X, Y, Z, X):- X>=Y, X>=Z, !.
max(X, Y, Z, Y):- Y>=Z, !.
max(_, _, Z, Z).
*/

tira_todos(_,[],[]).
tira_todos(X,[X|T],T2):-
   tira_todos(X,T,T2), !.
tira_todos(X,[H|T],[H|T2]):-
   tira_todos(X,T,T2).
   
ultimo([X],X):- !.
ultimo([_|T],Y):-
   ultimo(T,Y).
   
sublista([],_).
sublista([X|T],L):-
   member(X,L),!,
   sublista(T,L).

permuta([X|T],R):-
   select(Elem,[X|T]).
   