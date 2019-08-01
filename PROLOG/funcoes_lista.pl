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

adiciona_comeco(X,L,[X|L]).

adiciona_fim(X,L,R) :-
    concatena(L,[X],R).