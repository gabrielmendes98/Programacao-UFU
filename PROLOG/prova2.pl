% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

nelementos([],0).
nelementos([_|Y],R):-
    nelementos(Y,R1),
    R is R1+1.

produto([X],X).
produto([X|Y],R):-
    produto(Y,R1),
    R is R1*X.

ultimo([X],X).
ultimo([_|Y],R):-
    ultimo(Y,R).

pertence(X,[X|_]).
pertence(X,[_|Y]):-
    pertence(X,Y).

concatena([],R,R).
concatena([X|Y],L,[X|R]):-
    concatena(Y,L,R).

inversa([],[]).
inversa([X|Y],R):-
    inversa(Y,R1),
    concatena(R1,[X],R).

insere_ord(X,[],[X]).
insere_ord(X,[Y|Z],[X,Y|Z]):-
    X=<Y.
insere_ord(X,[Y|Z],[Y|Z1]):-
    X>Y,
    insere_ord(X,Z,Z1).

ordena([],[]).
ordena([X|Y],R):-
    ordena(Y,R1),
    insere_ord(X,R1,R).

elimina(_,[],[]).
elimina(X,[X|R],R).
elimina(X,[H|R],[H|S]):-
    elimina(X,R,S).

elimina_todos(_,[],[]).
elimina_todos(X,[X|R],R1):-
    elimina_todos(X,R,R1).
elimina_todos(X,[H|R],[H|S]):-
    elimina_todos(X,R,S).

sublista([],_).
sublista([X|T1],[X|T2]):-
    sublista(T1,T2).
sublista(X,[_|T2]):-
    sublista(X,T2).

permutar([], []).
permutar(Xs, [Z|Zs]):-
    select(Z, Xs, Ys),
    permutar(Ys, Zs).

select(X, [X|T], T).
select(X, [Y|T1], [Y|T2]):- 
    select(X, T1, T2).

f(X,0):-
    X<1,!.
f(X,2):-
    X>=1,
    X<2,!.
f(X,4):-
    X>=2.

diferente(X,X):-
    !,fail.
diferente(_,_).

gosta(maria,pedro).
:-op(50,xfx,gosta).

adiciona_comeco(X,L,[X|L]).

adiciona_fim(X,L,R) :-
    concatena(L,[X],R).

ordena_dec([],[]).
ordena_dec([X|Y],R):-
    ordena_dec(Y,R1),
    coloca_dec(X,R1,R).

coloca_dec(X,[],[X]).
coloca_dec(X,[Y|Z],[X,Y|Z]):-
    X>=Y.
coloca_dec(X,[Y|Z],[Y|R]):-
    X<Y,
    coloca_dec(X,Z,R).