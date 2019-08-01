CREATE SCHEMA LOJA;

SET SEARCH_PATH TO LOJA;

CREATE TABLE CLIENTE (
  codcliente SMALLINT PRIMARY KEY,
  nome VARCHAR(50),
  endereco VARCHAR(100),
  cidade VARCHAR(20),
  telefone VARCHAR(15),
  cgccliente VARCHAR(20),
  contato VARCHAR(50));

CREATE TABLE LOJA (
  codloja SMALLINT PRIMARY KEY,
  nome VARCHAR(50),
  endereco VARCHAR(100),
  cidade VARCHAR(20),
  cgccliente VARCHAR(20));

CREATE TABLE FATURA (
  numfatura INT PRIMARY KEY,
  datavenc DATE,
  datapg DATE,
  codcliente SMALLINT,
  valortotal NUMERIC(9,2),
  CONSTRAINT faturafk FOREIGN KEY (codcliente) REFERENCES CLIENTE);

CREATE TABLE NOTAFISCAL (
  numnfiscal SMALLINT PRIMARY KEY,
  data DATE,
  codcliente SMALLINT,
  codloja SMALLINT,
  numfatura INT,
  valortotal NUMERIC(9,2),
  CONSTRAINT faturafk1 FOREIGN KEY (codcliente) REFERENCES CLIENTE,
  CONSTRAINT faturafk2 FOREIGN KEY (codloja) REFERENCES LOJA,
  CONSTRAINT faturafk3 FOREIGN KEY (numfatura) REFERENCES FATURA);

CREATE TABLE PRODUTO (
  codproduto INT PRIMARY KEY,
  descricao VARCHAR(100),
  valorvenda NUMERIC(9,2),
  valorcompra NUMERIC(9,2),
  unidade VARCHAR(10),
  qtdestoque SMALLINT);

CREATE TABLE ITEMNOTAFISCAL (
  numnfiscal SMALLINT,
  codproduto INT,
  quantidade SMALLINT,
  valorunidcusto NUMERIC(9,2),
  valorunidvenda NUMERIC (9,2),
  CONSTRAINT faturaPK PRIMARY KEY (numnfiscal,codproduto),
  CONSTRAINT inffk1 FOREIGN KEY (numnfiscal) REFERENCES NOTAFISCAL,
  CONSTRAINT inffk2 FOREIGN KEY (codproduto) REFERENCES PRODUTO);

  INSERT INTO CLIENTE VALUES (111,'Computec Ltda', 'Av.São Carlos, 186', 'São Carlos - SP', '(017) 276-9999', '123.689.157/0001-89', 'José da Silva'),
(112, 'MicroMédia SA', 'R.José Bonifácio, 70', 'São Carlos - SP', '(017) 273-8974', '154.586.524/0001-55', 'João da Silva'),
(113, 'TecnoCom Ltda', 'R.Luiz Camões, 120', 'Ibaté - SP', '(017) 278-8568', '875.684.458/0001-99', 'Antonio Benedito'),
(114, 'C&P', 'Av. São Carlos, 176', 'São Carlos - SP', '(017) 274-9874', '352.476.777/0001-43', 'Lucas Jorge'),
(115, 'ProvTecno', 'R.Raul Junior, 180', 'São Carlos - SP', '(017) 273-9865', '278.852.468/0001-58', 'Carlos Antonio');

INSERT INTO LOJA  VALUES (1, 'Papelândia 1', 'Av.São Carlos, 870', 'São Carlos - SP', '232.456.666/0001-89'),
(2, 'Papelândia 2', 'R. XV Novembro, 121', 'São Carlos - SP', '232.456.666/0002-34'),
(3, 'Papelândia 3', 'R. 7 Setembro, 1823', 'São Carlos - SP', '232.456.666/0003-92'),
(4, 'Papelândia 4', 'Av. Independência, 567', 'São Carlos - SP', '232.456.666/0004-22'),
(5, 'Papelândia 5', 'R. Tiradentes 432', 'São Carlos - SP', '232.456.666/0005-19');


