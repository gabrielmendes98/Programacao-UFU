% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

vendasnasemana(X,Y):-
    Y is X*10 + 10.

totaldevendas(1,20).
totaldevendas(X,T):-
    X>1,
    vendasnasemana(X,R),
    X1 is X-1,
    totaldevendas(X1,T1),
    T is R+T1.

totaldevendas2(1,R,R).
totaldevendas2(N,Ac,R):-
    N>1,
    vendasnasemana(N,R1),
    N1 is N-1,
    Ac1 is Ac+R1,
    totaldevendas2(N1,Ac1,R).

maiordedois(X,Y,R):-
    X>Y ->
    R is X;
    Y>X ->
    R is Y.

maiorvendasemanal(1,20).
maiorvendasemanal(X,Y):-
    X>0,
    vendasnasemana(X,R),
    X1 is X - 1,
    vendasnasemana(X1,R1),
    maiordedois(R,R1,M),
    Y is M,
    maiorvendasemanal(X1,Y1),
    maiordedois(Y,Y1,M2),
    Y is M2.

algumasemanasemvenda(X):-
    vendasnasemana(X,Y),
    Y = 0.
algumasemanasemvenda(X):-
    X>1,
    X1 is X - 1,
    algumasemanasemvenda(X1).

par(X):-
    0 is X mod 2.

fat(0,1).
fat(X,R):-
    X>0,
    X1 is X-1,
    fat(X1,R1),
    R is X*R1.

fibo(0,0).
fibo(1,1).
fibo(X,R):-
    X>1,
    X1 is X - 1,
    fibo(X1,R1),
    X2 is X1 - 1,
    fibo(X2,R2),
    R is R2+R1.

fat2(0,R,R).
fat2(N,Ac,R):-
    N>0,
    N1 is N-1,
    Ac1 is N*Ac,
    fat2(N1,Ac1,R).
