% Autor:
% Data: 28/06/2017
%Operadores

gera(L):-
   write(L).
/*
:-op(50,xfx,member).
:-op(100,fy,concatena).
:-op(70,xfx,e).
:-op(80,xfx,gera).
*/

:-op(100,fy,se).
:-op(80,yfx,entao).
:-op(90,xfx,e).
se a entao b.
se a e b entao c.

:-op(100,xfx,<===>).
:-op(50,fy,~).
:-op(80,xfy,&).
:-op(90,xfy,v).
~(X & Y) <===> ~X v ~Y.

t(0+1, 1+0).
t(X+0+1, X+1+0).
t(X+1+1, Z) :-
t(X+1, X1),
t(X1+1, Z).