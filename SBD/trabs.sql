

ESQUEMA CONCEITUAL

Tá 


Especificação do Problema


O objetivo da modelagem é retratar de acordo com a realidade o que acontece em um evento muito conhecido que é copa do mundo de futebol mostrando os acontecimentos e os vários serviços exigidos que as veses nem reparamos.


ENTIDADES FORTES 

CAMPEONATO : guarda as informações gerais da copa.
id_campeonato : campo que diferencia as diferentes copas do mundo
nome : guarda o nome da copa do mundo
​​data_inicio : dia em que o primeiro jogo acontece
data_fim : dia da final e encerramento 
pais_host : pais sorteado para sediar o evento        


PARTIDA : guarda as informações de uma partida qualquer
                   ​id_partida : código que diferencia as 
diferentes partidas existentes
​​data : dia em que o jogo aconteceu
                        ​horario : hora em que o jogo começa
ESTADIO : locais que os jogos ocorreram
​​id_estadio : código de identificação para diferenciar os vários estádios usados
​​nome : nome do estádio  
​​capacidade : lotação máxima do estádio
​​data_Inauguracao : data em que o estádio está pronto após as reformas
​​país : país em que o estádio se localiza
​​idade : idade do estádio
​​estado_distrito : estado e cidade que o estádio se localiza
TRANSMISSORA : responsáveis por levar informações do evento por diversos meios de comunicação
​​id_Transmissora : código que identifica e separa as diferentes emissoras presentes para a cobertura do evento
​​nome : nome  transmissora 
​​pais_origem : pais de origem da emissora
PATROCINADOR : patrocinadores das seleções
​​id_patrocinador : código de cada um patrocinador
​​nome : nome ou marca do patrocínio
 
 
SELEÇÃO : seleções participantes do evento
​​id_selecao : código para identificar as seleções
​​nome : nome da seleção
​​quant_jogos : quantidade de jogos da seleção
​​fase : fase em que a seleção chegou
​​pontos : numero de pontos na fase grupos
​​n_total_cartoesvermelhos :
​​n_total_cartoesamarelos :
​​vitorias : numero de vitorias
​​empates : numero de empates
​​derrotas : numero de derrotas
GRUPO : campo de agrupa os times
​​Id_grupo : identificador do grupo
​​Nome : nome do grupo
PESSOA : participantes da copa
​​Id_pessoa : identificador das pessoas
​​nome : nome das pessoas
​​nacionalidade : nacionalidade da pessoa
​​tipo_pessoa : cargo ou função da função
ARBRITO : pessoa responsável por apitar a partida
JOGADOR : participantes do time
​​Quant_gols : numero de gols marcados pelo jogador
​​n_total_cartoesvermelhos : numero de cartões vermelhos do jogador
​​n_total_cartoesamarelos : numero de cartões amarelos do jogador
​​posição : posição dentro de campo no time
​​data_admissao : dia que o jogador foi contratado
TECNICO : pessoa que administra o time
​​data_admissao : dia que o técnico foi contratado
 
CONFEDERACAO :
​​Id_confederacao :
​​Nome : nome da confederação
Sigla : sigla da confederacao
​​data_fundacao : dia de criação da confederação
​​pais : pais que a confederação representa
​​estado_distrito : distrito da confederação
​​cidade : cidade da confederação
​​data_admissao : data que a confederação entra na copa
ASSOCIACAO :
​​id_associassao : código da associação
​​nome : nome da associação
​ ​data_fundacao : dia de criação da associação
​​pais : pais da associação
​​estado_distrito : distrito da associação
​​id_presidente : identificação do presidente da associação
​​data_admissao : dia que foi associada a confederação
​​id_confederacao : identificação da confederação
​​data_filiacao : data de filiação da associação​
​​
ENTIDADE FRACA -
TREINO : treinamento feitos na copa
​​hora : inicio do treino
​​data : dia que foi feito o treinamento
 
