CREATE SCHEMA escola;
SET search_path TO escola;
SET datestyle TO postgres, dmy;

CREATE TABLE CURSO(
       NumCurso DECIMAL(9) NOT NULL,
       Nome CHAR(30) NOT NULL,
       TotalCreditos DECIMAL(4) NOT NULL,
       CONSTRAINT CHAVECURSO 
         PRIMARY KEY (NumCurso)
);

CREATE TABLE ALUNO(
       NumAluno DECIMAL(9) NOT NULL,
       Nome CHAR(70) NOT NULL,
       Endereco CHAR(70) NOT NULL,
       Cidade CHAR(25) NOT NULL,
       Telefone CHAR(25),
       NumCurso DECIMAL(9) NOT NULL,
       CONSTRAINT CHAVEALUNO 
         PRIMARY KEY (NumAluno),
       CONSTRAINT ESTRANGEIRACURSO
         FOREIGN KEY (NumCurso) REFERENCES CURSO
);

CREATE TABLE DISCIPLINA(
       NumDisp DECIMAL(9) NOT NULL,
       Nome CHAR(30) NOT NULL,
       QuantCreditos DECIMAL(9) NOT NULL,
       CONSTRAINT CHAVEDISCIPLINA 
         PRIMARY KEY (NumDisp)
);

CREATE TABLE PROFESSOR(
       NumFunc DECIMAL(9) NOT NULL,
       Nome CHAR(70) NOT NULL,
       Admissao DATE NOT NULL,
       AreaPesquisa CHAR(30),
       CONSTRAINT CHAVEPROFESSOR 
         PRIMARY KEY (NumFunc)
);

CREATE TABLE AULA(
       NumAluno DECIMAL(9) NOT NULL,
       NumDisp DECIMAL(9) NOT NULL,
       NumFunc DECIMAL(9) NOT NULL,
       Semestre CHAR(10) NOT NULL,
       Nota DECIMAL(5,2) NOT NULL,       
       CONSTRAINT CHAVEAULA 
         PRIMARY KEY (NumAluno, NumDisp, NumFunc, Semestre),
       CONSTRAINT ESTRANGEIRAALUNO
         FOREIGN KEY (NumAluno) REFERENCES ALUNO,
       CONSTRAINT ESTRANGEIRADISCIPLINA
         FOREIGN KEY (NumDisp) REFERENCES DISCIPLINA,
       CONSTRAINT ESTRANGEIRAPROFESSOR
         FOREIGN KEY (NumFunc) REFERENCES PROFESSOR
);

CREATE TABLE DISCIPLINACURSO(
       NumDisp DECIMAL(9) NOT NULL,
       NumCurso DECIMAL(9) NOT NULL,
       CONSTRAINT CHAVEDISPCURSO 
         PRIMARY KEY (NumDisp, NumCurso),
       CONSTRAINT ESTRANGEIRADISP
         FOREIGN KEY (NumDisp) REFERENCES DISCIPLINA,
       CONSTRAINT ESTRANGEIRACURSO
         FOREIGN KEY (NumCurso) REFERENCES CURSO
);

INSERT INTO CURSO VALUES (2142, 'ENGENHARIA CIVIL', 1500);
INSERT INTO CURSO VALUES (2143, 'CIENCIA DA COMPUTACAO', 2000);
INSERT INTO CURSO VALUES (2144, 'DIREITO', 1750);
INSERT INTO CURSO VALUES (2145, 'PEDAGOGIA', 1500);
INSERT INTO CURSO VALUES (2146, 'ODONTOLOGIA', 1600);