INSERT INTO FATURA (numfatura, datavenc, codcliente, valortotal) VALUES
(045675, '10/04/1999', 111, 101.50),
(045690,'10/05/1999', 111, 108.90),
(045691, '10/05/1999', 112, 120.50),
(045692, '10/05/1999', 113, 14.90),
(045693, '10/05/1999', 115, 31.50);

INSERT INTO NOTAFISCAL VALUES
(2142, '01/04/1999', 111, 1, 045675, 17.50),
(2143, '10/04/1999', 111, 2, 045675, 84.00),
(2144, '17/05/1999', 111, 1, 045675, 13.00),
(2145, '05/05/1999', 111, 1, 045690, 36.00),
(2146, '22/05/1999', 111, 2, 045690, 59.90),
(2147, '18/05/1999', 112, 2, 045691, 66.00),
(2148, '27/05/1999', 112, 5, 045691, 54.50),
(2149, '01/05/1999', 113, 4, 045692, 14.10),
(2150, '30/05/1999', 113, 4, 045692, 0.80),
(2151, '26/05/1999', 115, 5, 045693, 31.50);

INSERT INTO PRODUTO VALUES
(86477, 'Resma papel sufite', 8.00, 4.55, 'pacote', 571),
(86478, 'Clips nº 5', 3.00, 1.76, 'caixa', 424),
(86479, 'Clips nº 10', 5.00, 2.52, 'caixa', 454),
(86480, 'Grampo para Grampeador', 4.00, 1.43, 'caixa', 357),
(86481, 'Grampeador', 18.00, 10.50, 'unidade', 54),
(86482, 'Lapis preto nº 5', 0.20, 0.05, 'unidade', 86),
(86483, 'Caderno 10 matérias 150 fls', 5.50, 2.30, 'unidade', 98),
(86484, 'Caderno 12 matérias 150 fls', 7.00, 3.81, 'unidade', 75),
(86485, 'Caneta azul bic', 0.50, 0.20, 'unidade', 86),
(86486, 'Caneta vermelha bic', 0.50, 0.20, 'unidade', 67);

INSERT INTO ITEMNOTAFISCAL VALUES
(2142, 86477, 2, 4.55, 8.00),
(2142, 86486, 3, 0.20, 0.50),
(2143, 86479, 12, 2.52, 5.00),
(2143, 86480, 6, 1.43, 4.00),
(2144, 86484, 1, 3.81, 7.00),
(2144, 86478, 2, 1.76, 3.00),
(2145, 86480, 9, 1.43, 4.00),
(2146, 86483, 1, 2.30, 5.50),
(2146, 86481, 3, 10.50, 18.00),
(2146, 86482, 2, 0.05, 0.20),
(2147, 86485, 4, 0.20, 0.50),
(2147, 86477, 8, 4.55, 8.00),
(2148, 86483, 9, 2.30, 5.50),
(2148, 86479, 1, 2.52, 5.00),
(2149, 86480, 2, 1.43, 4.00),
(2149, 86482, 3, 0.05, 0.20),
(2149, 86483, 1, 2.30, 5.50),
(2150, 86482, 4, 0.05, 0.20),
(2151, 86480, 7, 1.43, 4.00),
(2151, 86486, 7, 0.20, 0.50);

-------------------------------------------------------------------------A-----------------------------------------------------------------
--EXERCICIO 1
CREATE VIEW fatura_view
AS SELECT FATURA.numfatura, NOTAFISCAL.numnfiscal, FATURA.valortotal
FROM FATURA, NOTAFISCAL
WHERE NOTAFISCAL.numfatura = FATURA.numfatura;

SELECT fatura_view.numfatura, SUM (fatura_view.valortotal)
FROM fatura_view
GROUP BY fatura_view.numfatura
;
/*
45693	"31.50"
45691	"241.00"
45692	"29.80"
45690	"217.80"
45675	"304.50"
*/

