n_esimo(1,[X|_],X).
n_esimo(K,[_|Y],R):-
        K1 is K-1,
        n_esimo(K1,Y,R).

qtd(_,[],Ac,Ac).
qtd(X,[H|T],Ac,R):-
        X\=H,
        qtd(X,T,Ac,R).
qtd(X,[H|T],Ac,R):-
        X=H,
        Ac1 is Ac+1,
        qtd(X,T,Ac1,R).

tira_um(_,[],[]).
tira_um(X,[X|T],T).
tira_um(X,[H|T],[H|T1]):-
        tira_um(X,T,T1).

tira_todos(_,[],[]).
tira_todos(X,[X|T],T1):-
        tira_todos(X,T,T1).
tira_todos(X,[H|T],[H|T1]):-
        tira_todos(X,T,T1).

retira_repet([],[]).
retira_repet([H|T],[H|T1]):-
        tira_todos(H,T,T2),
        retira_repet(T2,T1).


concatena([],L,L).
concatena([H|T],L2,[H|T2]):-
        concatena(T,L2,T2).

maior([X],X).
maior([X,Y|T],R):-
        X>=Y,
        maior([X|T],R).
maior([X,Y|T],R):-
        X<Y,
        maior([Y|T],R).

menor([X],X).
menor([X,Y|T],R):-
        X=<Y,
        menor([X|T],R).
menor([X,Y|T],R):-
        X>Y,
        menor([Y|T],R).

pegar([],_,[]).
pegar([H|T],L,[X|Y]):-
        n_esimo(H,L,X),
        pegar(T,L,Y).

inserir_cabeca(X,L,[X|L]).

inserir_N(X,1,L,[X|L]):- !.
inserir_N(X,N,[H|T],[H|T2]):-
        N1 is N-1,
        inserir_N(X,N1,T,T2).

inverter(Lista,Lista_inv):-
        inv(Lista,[],Lista_inv).

inv([],Lista,Lista).
inv([H|T],Lista_aux,Lista_inv):-
        inv(T,[H|Lista_aux],Lista_inv).

/*
elimina_repetidos([H|T],R) :-
      member(H,T),!,
      elimina_repetidos(T,R).
elimina_repetidos([H|T],[H|R]) :-
      !,
      elimina_repetidos(T,R).
elimina_repetidos([],[]) :- !.
*/

substitui(_,_,[],[]).
substitui(X,Y,[X|T],[Y|T1]):-
      substitui(X,Y,T,T1),!.
substitui(X,Y,[H|T],[H|T2]):-
      substitui(X,Y,T,T2).

duplica_todos([X|T],[X,X|T1]):-
      duplica_todos(T,T1).
duplica_todos([],[]).

duplica_um(X,[X|T],[X,X|T]):- !.
duplica_um(X,[H|T],[H|T1]):-
       duplica_um(X,T,T1), !.
duplica_um(_,[],[]).

nao_vazia([X|_],L):-
       member(X,L), !.
nao_vazia([X|T],L):-
       member(X,L), !,
       nao_vazia(T,L).
       
uniao([H|T],L1,L3):-
       member(H,L1),
       uniao(T,L1,L3).
uniao([H|T],L1,L3):-
       \+ member(H,L1),
       inserir_cabeca(H,L1,L3),
       uniao(T,L1,L3).