INSERT INTO ALUNO VALUES (111, 'EDVALDO CARLOS SILVA', 'AV. SAO CARLOS, 186', 'SAO CARLOS - SP', '(017)276-9999', 2143);
INSERT INTO ALUNO VALUES (112, 'JOAO BENEDITO SCAPIN', 'R. JOSE BONIFACIO, 70', 'SAO CARLOS - SP', '(017)273-8974', 2142);
INSERT INTO ALUNO VALUES (113, 'CAROL ANTONIA SILVEIRA', 'R. LUIZ CAMOES, 120', 'IBATE - SP', '(017)278-8568', 2145);
INSERT INTO ALUNO VALUES (114, 'MARCOS JOAO CASANOVA', 'AV. SAO CARLOS, 176', 'SAO CARLOS - SP', '(017)274-9874', 2143);
INSERT INTO ALUNO VALUES (115, 'SIMONE CRISTINA LIMA', 'R. RAUL JUNIOR, 180', 'SAO CARLOS - SP', '(017)273-9865', 2144);
INSERT INTO ALUNO VALUES (116, 'AILTON CASTRO', 'R. ANTONIO CARLOS, 120', 'IBATE - SP', '(017)278-8563', 2142);
INSERT INTO ALUNO VALUES (117, 'JOSE PAULO FIGUEIRA', 'R. XV DE NOVEMBRO, 871', 'SAO CARLOS - SP', '(017)274-9873', 2145);

INSERT INTO DISCIPLINA VALUES (1, 'BANCO DE DADOS', 30);
INSERT INTO DISCIPLINA VALUES (2, 'ESTRUTURA DE DADOS', 30);
INSERT INTO DISCIPLINA VALUES (3, 'DIREITO PENAL', 25);
INSERT INTO DISCIPLINA VALUES (4, 'CALCULO NUMERICO', 30);
INSERT INTO DISCIPLINA VALUES (5, 'PSICOLOGIA INFANTIL', 25);
INSERT INTO DISCIPLINA VALUES (6, 'DIREITO TRIBUTARIO', 33);
INSERT INTO DISCIPLINA VALUES (7, 'ENGENHARIA DE SOFTWARE', 27);

INSERT INTO PROFESSOR VALUES (45675, 'ABGAIR SIMON FERREIRA', '10/04/1992','BANCO DE DADOS');
INSERT INTO PROFESSOR VALUES (45690, 'RAMON TRAVANTI', '20/05/1993','DIREITO ROMANO');
INSERT INTO PROFESSOR VALUES (45691, 'GUSTAVO GOLVEIA NETTO', '05/04/1993','SOCIOLOGIA');
INSERT INTO PROFESSOR VALUES (45692, 'MARCOS SALVADOR', '31/03/1993','MATEMATICA FINANCEIRA');
INSERT INTO PROFESSOR VALUES (45693, 'CINTIA FALCAO', '15/02/1993','ENGENHARIA DE SOFTWARE');

INSERT INTO AULA VALUES (111, 1, 45675, '01/1998', 8.5);
INSERT INTO AULA VALUES (111, 2, 45675, '01/1998', 6.0);
INSERT INTO AULA VALUES (111, 2, 45675, '02/1998', 7.0);
INSERT INTO AULA VALUES (115, 3, 45690, '01/1998', 4.5);
INSERT INTO AULA VALUES (115, 3, 45690, '02/1998', 7.5);
INSERT INTO AULA VALUES (111, 4, 45692, '01/1998', 8.0);
INSERT INTO AULA VALUES (112, 4, 45692, '01/1998', 7.0);
INSERT INTO AULA VALUES (113, 5, 45691, '01/1998', 7.5);
INSERT INTO AULA VALUES (115, 6, 45690, '01/1998', 9.0);
INSERT INTO AULA VALUES (111, 7, 45693, '01/1998', 10.0);
INSERT INTO AULA VALUES (112, 7, 45693, '01/1998', 5.5);
INSERT INTO AULA VALUES (112, 7, 45693, '02/1998', 10.0);
INSERT INTO AULA VALUES (114, 1, 45675, '01/1998', 7.0);
INSERT INTO AULA VALUES (114, 2, 45675, '01/1998', 8.0);
INSERT INTO AULA VALUES (114, 4, 45692, '01/1998', 6.5);
INSERT INTO AULA VALUES (114, 4, 45692, '02/1998', 8.5);
INSERT INTO AULA VALUES (116, 4, 45692, '01/1998', 3.5);
INSERT INTO AULA VALUES (116, 4, 45692, '02/1998', 9.5);
INSERT INTO AULA VALUES (114, 7, 45693, '01/1998', 9.5);
INSERT INTO AULA VALUES (116, 7, 45693, '01/1998', 8.5);