RELACIONAMENTOS –
TRANSMITIDO : guarda informação do jogo e que emissora transmitiu o jogo
PARTICIPA : seleções que iram jogar
​​id_selecao : identificadores das seleções
​​n_gols : numero de gols da partida
​​n_cartoes : numero de cartões da partida
​​n_cartoes_amarelos : numero de cartões amarelo no jogo
​​n_cartoes_vermelhos : numero de cartões vermelho no jogo
​​resultados : resultado do jogo
COMPETIU : indica as seleções que foram pra copa do mundo
E_ARBRITO : indica qual arbitro apitou o jogo
PATROCINA : são os patrocinadores das seleções
FOI_PARTIDA : indica que certo jogo foi de uma determinada copa
LOCAL : indica em que estádio aconteceu o jogo
ASSISTENTE : indica que o arbitro tem outros árbitros auxiliares
E_ARBITRO : indica que o arbitro apitou o jogo
E_DA : relaciona o arbitro com uma confederação
JOGA : representa um jogador em uma seleção
CAPITAO : indica que um jogador é o capitão do time
E_TECNICO : uma pessoa é o técnico da seleção
CLASSIFICADAS : mostrar quais seleções foram classificadas em um grupo
PRESIDENTE_CONF : representa que uma pessoa é o presidente da confederação
FILIAÇÃO : uma confederação participa de uma associação
ASSOCIADO : indica que uma seleção participa de uma associação
PRESIDENTE_ASS : indica que uma pessoa é o presidente da associação
 
RELACIONAMENTOS FRACOS –
LOCAL_TREINO : indica que varias seleções treinam em algum estádio
EQUIPE : significa que uma seleção se encontra para treinar
 


MAPEAMENTO

CAMPEONATO(id_campeonato, nome, data_inicio, data_fim, pais_sede)

PARTIDA(id_partida, data, horario, id_campeonato(CAMPEONATO.id_campeonato), id_estadio(ESTADIO.id_estadio))

ESTADIO(id_estadio, nome, capacidade, data_inauguracao, país, cidade, estado_distrito)

TRANSMISSORA(id_transmissora, nome, pais_origem)

PATROCINADOR(id_patrocinador, nome)

SELECAO(id_selecao, nome, quant_jogos, fase,id_grupo(GRUPO.id_grupo), pontos, n_total_cartoesvermelhos, n_total_cartoesamarelos, vitorias, empates, derrotas,
id_capitão(JOGADOR.id_pessoa), id_tecnico(TECNICO.id_pessoa),  id_associacao(ASSOCIACAO.id_associacao))

GRUPO(id_grupo, nome)

PESSOA(id_pessoa, nome, nacionalidade, tipo_pessoa)

ARBITRO(id_pessoa(PESSOA.id_pessoa), id_chefe(ARBITRO.id_pessoa), id_confederacao(CONFEDERACAO.id_confederacao))

JOGADOR(id_pessoa(PESSOA.id_pessoa), quant_Gols, n_cartoes_amarelos, n_cartoes_vermelhos, posicao, data_admissao, id_selecao(SELECAO.id_selecao))

TECNICO(id_pessoa(PESSOA.id_pessoa), data_admissao)

CONFEDERACAO(id_confederacao, nome,sigla, data_fundacao, pais, estado_distrito,cidade, id_presidente(PESSOA.id_pessoa), data_admissao) -- MUDAR AQUI

ASSOCIACAO(id_associacao, nome, data_fundacao, pais, estado_distrito,cidade, id_presidente, data_admissao, id_confederacao(CONFEDERACAO.id_confederacaoQua), data_filiacao) ----- MUDAR AQUI

TREINO(hora, data, id_estadio(ESTADIO.id_estadio)(ESTADIO.id_estadio), id_selecao(SELECAO.id_selecao))

CLASSIFICACAO()

TRANSMITIDO(id_partida(PARTIDA.id_partida), id_transmissora(TRANSMISSORA.id_transmissora))

PARTICIPA(id_partida(PARTIDA.id_partida), id_selecao, n_gols, n_cartoes_amarelos, n_cartoes_vermelhos, resultado)

