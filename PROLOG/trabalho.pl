% Autor:  Gabriel Mendes de Souza Santiago
% Data: 26/07/2017

menu:-
        repeat,
        nl,
        write('1. Especifica evidencia'),nl,
        write('2. Visualiza evidencia'),nl,
        write('3. Adivinhe'),nl,
        write('4. Remove respostas'),nl,
        write('5. Sair'),nl,
        leia_menu(R),
        (R \= 5 ->
        nl,exec(R),fail;
        write('Saindo...'), nl,!).
        
exec(1):-
           write('Possiveis evidencias:'),nl,
           mostra_possiveis_evidencias,
           repeat,
           write('Digite a evidencia: '),
           le_atomo(Evidencia),
           assert(sim(Evidencia)),
           write('Deseja adicionar outra evidencia? '),
           leia(Resp),
           (Resp == s ->
           fail;
           !).
exec(2):-
         write('Voce especificou as seguintes evidencias:'), nl,
         sim(X),
         write(X),nl,fail.
exec(3):-
         corrige,
         hipotetiza(Animal),!,
         write('O animal eh: '),
         write(Animal), nl.
exec(4):-
         removeRespostas,
         write('Respostas removidas'),nl.

inicio:-
        repeat,
        hipotetiza(Animal),
        write('O animal eh: '),
        write(Animal),
        nl,
        removeRespostas,  nl,
        write('Deseja que o computador adivinhe outro animal? '),
        leia(R),
        (R == s ->
        nl,fail;
        nl,!).
        
possiveis_evidencias(tem_manchas_escuras).
possiveis_evidencias(aparece_em_estoria_de_marinheiro).
possiveis_evidencias(tem_pescoco_grande).
possiveis_evidencias(tem_pernas_grandes).
possiveis_evidencias(tem_listras_pretas).
possiveis_evidencias(nao_voa).
possiveis_evidencias(voa).
possiveis_evidencias(nada).
possiveis_evidencias(branco_e_preto).
possiveis_evidencias(tem_pelo).
possiveis_evidencias(amamenta).
possiveis_evidencias(tem_penas).
possiveis_evidencias(poe_ovos).
possiveis_evidencias(come_carne).
possiveis_evidencias(tem_dentes_pontiagudos).
possiveis_evidencias(tem_garras).
possiveis_evidencias(tem_cascos).
possiveis_evidencias(rumina).

mostra_possiveis_evidencias:-
   possiveis_evidencias(X),
   write(X),nl,
   fail.
mostra_possiveis_evidencias:- !.

corrige:-
   findall(X,sim(X),L),
   findall(Y,possiveis_evidencias(Y),L2),
   select(K,L2,_),
   \+ member(K,L),
   assert(nao(K)), fail.
corrige:- !.
   

/* hipoteses a serem testadas*/
hipotetiza(leopardo) :- leopardo, !.
hipotetiza(tigre) :- tigre, !.
hipotetiza(girafa) :- girafa, !.
hipotetiza(zebra) :- zebra, !.
hipotetiza(avestruz) :- avestruz, !.
hipotetiza(pinguim) :- pinguim, !.
hipotetiza(albatroz) :- albatroz, !.
hipotetiza(desconhecido). /* nao diagnosticado */

/* regras de identificação do animal */
leopardo :-
        mamifero,
        carnivoro,
        verifica(tem_manchas_escuras).
tigre :-
        mamifero,
        carnivoro,
        verifica(tem_listras_pretas).
girafa :-
        ungulado,
        verifica(tem_pescoco_grande),
        verifica(tem_pernas_grandes).
zebra :-
        ungulado,
        verifica(tem_listras_pretas).
avestruz :-
        passaro,
        verifica(nao_voa),
        verifica(tem_pescoco_grande).
pinguim :-
        passaro,
        verifica(nao_voa),
        verifica(nada),
        verifica(branco_e_preto).
albatroz :-
        passaro,
        verifica(aparece_em_estoria_de_marinheiro),
        verifica(voa).

/* regras de classificação */

mamifero :-
        verifica(tem_pelo), !.
mamifero :-
        verifica(amamenta).
passaro :-
        verifica(tem_penas), !.
passaro :-
        verifica(voa),
        verifica(poe_ovos).
carnivoro :-
        verifica(come_carne), !.
carnivoro :-
        verifica(tem_dentes_pontiagudos),
        verifica(tem_garras).
ungulado :-
        mamifero,
        verifica(tem_cascos), !.
ungulado :-
        mamifero,
        verifica(rumina).

/* formulando perguntas */
pergunta(Pergunta) :-
        write('O animal tem a seguinte caracteristica: '),
        write(Pergunta),
        write('? '),
        leia(Resposta),
        nl,
        trate(Pergunta,Resposta).

trate(Pergunta,Resposta) :-
        Resposta == s,
        assert(sim(Pergunta)),!.
trate(Pergunta,_) :-
        assert(nao(Pergunta)),fail.

:- dynamic sim/1, nao/1.
:- dynamic listaDeEvidencias/1.

%listaDeEvidencias(_).

/* verificando */

verifica(S) :- sim(S),!.
verifica(S) :- nao(S),!, fail.
verifica(S) :- pergunta(S).

/* remove todas as assercoes de sim e nao */
/*
removeRespostas :- retract(sim(_)),fail.
removeRespostas :- retract(nao(_)),fail.
removeRespostas :- abolish(sim/1), abolish(nao/1),dynamic(sim/1),dynamic(nao/1).
*/
removeRespostas :- retractall(sim(_)), retractall(nao(_)).

leia(Char):-
  get(C1),
  get0(_),
  digitado(C1,Char),!.
leia(Char):-
  write('Resposta invalida'), nl,
  nl, write('Digite somente s ou n'),nl,
  leia(Char).

digitado(115,s).
digitado(110,n).

leia_menu(Char):-
  get(C1),
  get0(_),
  digitado_menu(C1,Char),!.
leia_menu(Char):-
  write('Resposta invalida'), nl,
  nl, write('Digite somente numeros de 1 a 5'),nl,
  leia_menu(Char).

digitado_menu(49,1).
digitado_menu(50,2).
digitado_menu(51,3).
digitado_menu(52,4).
digitado_menu(53,5).

le_atomo(Atomo) :-
   le_str(String),
   name(Atomo, String).
   
le_str(String) :-
   get0(Char),
   le_str_aux(Char, String).
   
le_str_aux(-1, []) :- !. % EOF
le_str_aux(10, []) :- !. % EOL(UNIX)
le_str_aux(13, []) :- !. % EOL (DOS)

le_str_aux(Char, [Char|Resto]) :-
   le_str(Resto).
