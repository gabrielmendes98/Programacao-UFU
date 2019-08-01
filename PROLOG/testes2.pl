% Autor:
% Data: 13/07/2017

leia(Char):-
  get(C1),
  get(_),
  digitado(C1,Char),!.
leia(Char):-
  write('Resposta invalida'), nl,
  write('Digite somente s ou n'),nl,
  leia(Char).
  
digitado(115,s).
digitado(110,n).
  
nome:-
 leia(Nome),
 write(Nome),nl.