--EXERCICIO 2
CREATE VIEW cliente_view
AS SELECT CLIENTE.nome, COUNT (*)
FROM CLIENTE, LOJA, NOTAFISCAL
WHERE LOJA.codloja = NOTAFISCAL.codloja
and CLIENTE.codcliente = NOTAFISCAL.codcliente
GROUP BY CLIENTE.nome;

SELECT *
FROM cliente_view;

/*
"Computec Ltda"	"5"
"TecnoCom Ltda"	"2"
"MicroMédia SA"	"2"
"ProvTecno"	"1"
*/

--EXERCICIO 3
CREATE VIEW clienteLoja_view
AS SELECT CLIENTE.nome AS nomeCliente, LOJA.nome AS nomeLoja
FROM CLIENTE, LOJA, NOTAFISCAL
WHERE LOJA.codloja = NOTAFISCAL.codloja
and CLIENTE.codcliente = NOTAFISCAL.codcliente
GROUP BY CLIENTE.nome, LOJA.nome;

SELECT clienteLoja_view.nomeCliente, clienteLoja_view.nomeLoja
FROM clienteLoja_view
GROUP BY clienteLoja_view.nomeCliente, clienteLoja_view.nomeLoja;

/*
"Computec Ltda"	"Papelândia 1"
"MicroMédia SA"	"Papelândia 5"
"ProvTecno"	"Papelândia 5"
"TecnoCom Ltda"	"Papelândia 4"
"Computec Ltda"	"Papelândia 2"
"MicroMédia SA"	"Papelândia 2"
*/
--exercicio 4
CREATE VIEW produtosmaisvendidos
AS SELECT PRODUTO.descricao
FROM ITEMNOTAFISCAL, PRODUTO, NOTAFISCAL
WHERE ITEMNOTAFISCAL.codproduto = PRODUTO.codproduto
and NOTAFISCAL.numnfiscal = ITEMNOTAFISCAL.numnfiscal
GROUP BY PRODUTO.descricao, ITEMNOTAFISCAL.quantidade
ORDER BY (SUM(ITEMNOTAFISCAL.quantidade)) DESC
LIMIT 3;

SELECT *
FROM produtosmaisvendidos;

/*
"Clips nº 10"
"Caderno 10 matérias 150 fls"
"Grampo para Grampeador"
*/

--exercicio 5
CREATE VIEW notafiscaletalhada
AS SELECT N.numnfiscal, N.data, N.codcliente, N.codloja, N.valortotal, PRODUTO.descricao
FROM NOTAFISCAL N, PRODUTO, ITEMNOTAFISCAL
WHERE ITEMNOTAFISCAL.numnfiscal = N.numnfiscal
and PRODUTO.codproduto = ITEMNOTAFISCAL.codproduto;

SELECT *
FROM notafiscaletalhada;

/*
2142	"1999-04-01"	111	1	"17.50"	"Resma papel sufite"
2142	"1999-04-01"	111	1	"17.50"	"Caneta vermelha bic"
2143	"1999-04-10"	111	2	"84.00"	"Clips nº 10"
2143	"1999-04-10"	111	2	"84.00"	"Grampo para Grampeador"
2144	"1999-05-17"	111	1	"13.00"	"Caderno 12 matérias 150 fls"
2144	"1999-05-17"	111	1	"13.00"	"Clips nº 5"
2145	"1999-05-05"	111	1	"36.00"	"Grampo para Grampeador"
2146	"1999-05-22"	111	2	"59.90"	"Caderno 10 matérias 150 fls"
2146	"1999-05-22"	111	2	"59.90"	"Grampeador"
2146	"1999-05-22"	111	2	"59.90"	"Lapis preto nº 5"
2147	"1999-05-18"	112	2	"66.00"	"Caneta azul bic"
2147	"1999-05-18"	112	2	"66.00"	"Resma papel sufite"
2148	"1999-05-27"	112	5	"54.50"	"Caderno 10 matérias 150 fls"
2148	"1999-05-27"	112	5	"54.50"	"Clips nº 10"
2149	"1999-05-01"	113	4	"14.10"	"Grampo para Grampeador"
2149	"1999-05-01"	113	4	"14.10"	"Lapis preto nº 5"
2149	"1999-05-01"	113	4	"14.10"	"Caderno 10 matérias 150 fls"
2150	"1999-05-30"	113	4	"0.80"	"Lapis preto nº 5"
2151	"1999-05-26"	115	5	"31.50"	"Grampo para Grampeador"
2151	"1999-05-26"	115	5	"31.50"	"Caneta vermelha bic"
*/