COMPETIU(id_selecao(SELECAO.id_selecao), id_campeonato(CAMPEONATO.id_campeonato), posicao)

E_ARBITRO(id_pessoa(PESSOA.id_pessoa), id_partida(PARTIDA.id_partida))

PATROCINA(id_patrocinador(PATROCINADOR.id_patrocinador), id_selecao(SELECAO.id_selecao))

CREATE SCHEMA CAMPEONATOS;
SET search_path TO CAMPEONATOS;
SET datestyle TO 'DMY';

CREATE TABLE CAMPEONATO(
  id_campeonato INTEGER NOT NULL,
  nome VARCHAR(30) NOT NULL,
  data_inicio TIMESTAMP NOT NULL,
  data_fim TIMESTAMP NOT NULL,
  pais_sede VARCHAR NOT NULL,
  CONSTRAINT PK_CAMPEONATO
    PRIMARY KEY (id_campeonato)
);


CREATE TABLE ESTADIO(
  id_estadio INTEGER NOT NULL,
  nome VARCHAR(30) NOT NULL,
  capacidade INTEGER NOT NULL,
  data_inauguracao TIMESTAMP NOT NULL,
  pais VARCHAR(30) NOT NULL,
  cidade VARCHAR(30) NOT NULL,
  estado_distrito VARCHAR(30) NOT NULL,
  CONSTRAINT PK_ESTADIO
    PRIMARY KEY (id_estadio)
  );

CREATE TABLE PARTIDA(
  id_partida INTEGER NOT NULL,
  data TIMESTAMP NOT NULL,
  horario TIME NOT NULL,
  id_campeonato INTEGER NOT NULL,
  id_estadio INTEGER NOT NULL,
  CONSTRAINT PK_PARTIDA
    PRIMARY KEY (id_partida)
  CONSTRAINT FK_CAMPEONATO
    FOREIGN KEY (id_campeonato) REFERENCES CAMPEONATO
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  CONSTRAINT FK_ESTADIO
    FOREIGN KEY (id_estadio) REFERENCES ESTADIO
    ON UPDATE CASCADE
    ON DELETE NO ACTION
);



CREATE TABLE TRANSMISSORA(
  id_transmissora INTEGER NOT NULL,
  nome VARCHAR(30) NOT NULL,
  pais_origem VARCHAR(30) NOT NULL,
  CONSTRAINT PK_TRANSMISSORA
    PRIMARY KEY (id_transmissora)
);

CREATE TABLE PATRONINADOR(
    id_patroninador INTEGER NOT NULL,
    nome VARCHAR(30) NOT NULL,
    CONSTRAINT PK_PATROCINADOR
      PRIMARY KEY (id_patrocinador)
);

CREATE TABLE GRUPO(
  id_grupo INTEGER NOT NULL,
  nome VARCHAR(30) NOT NULL,
  CONSTRAINT PK_GRUPO
    PRIMARY KEY (id_grupo)
);


CREATE TABLE CONFEDERACAO(
  id_confederacao INTEGER NOT NULL,
  nome VARCHAR(30) NOT NULL,
  data_fundacao TIMESTAMP NOT NULL,
  pais VARCHAR(30) NOT NULL,
  estado_distrito VARCHAR(30) NOT NULL,
  cidade VARCHAR(30) NOT NULL,
  id_presidente VARCHAR(30) NOT NULL,
  data_admissao TIMESTAMP NOT NULL,
  sigla VARCHAR(30) NOT NULL,
  CONSTRAINT PK_CONFEDERACAO
    PRIMARY KEY (id_confederacao),
  CONSTRAINT FK_PESSOA
  FOREIGN KEY (id_presidente) REFERENCES PESSOA(id_pessoa)
);