INSERT INTO DISCIPLINACURSO VALUES (1, 2143);
INSERT INTO DISCIPLINACURSO VALUES (2, 2143);
INSERT INTO DISCIPLINACURSO VALUES (3, 2144);
INSERT INTO DISCIPLINACURSO VALUES (4, 2143);
INSERT INTO DISCIPLINACURSO VALUES (4, 2142);
INSERT INTO DISCIPLINACURSO VALUES (5, 2145);
INSERT INTO DISCIPLINACURSO VALUES (6, 2144);
INSERT INTO DISCIPLINACURSO VALUES (7, 2143);
INSERT INTO DISCIPLINACURSO VALUES (7, 2142);

--2
--A
SELECT C.nome
FROM CURSO C;

--B
SELECT A.nome, A.telefone
FROM ALUNO A
WHERE A.cidade = 'SAO CARLOS - SP'
ORDER BY A.nome DESC;

--C
SELECT nome
FROM PROFESSOR
WHERE admissao < '01/01/1993';

--D
SELECT nome
FROM ALUNO
WHERE nome LIKE 'J%';

--E
SELECT D.nome
FROM CURSO C, DISCIPLINACURSO DC, DISCIPLINA D
WHERE C.numcurso = DC.numcurso AND
DC.numdisp = D.numdisp AND
C.nome = 'CIENCIA DA COMPUTACAO';

--F
SELECT C.nome
FROM CURSO C, DISCIPLINACURSO DC, DISCIPLINA D
WHERE C.numcurso = DC.numcurso AND
DC.numdisp = D.numdisp AND
D.nome = 'CALCULO NUMERICO';

--G
SELECT D.nome
FROM DISCIPLINA D, ALUNO A, AULA AU
WHERE A.numaluno = AU.numaluno AND
D.numdisp = AU.numdisp AND
AU.semestre = '01/1998' AND
A.nome = 'MARCOS JOAO CASANOVA';

--H
SELECT D.nome
FROM DISCIPLINA D, ALUNO A, AULA AU
WHERE A.numaluno = AU.numaluno AND 
AU.numdisp = D.numdisp AND
A.nome = 'AILTON CASTRO' AND
AU.nota < 7;

--I
SELECT A.nome
FROM ALUNO A, DISCIPLINA D, AULA AU
WHERE A.numaluno = AU.numaluno AND 
AU.numdisp = D.numdisp AND
D.nome = 'CALCULO NUMERICO' AND
AU.nota < 7;

--J
SELECT DISTINCT D.nome
FROM DISCIPLINA D, PROFESSOR P, AULA AU
WHERE P.nome = 'RAMON TRAVANTI' AND
D.numdisp = AU.numdisp AND
AU.numfunc = P.numfunc;

--K
SELECT DISTINCT P.nome
FROM PROFESSOR P, AULA AU, DISCIPLINA D
WHERE D.nome = 'BANCO DE DADOS' AND
P.numfunc = AU.numfunc AND 
AU.numdisp = D.numdisp;

--L
SELECT A.nome, D.nome, P.nome
FROM ALUNO A, DISCIPLINA D, PROFESSOR P, AULA AU
WHERE AU.semestre = '01/1998' AND
A.numaluno = AU.numaluno AND
D.numdisp = AU.numdisp AND
P.numfunc = AU.numfunc
ORDER BY A.nome ASC;

--M
SELECT A.nome, D.nome, AU.nota
FROM ALUNO A, DISCIPLINA D, AULA AU, CURSO C, DISCIPLINACURSO DC
WHERE AU.semestre = '01/1998' AND
C.nome = 'CIENCIA DA COMPUTACAO' AND
A.numaluno = AU.numaluno AND
D.numdisp = AU.numdisp AND
D.numdisp = DC.numdisp AND
C.numcurso = DC.numcurso;

--bonus
SELECT MAX(AU.nota), MIN(AU.nota)
FROM AULA AU, DISCIPLINA D
WHERE D.nome = 'CALCULO NUMERICO' AND
AU.semestre = '01/1998' AND
D.numdisp = AU.numdisp;