--exercicio 6
CREATE VIEW clientesimportantes
as SELECT C.nome, C.contato, C.telefone, SUM (valortotal)
from CLIENTE C, FATURA F
WHERE c.codcliente = f.codcliente
GROUP BY c.codcliente
HAVING SUM (valortotal)>100;

SELECT *
FROM clientesimportantes;

/*
"MicroMédia SA"	"João da Silva"	"(017) 273-8974"	"120.50"
"Computec Ltda"	"José da Silva"	"(017) 276-9999"	"210.40"
*/

--exercicio 7

-----------------------------------------------------B-------------------------------------------------------
--exercicio 1
SELECT DISTINCT CLIENTE.nome, CLIENTE.telefone
FROM CLIENTE, LOJA, NOTAFISCAL
WHERE NOTAFISCAL.codloja = LOJA.codloja
and CLIENTE.codcliente = NOTAFISCAL.codcliente
and LOJA.codloja = 2;

/*
"Computec Ltda"	"(017) 276-9999"
"MicroMédia SA"	"(017) 273-8974"
*/

--exercicio 2

SELECT LOJA.nome
FROM LOJA, NOTAFISCAL
WHERE NOTAFISCAL.codloja = LOJA.codloja and
NOTAFISCAL.data BETWEEN '20/05/1999' AND '30/05/1999'
GROUP BY LOJA.nome, NOTAFISCAL.valortotal
ORDER BY SUM(NOTAFISCAL.valortotal) DESC
LIMIT 1;

/*
"Papelândia 2"
*/

----------------------------------------------------------C------------------------------------------

-- FULL OUTER JOIN
SELECT LOJA.*, NOTAFISCAL.*
FROM LOJA
FULL OUTER JOIN NOTAFISCAL ON LOJA.codloja = NOTAFISCAL.codloja

/*
1	"Papelândia 1"	"Av.São Carlos, 870"	"São Carlos - SP"	"232.456.666/0001-89"	2142	"1999-04-01"	111	1	45675	"17.50"
2	"Papelândia 2"	"R. XV Novembro, 121"	"São Carlos - SP"	"232.456.666/0002-34"	2143	"1999-04-10"	111	2	45675	"84.00"
1	"Papelândia 1"	"Av.São Carlos, 870"	"São Carlos - SP"	"232.456.666/0001-89"	2144	"1999-05-17"	111	1	45675	"13.00"
1	"Papelândia 1"	"Av.São Carlos, 870"	"São Carlos - SP"	"232.456.666/0001-89"	2145	"1999-05-05"	111	1	45690	"36.00"
2	"Papelândia 2"	"R. XV Novembro, 121"	"São Carlos - SP"	"232.456.666/0002-34"	2146	"1999-05-22"	111	2	45690	"59.90"
2	"Papelândia 2"	"R. XV Novembro, 121"	"São Carlos - SP"	"232.456.666/0002-34"	2147	"1999-05-18"	112	2	45691	"66.00"
5	"Papelândia 5"	"R. Tiradentes 432"	"São Carlos - SP"	"232.456.666/0005-19"	2148	"1999-05-27"	112	5	45691	"54.50"
4	"Papelândia 4"	"Av. Independência, 567"	"São Carlos - SP"	"232.456.666/0004-22"	2149	"1999-05-01"	113	4	45692	"14.10"
4	"Papelândia 4"	"Av. Independência, 567"	"São Carlos - SP"	"232.456.666/0004-22"	2150	"1999-05-30"	113	4	45692	"0.80"
5	"Papelândia 5"	"R. Tiradentes 432"	"São Carlos - SP"	"232.456.666/0005-19"	2151	"1999-05-26"	115	5	45693	"31.50"
3	"Papelândia 3"	"R. 7 Setembro, 1823"	"São Carlos - SP"	"232.456.666/0003-92"
*/