CREATE TABLE ASSOCIACAO(
  id_associacao INTEGER NOT NULL,
  nome VARCHAR(30) NOT NULL,
  data_fundacao TIMESTAMP NOT NULL,
  pais VARCHAR(30) NOT NULL,
  estado_distrito VARCHAR(30) NOT NULL,
  cidade VARCHAR(30) NOT NULL,
  id_presidente VARCHAR(30) NOT NULL,
  data_admissao TIMESTAMP NOT NULL,
  id_confederacao INTEGER NOT NULL,
  data_filiacao TIMESTAMP NOT NULL,
  CONSTRAINT PK_ASSOCIACAO
    PRIMARY KEY (id_associacao),
  CONSTRAINT FK_PESSOA
    FOREIGN KEY (id_presidente) REFERENCES PESSOA(id_pessoa),
  CONSTRAINT FK_CONFEDERACAO
    FOREIGN KEY (id_confederacao) REFERENCES CONFEDERACAO
);

CREATE TABLE PESSOA(
  id_pessoa INTEGER NOT NULL,
  nome VARCHAR(30) NOT NULL,
  nacionalidade VARCHAR(30) NOT NULL,
  tipo_pessoa VARCHAR(30) NOT NULL,
  CONSTRAINT PK_PESSOA
    PRIMARY KEY (id_pessoa)
);

-- DUVIDA AQUI --------------------------------------------------------------------------
CREATE TABLE ARBITRO(
  id_pessoa INTEGER NOT NULL,
  id_chefe INTEGER,
  id_confederacao INTEGER NOT NULL,
  CONSTRAINT FK_PESSOA
    FOREIGN KEY (id_pessoa) REFERENCES PESSOA,
    CONSTRAINT FK_PESSOA
      FOREIGN KEY (id_pessoa) REFERENCES PESSOA,
    CONSTRAINT FK_CONFEDERACAO
      FOREIGN KEY (id_confederacao) REFERENCES CONFEDERACAO
);





CREATE TABLE TECNICO(
  id_pessoa INTEGER NOT NULL,
  data_admissao DATE NOT NULL,
  CONSTRAINT FK_PESSOA
    FOREIGN KEY (id_pessoa) REFERENCES PESSOA(id_pessoa)
);

CREATE TABLE SELECAO(
  id_selecao INTEGER NOT NULL,
  nome VARCHAR(30) NOT NULL,
  quant_jogos INTEGER NOT NULL,
  fase VARCHAR(30) NOT NULL,
  pontos INTEGER NOT NULL,
  n_total_cartoesvermelhos INTEGER NOT NULL, 
  n_total_cartoesamarelos INTEGER NOT NULL,
  vitorias INTEGER NOT NULL,
  empates INTEGER NOT NULL,
  derrotas INTEGER NOT NULL,
  id_grupo INTEGER NOT NULL,
  id_capitao INTEGER NOT NULL, -- o constraint e foreign key serão adicionados depois da criacao da tabela jogador
  id_tecnico INTEGER NOT NULL, 
  id_associacao INTEGER NOT NULL,
  CONSTRAINT PK_SELECAO 
   PRIMARY KEY (id_selecao),
  CONSTRAINT FK_GRUPO
   FOREIGN KEY (id_grupo) REFERENCES GRUPO,
  CONSTRAINT FK_TECNICO
   FOREIGN KEY (id_tecnico) REFERENCES TECNICO(id_pessoa),
  CONSTRAINT FK_ASSOCIACAO
   FOREIGN KEY (id_associacao) REFERENCES ASSOCIACAO 
);














CREATE TABLE JOGADOR(
  id_pessoa INTEGER NOT NULL,
  quant_gols INTEGER NOT NULL,
  n_cartoes_amarelos INTEGER NOT NULL,
  n_cartoes_vermelhos INTEGER NOT NULL,
  posicao VARCHAR(10) NOT NULL,
  data_admissao TIMESTAMP NOT NULL,
  id_selecao,
  CONSTRAINT FK_PESSOA
    FOREIGN KEY (id_pessoa) REFERENCES pessoa,
  CONSTRAINT FK_SELECAO
   FOREIGN KEY (id_selecao) REFERENCES SELECAO   
);

ALTER TABLE SELECAO  -- adicionando o FK em selecao
ADD CONSTRAINT FK_JOGADOR
FOREIGN KEY (id_capitao) REFERENCES JOGADOR(id_pessoa);


