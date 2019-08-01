inicio :-
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
        write('Saindo...'),nl,!).
        
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

:- dynamic sim/1,nao/1.

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
  get(_),
  digitado(C1,Char),!.
leia(Char):-
  write('Resposta invalida'), nl,
  nl, write('Digite somente s ou n'),nl,
  leia(Char).

digitado(115,s).
digitado(110,n).