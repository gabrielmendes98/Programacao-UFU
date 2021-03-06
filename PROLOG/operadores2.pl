% Autor:
% Data: 29/06/2017

concatena([],L,L):- !.
concatena([X|T],L,[X|R]):-
   concatena(T,L,R).

:-op(100,fx,concatena).
:-op(80,xfx,gera).
:-op(70,xfx,e).

concatena [] e L gera L:- !.
concatena [X|T] e L gera [X|R]:-
   concatena T e L gera R.
   
apaga(X,[X|T],T):- !.
apaga(X,[H|T],[H|R]):-
   apaga(X,T,R).
   
:-op(500,fx,apaga).
:-op(400,xfx,da).
:-op(300,xfx,de).

apaga X de [X|T] da T:- !.
apaga X de [H|T] da [H|R]:-
   apaga X de T da R.
   
pertence(X,[X|_]):- !.
pertence(X,[_|T]):-
   pertence(X,T).