CREATE TABLE TREINO(
  hora TIME NOT NULL,
  data DATE NOT NULL
  id_estadio INTEGER NOT NULL,
  id_selecao INTEGER NOT NULL,
  CONSTRAINT FK_ESTADIO
    FOREIGN KEY (id_estadio) REFERENCES ESTADIO(id_estadio),
  CONSTRAINT FK_SELECAO
    FOREIGN KEY (id_selecao) REFERENCES SELECAO(id_selecao)
);

CREATE TABLE TRANSMITIDO(
  id_partida INTEGER NOT NULL,
  id_transmissora INTEGER NOT NULL,
  CONSTRAINT FK_PARTIDA
    FOREIGN KEY (id_partida) REFERENCES PARTIDA(id_partida),
  CONSTRAINT FK_TRANSMISSORA
    FOREIGN KEY (id_transmissora) REFERENCES TRANSMISSORA(id_transmissora),
);








CREATE TABLE PARTICIPA(
  id_partida INTEGER NOT NULL,
  id_selecao INTEGER NOT NULL,
  n_gols INTEGER NOT NULL,
  n_cartoes_amarelos INTEGER NOT NULL,
  n_cartoes_vermelhos INTEGER NOT NULL,
  resultado VARCHAR(30) CONSTRAINT resultados CHECK(resultado = 'GANHOU' OR resultado = 'EMPATOU' OR resultado = 'NAO JOGOU' OR resultado = 'PERDEU'),
  CONSTRAINT FK_PARTIDA
    FOREIGN KEY (id_partida) REFERENCES PARTIDA(id_partida),
  CONSTRAINT FK_SELECAO
    FOREIGN KEY (id_selecao) REFERENCES SELECAO(id_selecao)
);

CREATE TABLE COMPETIU(
  id_selecao INTEGER NOT NULL,
  id_campeonato INTEGER NOT NULL,
  posicao INTEGER NOT NULL,
  CONSTRAINT FK_SELECAO
    FOREIGN KEY (id_selecao) REFERENCES SELECAO(id_selecao),
  CONSTRAINT FK_CAMPEONATO
    FOREIGN KEY (id_campeonato) REFERENCES CAMPEONATO(id_campeonato)
);

CREATE TABLE PATROCINA(
  id_patrocinador INTEGER NOT NULL,
  id_selecao INTEGER NOT NULL,
  CONSTRAINT FK_PATROCINADOR
    FOREIGN KEY (id_patrocinador) REFERENCES PATROCINADOR,
  CONSTRAINT FK_SELECAO
    FOREIGN KEY (id_selecao) REFERENCES FK_SELECAO
);

CREATE TABLE E_ARBITRO(
  id_pessoa INTEGER NOT NULL,
  id_partida INTEGER NOT NULL,
  CONSTRAINT FK_PESSOA
    FOREIGN KEY (id_pessoa) REFERENCES PESSOA(id_pessoa),
  CONSTRAINT FK_PARTIDA
    FOREIGN KEY (id_partida) REFERENCES PARTIDA(id_partida));











































Inserção de dados 
-- DADOS CAMPEONATOS

INSERT INTO CAMPEONATO VALUES (11,'Copa do Mundo FIFA de 2014','12/06/2014','13/07/2014','Brasil');

-- DADOS ESTADIOS

