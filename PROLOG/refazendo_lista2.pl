% Autor:
% Data: 29/06/2017

n_esimo(1,H,[H|_]):- !.
n_esimo(X,R,[_|T]):-
  X1 is X-1,
  n_esimo(X1,R,T).
  
no_elementos([],0):- !.
no_elementos([_|T],N):-
  no_elementos(T,N1),
  N is N1+1.
  
tira_um(X,[X|T],T).
tira_um(X,[H|T],[H|R]):-
  tira_um(X,T,R).

tira_todos(_,[],[]):- !.
tira_todos(X,[X|T],R):-
  tira_todos(X,T,R),!.
tira_todos(X,[H|T],[H|R]):-
  tira_todos(X,T,R).
  
concatena([],L,L):- !.
concatena([X|T],L,[X|R]):-
  concatena(T,L,R).

maior([X],X):- !.
maior([X,Y|T],R):-
  X>=Y, !,
  maior([X|T],R).
maior([_,Y|T],R):-
  maior([Y|T],R).
  
menor([X],X):- !.
menor([X,Y|T],R):-
  X=<Y, !,
  menor([X|T],R).
menor([_,Y|T],R):-
  menor([Y|T],R).

pegar([],_,[]).
pegar([X|T],L,[Elm|Cauda]):-
  n_esimo(X,Elm,L),
  pegar(T,L,Cauda).
  
inserir_cabeca(X,L,[X|L]).

inserir_pos(X,1,L,[X|L]):- !.
inserir_pos(X,Pos,[H|T],[H|R]):-
  Pos1 is Pos - 1,
  inserir_pos(X,Pos1,T,R).
  
inverter([],[]).
inverter([X|T],R):-
  inverter(T,R1),
  concatena(R1,[X],R).
  
substitui(X,Y,[X|T],[Y|T]):- !.
substitui(X,Y,[H|T],[H|R]):-
  substitui(X,Y,T,R).
  
duplica_todos([],[]).
duplica_todos([X|T],[X,X|R]):-
  duplica_todos(T,R).
  
duplica_um(X,[X|T],[X,X|T]):- !.
duplica_um(X,[H|T],[H|R]):-
  duplica_um(X,T,R).
  
nao_vazia(L,L2):-
  member(Elm,L),
  member(Elm,L2), !.
  
uniao(L,L2,R):-
  concatena(L,L2,R1),
  retira_repetidos(R1,R).
  
retira_repetidos([],[]).
retira_repetidos([X|T],[X|R]):-
  tira_todos(X,T,R1),
  retira_repetidos(R1,R).
  
disjuntos([],_).
disjuntos([X|T],L2):-
  \+ member(X,L2),
  disjuntos(T,L2).

iguais([],[]):- !.
iguais([X|T],L2):-
  tira_um(X,L2,R),
  iguais(T,R).
  
ordena_crescente([],[]).
ordena_crescente([X|T],R):-
  ordena_crescente(T,R1),
  insere_crescente(X,R1,R).

insere_crescente(X,[],[X]):- !.
insere_crescente(X,[H|T],[X,H|T]):-
  X=<H, !.
insere_crescente(X,[H|T],[H|Cauda]):-
  X>H,
  insere_crescente(X,T,Cauda).

ordena_decre([],[]).
ordena_decre([X|T],R):-
  ordena_decre(T,R1),
  insere_decre(X,R1,R).

insere_decre(X,[],[X]):- !.
insere_decre(X,[H|T],[X,H|T]):-
  X>=H, !.
insere_decre(X,[H|T],[H|Cauda]):-
  X<H,
  insere_decre(X,T,Cauda).

permuta([],[]).
permuta(L,[Elem|Resto]):-
  tira_um(Elem,L,L2),
  permuta(L2,Resto).