-- LEFT OUTER JOIN
SELECT *
FROM CLIENTE
LEFT OUTER JOIN FATURA ON CLIENTE.codcliente = FATURA.codcliente

/*
111	"Computec Ltda"	"Av.São Carlos, 186"	"São Carlos - SP"	"(017) 276-9999"	"123.689.157/0001-89"	"José da Silva"	45675	"1999-04-10"		111	"101.50"
111	"Computec Ltda"	"Av.São Carlos, 186"	"São Carlos - SP"	"(017) 276-9999"	"123.689.157/0001-89"	"José da Silva"	45690	"1999-05-10"		111	"108.90"
112	"MicroMédia SA"	"R.José Bonifácio, 70"	"São Carlos - SP"	"(017) 273-8974"	"154.586.524/0001-55"	"João da Silva"	45691	"1999-05-10"		112	"120.50"
113	"TecnoCom Ltda"	"R.Luiz Camões, 120"	"Ibaté - SP"	"(017) 278-8568"	"875.684.458/0001-99"	"Antonio Benedito"	45692	"1999-05-10"		113	"14.90"
115	"ProvTecno"	"R.Raul Junior, 180"	"São Carlos - SP"	"(017) 273-9865"	"278.852.468/0001-58"	"Carlos Antonio"	45693	"1999-05-10"		115	"31.50"
114	"C&P"	"Av. São Carlos, 176"	"São Carlos - SP"	"(017) 274-9874"	"352.476.777/0001-43"	"Lucas Jorge"
*/

-- RIGHT OUTER JOIN
SELECT *
FROM CLIENTE
RIGHT OUTER JOIN LOJA ON CLIENTE.cidade = LOJA.cidade

