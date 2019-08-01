CREATE SCHEMA locadora;
SET search_path TO locadora;
SET datastyle TO 'DMY';

CREATE SEQUENCE cliente_num_seq;

CREATE TABLE CLIENTE (
	numcliente INTEGER DEFAULT nextval('cliente_num_seq') NOT NULL,
	nome VARCHAR(50) NOT NULL,
	endereco VARCHAR(50) NOT NULL,
	foneres VARCHAR(20) NOT NULL,
	fonecel VARCHAR(20) NOT NULL,
	CONSTRAINT PK_CLIENTE
		PRIMARY KEY (numcliente)
);

CREATE SEQUENCE ator_cod_seq;

CREATE TABLE ATOR (
	cod INTEGER DEFAULT nextval('ator_cod_seq') NOT NULL,
	datanasc DATE NOT NULL,
	nacionalidade VARCHAR(50) NOT NULL,
	nomereal VARCHAR(50) NOT NULL,
	nomeartistico VARCHAR(50) NOT NULL,
	CONSTRAINT PK_ATOR
		PRIMARY KEY (cod)
);

CREATE SEQUENCE filme_num_seq;

CREATE TABLE FILME (
	numfilme INTEGER DEFAULT nextval('filme_num_seq') NOT NULL,
	titulo_original VARCHAR(50) NOT NULL,
	titulo_pt VARCHAR(50) NOT NULL,
	duracao INTEGER NOT NULL,
	data_lancamento DATE NOT NULL,
	direcao VARCHAR(50) NOT NULL,
	categoria VARCHAR(50) CONSTRAINT categorias CHECK (categoria = 'drama' OR categoria = 'romance' OR categoria = 'acao' OR categoria = 'comedia'),
	classificacao INTEGER NOT NULL,
	CONSTRAINT PK_FILME
		PRIMARY KEY (numfilme),
	CONSTRAINT FK_FILME
		FOREIGN KEY (classificacao) REFERENCES CLASSIFICACAO(cod)
);

CREATE TABLE CLASSIFICACAO (
	cod INTEGER NOT NULL,
	nome VARCHAR(30) CONSTRAINT nomes CHECK (nome = 'super lancamento' OR nome = 'lancamento' OR nome = 'acervo'),
	preco FLOAT NOT NULL,
	CONSTRAINT PK_CLASSIFICACAO
		PRIMARY KEY (cod)
);

CREATE TABLE MIDIA (
	numfilme INTEGER NOT NULL,
	numero INTEGER NOT NULL,
	tipo VARCHAR(10) CONSTRAINT tipos CHECK (tipo = 'DVD' OR tipo = 'blu-ray'),
	CONSTRAINT PK_MIDIA
		PRIMARY KEY (numfilme, numero, tipo),
	CONSTRAINT FK_MIDIA
		FOREIGN KEY (numfilme) REFERENCES FILME(numfilme)
);


