INSERT INTO ESTADIO VALUES (21,'Estadio Jornalista Marios Filho',79000,'16/06/1950','Brasil','Rio de Janeiro','Rio de Janeiro');
INSERT INTO ESTADIO VALUES (22,'Arena Corinthians',68000,'15/04/2014','Brasil','Sao Paulo','Sao Paulo');
INSERT INTO ESTADIO VALUES (23,'Estadio Governador Magalhaes Pinto',62170,'05/09/1965','Brasil','Belo Horizone','Minas Gerais');
INSERT INTO ESTADIO VALUES (24,'Estadio Nacional de Brasilia Mane Garrincha',70000,'10/36/1974','Brasil','Brasilia','Distrito Federal');
INSERT INTO ESTADIO VALUES (25,'Complexo Esportivo Octávio Mangabeira',50000,'28/01/1951','Brasil','Salvador','Bahia');
INSERT INTO ESTADIO VALUES (26,'Estádio Plácido Aderaldo Castelo Branco',63903,'11/11/1973','Brasil','Fortaleza','Ceara');
INSERT INTO ESTADIO VALUES (27,'Arena Pernambuco',46000,'14/04/2013','Brasil','Recife','Pernambuco');
INSERT INTO ESTADIO VALUES (28,'Estádio José Pinheiro Borda',52000,'06/04/1969','Brasil','Porto Alegra','Rio Grande do Sul');
INSERT INTO ESTADIO VALUES (29,'Estádio Joaquim Américo Guimarães',41000,'06/09/1914','Brasil','Curitiba','Parana');
INSERT INTO ESTADIO VALUES (211,'Arena das Dunas',43000,'22/01/2014','Brasil','Natal','Rio Grande do Norte');
INSERT INTO ESTADIO VALUES (212,'Arena Pantanal',44000,'02/04/2014','Brasil','Cuiaba','Mato grosso');
INSERT INTO ESTADIO VALUES (212,'Arena da Amazonia',44000,'09/03/2014','Brasil','Manaus','Amazonas');

-- DADOS TRANSMISSORA

INSERT INTO TRANSMISSORA VALUES (31,'Rede Globo','Brasil');
INSERT INTO TRANSMISSORA VALUES (32,'Rede Bandeirantes','Brasil');
INSERT INTO TRANSMISSORA VALUES (33,'SporTV','Brasil');
INSERT INTO TRANSMISSORA VALUES (34,'ESPN','Estados Unidos');
INSERT INTO TRANSMISSORA VALUES (35,'ARD','Alemanha');
INSERT INTO TRANSMISSORA VALUES (36,'TyC','Argentina');
INSERT INTO TRANSMISSORA VALUES (37,'RTP','Portugal');
INSERT INTO TRANSMISSORA VALUES (38,'BBC','Reino Unido');
INSERT INTO TRANSMISSORA VALUES (39,'VGTRK','Russia');
INSERT INTO TRANSMISSORA VALUES (311,'SRG SSR','Suica');

-- DADOS PATROCINADOR

INSERT INTO PATROCINADOR VALUES (41,'Adidas');
INSERT INTO PATROCINADOR VALUES (42,'Nike');
INSERT INTO PATROCINADOR VALUES (43,'Coca-Cola');
INSERT INTO PATROCINADOR VALUES (44,'Visa');
INSERT INTO PATROCINADOR VALUES (45,'VIVO');
INSERT INTO PATROCINADOR VALUES (46,'ITAU');
INSERT INTO PATROCINADOR VALUES (47,'EMIRATES');
INSERT INTO PATROCINADOR VALUES (48,'Sony');
INSERT INTO PATROCINADOR VALUES (49,'McDonalds');
INSERT INTO PATROCINADOR VALUES (411,'Seara');

-- DADOS GRUPO

INSERT INTO GRUPO VALUES (51,'Grupo A');
INSERT INTO GRUPO VALUES (52,'Grupo B');
INSERT INTO GRUPO VALUES (53,'Grupo C');
INSERT INTO GRUPO VALUES (54,'Grupo D');
INSERT INTO GRUPO VALUES (55,'Grupo E');
INSERT INTO GRUPO VALUES (56,'Grupo F');
INSERT INTO GRUPO VALUES (57,'Grupo G');
INSERT INTO GRUPO VALUES (58,'Grupo H');