--N
SELECT A.nome, AU.nota
FROM ALUNO A, DISCIPLINA D, AULA AU
WHERE D.nome = 'ENGENHARIA DE SOFTWARE' AND
AU.semestre = '01/1998' AND
A.numaluno = AU.numaluno AND 
D.numdisp = AU.numdisp AND
AU.nota = (SELECT MAX(AU.NOTA) FROM ALUNO A, DISCIPLINA D, AULA AU
		   WHERE D.nome = 'ENGENHARIA DE SOFTWARE' AND
		   AU.semestre = '01/1998' AND
           A.numaluno = AU.numaluno AND 
           D.numdisp = AU.numdisp);

SELECT A.Nome, MAX(U.Nota)
FROM ALUNO A, DISCIPLINA D, AULA U
WHERE D.Nome = 'ENGENHARIA DE SOFTWARE'
AND U.Semestre = '01/1998'
AND A.NumAluno = U.NumAluno
AND D.NumDisp = U.NumDisp
GROUP BY A.Nome
ORDER BY MAX(U.Nota) DESC
LIMIT 1;

--O
SELECT AVG(AU.nota)
FROM AULA AU, PROFESSOR P
WHERE P.nome = 'MARCOS SALVADOR' AND
P.numfunc = AU.numfunc;

--P
SELECT D.nome, A.nome, AU.nota
FROM DISCIPLINA D, AULA AU, ALUNO A
WHERE D.numdisp = AU.numdisp AND
A.numaluno = AU.numaluno AND
AU.nota BETWEEN '5.0' AND '7.0'
ORDER BY D.nome ASC;

--Q
SELECT COUNT(DISTINCT A.numaluno)
FROM PROFESSOR P, AULA AU, ALUNO A
WHERE P.nome = 'ABGAIR SIMON FERREIRA' AND
AU.semestre = '01/1998' AND
P.numfunc = AU.numfunc AND
A.numaluno = AU.numaluno;

--R
SELECT AVG(AU.nota), COUNT(DISTINCT D.numdisp)
FROM ALUNO A, AULA AU, DISCIPLINA D
WHERE A.nome = 'EDVALDO CARLOS SILVA' AND
A.numaluno = AU.numaluno AND
D.numdisp = AU.numdisp;

--S
SELECT D.nome, AVG(AU.nota)
FROM DISCIPLINA D, AULA AU, CURSO C, DISCIPLINACURSO DC
WHERE AU.semestre = '01/1998' AND
D.numdisp = AU.numdisp AND
D.numdisp = DC.numdisp AND 
C.numcurso = DC.numcurso
GROUP BY D.nome;

--T
SELECT P.nome, AVG(AU.nota)
FROM PROFESSOR P, AULA AU
WHERE AU.semestre = '01/1998' AND
P.numfunc = AU.numfunc
GROUP BY P.nome;

--U
SELECT D.nome, AVG(AU.nota)
FROM DISCIPLINA D, AULA AU, CURSO C, DISCIPLINACURSO DC
WHERE AU.semestre = '01/1998' AND
C.nome = 'CIENCIA DA COMPUTACAO' AND
D.numdisp = AU.numdisp AND
D.numdisp = DC.numdisp AND 
C.numcurso = DC.numcurso
GROUP BY D.nome;

--V
SELECT SUM(D.quantcreditos)
FROM DISCIPLINA D, AULA AU, ALUNO A
WHERE A.nome = 'EDVALDO CARLOS SILVA' AND
D.numdisp = AU.numdisp AND 
A.numaluno = AU.numaluno AND
AU.nota >= 7;

--X
SELECT A.nome, SUM(D.quantcreditos)
FROM DISCIPLINA D, AULA AU, ALUNO A
WHERE D.numdisp = AU.numdisp AND 
A.numaluno = AU.numaluno AND
AU.nota >= 7
GROUP BY A.nome
HAVING SUM(D.quantcreditos) >= 70;

--W
SELECT A.nome, D.nome, P.nome
FROM ALUNO A, DISCIPLINA D, PROFESSOR P, AULA AU, CURSO C, DISCIPLINACURSO DC
WHERE AU.semestre = '01/1998' AND
C.nome = 'CIENCIA DA COMPUTACAO' AND
AU.nota > 8 AND
A.numaluno = AU.numaluno AND
D.numdisp = AU.numdisp AND
D.numdisp = DC.numdisp AND
C.numcurso = DC.numcurso AND
P.numfunc = AU.numfunc;













