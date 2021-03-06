% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

vendasnasemana(X,Y):-
    Y is (X*10)+10.

totaldevendas(1,Y):-
    vendasnasemana(1,Y).
totaldevendas(X,Y):-
    X>1,
    vendasnasemana(X,R1),
    X1 is X-1,
    totaldevendas(X1,R2),
    Y is R1+R2.

totaldevendas2(1,R,R).
totaldevendas2(X,Ac,R):-
    X>1,
    vendasnasemana(X,Ac1),
    Ac2 is Ac+Ac1,
    X1 is X-1,
    totaldevendas2(X1,Ac2,R).

maiordedois(X,Y,M):-
    X>Y,
    M is X;
    Y>X,
    M is Y.

maiorvendasemanal(1,R):-
    vendasnasemana(1,R).
maiorvendasemanal(X,R):-
    X>1,
    vendasnasemana(X,R1),
    X1 is X-1,
    vendasnasemana(X1,R2),
    maiordedois(R1,R2,M),
    maiorvendasemanal(X1,M1),
    maiordedois(M,M1,R).

algumasemanasemvenda(X):-
    vendasnasemana(X,0).
algumasemanasemvenda(X):-
    X>1,
    X1 is X-1,
    algumasemanasemvenda(X1).

fat(0,1).
fat(X,R):-
    X>0,
    X1 is X-1,
    fat(X1,R1),
    R is X * R1.

fat2(0,R,R).
fat2(X,Ac,R):-
    X>0,
    X1 is X-1,
    Ac1 is Ac*X,
    fat2(X1,Ac1,R).

fibo(0,0).
fibo(1,1).
fibo(X,R):-
    X>1,
    X1 is X-1,
    fibo(X1, Y1),
    X2 is X1-1,
    fibo(X2,Y2),
    R is Y1+Y2.