-- DADOS PESSOA
INSERT INTO PESSOA VALUES(1,'Alisson da Silva','Brasil','Jogador');
INSERT INTO PESSOA VALUES(2,'Neymar Junior','Brasil','Jogador');
INSERT INTO PESSOA VALUES(3,'Danilo Ferreira','Brasil','Jogador');
INSERT INTO PESSOA VALUES(4,'Thiago Silva','Brasil', 'Jogador');
INSERT INTO PESSOA VALUES(5,'Pedro Miranda','Brasil','Jogador');
INSERT INTO PESSOA VALUES(6,'João Paulo','Brasil','Jogador');
INSERT INTO PESSOA VALUES(7,'Paulo Roberto','Brasil','Jogador');
INSERT INTO PESSOA VALUES(8,'Willian Costa','Brasil','Jogador');
INSERT INTO PESSOA VALUES(9,'Gabriel Jesus','Brasil','Jogador');
INSERT INTO PESSOA VALUES(10,'Felipe Franco','Brasil','Jogador');

INSERT INTO PESSOA VALUES(11,'Yan Lucas','Alemanha','Tecnico');
INSERT INTO PESSOA VALUES(12,'Gabriel Mendes','Holanda','Tecnico');
INSERT INTO PESSOA VALUES(13,'Vagner Dalbelo','Estados Unidos','Tecnico');
INSERT INTO PESSOA VALUES(14,'João Daniel','Franca','Tecnico');
INSERT INTO PESSOA VALUES(15,'Pedro Henrique','Brasil','Tecnico');
INSERT INTO PESSOA VALUES(16,'Bruno Victor','China','Tecnico');
INSERT INTO PESSOA VALUES(17,'Breno Agostini','Japao','Tecnico');
INSERT INTO PESSOA VALUES(18,'Marcos Paulo','Uruguai','Tecnico');
INSERT INTO PESSOA VALUES(19,'Victor Hugo','Irlanda','Tecnico');
INSERT INTO PESSOA VALUES(20,'Humberto da Silva','Russia','Tecnico');

INSERT INTO PESSOA VALUES(21,'Isabelle Souza Santos','Alemanha','Normal');
INSERT INTO PESSOA VALUES(22,'Sophia Cunha Santos','Holanda','Normal');
INSERT INTO PESSOA VALUES(23,'Júlia Azevedo Goncalves','Estados Unidos','Normal');
INSERT INTO PESSOA VALUES(24,'Evelyn Barros Ferreira','Franca','Normal');
INSERT INTO PESSOA VALUES(25,'Leonor Almeida Santos','Brasil','Normal');
INSERT INTO PESSOA VALUES(26,'Samuel Correia Rocha','China','Normal');
INSERT INTO PESSOA VALUES(27,'Nicolas Ribeiro Lima','Japao','Normal');
INSERT INTO PESSOA VALUES(28,'André Alves Barros','Uruguai','Normal');
INSERT INTO PESSOA VALUES(29,'Davi Araujo Pinto','Irlanda','Normal');
INSERT INTO PESSOA VALUES(30,'Kauan Goncalves Sousa','Russia','Normal');

INSERT INTO PESSOA VALUES(31,'Carlos Rodrigues Alves','Alemanha','Arbitro');
INSERT INTO PESSOA VALUES(32,'Arthur Barbosa Costa','Irlanda','Arbitro');
INSERT INTO PESSOA VALUES(33,'Douglas Azevedo Barbosa','Estados Unidos','Arbitro');
INSERT INTO PESSOA VALUES(34,'Murilo Martins Melo','Brasil','Arbitro');
INSERT INTO PESSOA VALUES(35,'Kai Pereira Barbosa','China','Arbitro');
INSERT INTO PESSOA VALUES(36,'José Barros Martins','Russia','Arbitro');
INSERT INTO PESSOA VALUES(37,'Diego Ribeiro Alves','Japao','Arbitro');
INSERT INTO PESSOA VALUES(38,'Nicolas Goncalves Castro','Brasil','Arbitro');
INSERT INTO PESSOA VALUES(39,'Alex Souza Alves','Uruguai','Arbitro');
INSERT INTO PESSOA VALUES(40,'Otávio Rodrigues Castro','Argentina','Arbitro');
INSERT INTO PESSOA VALUES(41,'Jureg da Silva Souza','Inglaterra','Arbitro');
INSERT INTO PESSOA VALUES(42,'Enzo Carvalho Santos','Franca','Arbitro');




-- DADOS TECNICO 