/*
115	"ProvTecno"	"R.Raul Junior, 180"	"São Carlos - SP"	"(017) 273-9865"	"278.852.468/0001-58"	"Carlos Antonio"	1	"Papelândia 1"	"Av.São Carlos, 870"	"São Carlos - SP"	"232.456.666/0001-89"
114	"C&P"	"Av. São Carlos, 176"	"São Carlos - SP"	"(017) 274-9874"	"352.476.777/0001-43"	"Lucas Jorge"	1	"Papelândia 1"	"Av.São Carlos, 870"	"São Carlos - SP"	"232.456.666/0001-89"
112	"MicroMédia SA"	"R.José Bonifácio, 70"	"São Carlos - SP"	"(017) 273-8974"	"154.586.524/0001-55"	"João da Silva"	1	"Papelândia 1"	"Av.São Carlos, 870"	"São Carlos - SP"	"232.456.666/0001-89"
111	"Computec Ltda"	"Av.São Carlos, 186"	"São Carlos - SP"	"(017) 276-9999"	"123.689.157/0001-89"	"José da Silva"	1	"Papelândia 1"	"Av.São Carlos, 870"	"São Carlos - SP"	"232.456.666/0001-89"
115	"ProvTecno"	"R.Raul Junior, 180"	"São Carlos - SP"	"(017) 273-9865"	"278.852.468/0001-58"	"Carlos Antonio"	2	"Papelândia 2"	"R. XV Novembro, 121"	"São Carlos - SP"	"232.456.666/0002-34"
114	"C&P"	"Av. São Carlos, 176"	"São Carlos - SP"	"(017) 274-9874"	"352.476.777/0001-43"	"Lucas Jorge"	2	"Papelândia 2"	"R. XV Novembro, 121"	"São Carlos - SP"	"232.456.666/0002-34"
112	"MicroMédia SA"	"R.José Bonifácio, 70"	"São Carlos - SP"	"(017) 273-8974"	"154.586.524/0001-55"	"João da Silva"	2	"Papelândia 2"	"R. XV Novembro, 121"	"São Carlos - SP"	"232.456.666/0002-34"
111	"Computec Ltda"	"Av.São Carlos, 186"	"São Carlos - SP"	"(017) 276-9999"	"123.689.157/0001-89"	"José da Silva"	2	"Papelândia 2"	"R. XV Novembro, 121"	"São Carlos - SP"	"232.456.666/0002-34"
115	"ProvTecno"	"R.Raul Junior, 180"	"São Carlos - SP"	"(017) 273-9865"	"278.852.468/0001-58"	"Carlos Antonio"	3	"Papelândia 3"	"R. 7 Setembro, 1823"	"São Carlos - SP"	"232.456.666/0003-92"
114	"C&P"	"Av. São Carlos, 176"	"São Carlos - SP"	"(017) 274-9874"	"352.476.777/0001-43"	"Lucas Jorge"	3	"Papelândia 3"	"R. 7 Setembro, 1823"	"São Carlos - SP"	"232.456.666/0003-92"
112	"MicroMédia SA"	"R.José Bonifácio, 70"	"São Carlos - SP"	"(017) 273-8974"	"154.586.524/0001-55"	"João da Silva"	3	"Papelândia 3"	"R. 7 Setembro, 1823"	"São Carlos - SP"	"232.456.666/0003-92"
111	"Computec Ltda"	"Av.São Carlos, 186"	"São Carlos - SP"	"(017) 276-9999"	"123.689.157/0001-89"	"José da Silva"	3	"Papelândia 3"	"R. 7 Setembro, 1823"	"São Carlos - SP"	"232.456.666/0003-92"
115	"ProvTecno"	"R.Raul Junior, 180"	"São Carlos - SP"	"(017) 273-9865"	"278.852.468/0001-58"	"Carlos Antonio"	4	"Papelândia 4"	"Av. Independência, 567"	"São Carlos - SP"	"232.456.666/0004-22"
114	"C&P"	"Av. São Carlos, 176"	"São Carlos - SP"	"(017) 274-9874"	"352.476.777/0001-43"	"Lucas Jorge"	4	"Papelândia 4"	"Av. Independência, 567"	"São Carlos - SP"	"232.456.666/0004-22"
112	"MicroMédia SA"	"R.José Bonifácio, 70"	"São Carlos - SP"	"(017) 273-8974"	"154.586.524/0001-55"	"João da Silva"	4	"Papelândia 4"	"Av. Independência, 567"	"São Carlos - SP"	"232.456.666/0004-22"
111	"Computec Ltda"	"Av.São Carlos, 186"	"São Carlos - SP"	"(017) 276-9999"	"123.689.157/0001-89"	"José da Silva"	4	"Papelândia 4"	"Av. Independência, 567"	"São Carlos - SP"	"232.456.666/0004-22"
115	"ProvTecno"	"R.Raul Junior, 180"	"São Carlos - SP"	"(017) 273-9865"	"278.852.468/0001-58"	"Carlos Antonio"	5	"Papelândia 5"	"R. Tiradentes 432"	"São Carlos - SP"	"232.456.666/0005-19"
114	"C&P"	"Av. São Carlos, 176"	"São Carlos - SP"	"(017) 274-9874"	"352.476.777/0001-43"	"Lucas Jorge"	5	"Papelândia 5"	"R. Tiradentes 432"	"São Carlos - SP"	"232.456.666/0005-19"
112	"MicroMédia SA"	"R.José Bonifácio, 70"	"São Carlos - SP"	"(017) 273-8974"	"154.586.524/0001-55"	"João da Silva"	5	"Papelândia 5"	"R. Tiradentes 432"	"São Carlos - SP"	"232.456.666/0005-19"
111	"Computec Ltda"	"Av.São Carlos, 186"	"São Carlos - SP"	"(017) 276-9999"	"123.689.157/0001-89"	"José da Silva"	5	"Papelândia 5"	"R. Tiradentes 432"	"São Carlos - SP"	"232.456.666/0005-19"
*/