INSERT INTO TECNICO VALUES(11,'25/01/2014');
INSERT INTO TECNICO VALUES(12,'20/02/2016');
INSERT INTO TECNICO VALUES(13,'16/07/2015');
INSERT INTO TECNICO VALUES(14,'30/05/2015');
INSERT INTO TECNICO VALUES(15,'13/12/2014');
INSERT INTO TECNICO VALUES(16,'25/11/2014');
INSERT INTO TECNICO VALUES(17,'16/02/2012');
INSERT INTO TECNICO VALUES(18,'25/09/2011');
INSERT INTO TECNICO VALUES(19,'09/08/2013');
INSERT INTO TECNICO VALUES(20,'25/09/2010');

-- DADOS CONFEDERACAO So existem 6 confederacoes
INSERT INTO CONFEDERACAO VALUES (1,'Confederacao Sul-Americana de Futebol','CONMEBOL','09/06/1916','Paraguai','Departamento Central','Luque',21,'26/01/2016');
INSERT INTO CONFEDERACAO VALUES (2,'Confederacao de Futebole da America do Norte','CONCACAF','01/01/1961','Estados Unidos','Florida','Miami',22,'05/04/2016');
INSERT INTO CONFEDERACAO VALUES (3,'Uniao das Federacoes Europeias de Futebol','UEFA','15/06/19','Suica','Distrito de nyon','Nyon',23,'14/09/2016');
INSERT INTO CONFEDERACAO VALUES (4,'Confederacao Asiatica de Futebol','AFC','08/05/1916','Malasia','Selangor','Kuala Lumpur',24,'15/07/2016');
INSERT INTO CONFEDERACAO VALUES (5,'Confederacao Africana de Futebol','CAF','10/02/1957','Egito','muhafazah','Cairo',25,'16/02/2016');
INSERT INTO CONFEDERACAO VALUES (6,'Confederacao de Futebol da Oceania','OFC','01/02/1966','Nova zelandia','ilha norte','Auckland',26,'17/07/2016');

-- DADOS ASSOCIACAO 

INSERT INTO ASSOCIACAO VALUES(1)


-- DADOS ARBITRO
INSERT INTO ARBITRO VALUES(31,33,3);
INSERT INTO ARBITRO VALUES(32,33,3);
INSERT INTO ARBITRO VALUES(33,NULL,2);
INSERT INTO ARBITRO VALUES(34,36,1);
INSERT INTO ARBITRO VALUES(35,36,4);
INSERT INTO ARBITRO VALUES(36,NULL,3);
INSERT INTO ARBITRO VALUES(37,39,4);
INSERT INTO ARBITRO VALUES(38,39,1);
INSERT INTO ARBITRO VALUES(39,NULL,1);
INSERT INTO ARBITRO VALUES(40,42,1);
INSERT INTO ARBITRO VALUES(41,42,3);
INSERT INTO ARBITRO VALUES(42,NULL,3);

-- CONSULTAS

-- Quantos cartões amarelos tem cada jogador da seleção brasileira? (listar o nome e o numero de cartoes).
-- Quantas pessoas existem de cada nacionalidade? (listar o nome da nacionalidade e o numero de pessoas).
-- Qual foi a primeira confederação a ser fundada? Qual sua sigla?
-- Qual selecao relaizou o maior numero de horas de treino?
-- Qual o estadio com maior capacidade de cada pais? (listar o nome do pais, o nome do estadio e a capacidade)
-- Qual patrocinador patrocina mais selecoes? (liste o nome do patrocinador e o numero de selecoes que ele patrocina)
-- Qual selecao realizou o maior numero de gols até o dia D? (escolha uma data, liste o nome da selecao e o numero de gols)
-- Quais selecoes competiram na copa de 2014? 
-- Qual confederacao futebolistica a selecao brasileira faz parte? Qual o nome do presidente? 
-- Qual selecao obteve o maior numero de cartoes vermelhos?
-- Qual a media de gols por jogo durante toda a copa?
-- Qual a media de cartoes amarelos e cartoes vermelhos por grupo na copa de 2014?














