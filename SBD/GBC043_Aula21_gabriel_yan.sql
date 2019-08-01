/* GABRIEL MENDES DE SOUZA SANTIAGO
   YAN LUCAS DAMASCENO DIAS */

/* 1) Qual o nome real em ordem DESC de nome e a data de nascimento dos atores que estrelam os filmes da locadora.*/
SELECT nomereal,datanasc 
FROM ATOR 
ORDER BY nomereal DESC;

/*
"Zacharius Knight Galifianakis"	"1969-10-01"
"William Bradley Pitt"	"1963-12-18"
"Walter Bruce Willis"	"1955-03-19"
"Shelley Alexis Duvall"	"1949-07-07"
"Scarlett Ingrid Johansson"	"1984-11-22"
"Samuel Leroy Jackson"	"1948-12-21"
"Russel Ira Crowe"	"1964-04-07"
"Robert John Downey Jr."	"1965-04-04"
"Philip Anthony Mair Heald"	"1944-08-25"
"Philip Anthony Hopkins"	"1937-12-31"
"Mireille Enos"	"1975-09-22"
"Matthew Chandler Fox"	"1966-07-14"
"Marlon Brando Jr."	"1923-04-03"
"Mark Alan Ruffalo"	"1967-12-22"
"Margaret Louise Comingore"	"1913-08-24"
"Malcolm John Taylor"	"1943-06-13"
"Leonardo Wilhelm DiCaprio"	"1974-11-11"
"Joseph Peter Pantoliano"	"1951-09-12"
"Joseph Leonard Gordon-Levitt"	"1981-02-17"
"Joseph Cheshire Cotten"	"1905-05-15"
"John Joseph Travolta"	"1954-02-18"
"John Joseph Nicholson"	"1937-04-22"
"James Edmund Caan"	"1940-03-26"
"Hugh Michael Jackman"	"1968-10-12"
"Guy Edward Peace"	"1967-10-05"
"Francis Finlay"	"1926-08-06"
"Eric Marlon Bishop"	"1967-12-13"
"Emilia Lydia Rose Fox"	"1964-07-31"
"Ellen Philpotts-Page"	"1987-02-21"
"Edward Paul Helms"	"1974-01-24"
"Daniel Michae DeVito Jr."	"1944-11-17"
"Christopher Allen Lloyd"	"1938-10-22"
"Christoph Waltz"	"1956-10-04"
"Carrie-Anne Moss"	"1967-08-21"
"Bradley Charles Cooper"	"1975-01-05"
"Bejamin Sherman Crothers"	"1910-05-23"
"Amanda Michelle Seyfried"	"1985-12-03"
"Alicia Christian Foster"	"1962-11-19"
"Alfredo James Pacino"	"1940-04-25"
"Alan Clarke"	"1947-04-26"
"Agnes Robertson Moorehead"	"1900-12-06"
"Adrienne Riccoboni"	"1930-11-13"
"Adrien Brody"	"1973-04-14" */

/* 2) Qual o nome real de atores que iniciam com a letra 'S'.  */
SELECT nomereal FROM ATOR WHERE nomereal LIKE 'S%';

/*"Scarlett Ingrid Johansson"
"Samuel Leroy Jackson"
"Shelley Alexis Duvall"*/

/* 3) Qual é o nome real e artístico dos atores que atuaram no filme 'Memento'  */
SELECT nomereal, nomeartistico 
FROM ATOR, ESTRELA, FILME
WHERE ATOR.cod = ESTRELA.codator and ESTRELA.numfilme = FILME.numfilme and FILME.titulo_original = 'Memento';

/*"Guy Edward Peace"	"Guy Pearce"
"Carrie-Anne Moss"	"Carrie-Anne Moss"
"Joseph Peter Pantoliano"	"Joe Pantoliano"*/

/* 4) Quais os títulos e as categorias de todos os filmes alugados pelo cliente 'João José da Silva' */
SELECT titulo_original, categoria
FROM FILME, CLIENTE, EMPRESTIMO
WHERE FILME.numfilme = EMPRESTIMO.numfilme and CLIENTE.numcliente = EMPRESTIMO.cliente and CLIENTE.nome = 'João José da Silva';

/*"The Godfather"	"Crime/Drama"
"The Silence of the Lambs"	"Crime/Drama/Thriller"
"Django Unchained"	"Aventura/Velho-Oeste"*/

/* 5) Quais os títulos dos filmes alugados entre '12/10/2012' e '14/06/2013'. */
SELECT DISTINCT titulo_original
FROM FILME, EMPRESTIMO
WHERE FILME.numfilme = EMPRESTIMO.numfilme and
EMPRESTIMO.dataret >= '12/10/2012' and
EMPRESTIMO.dataret <= '14/06/2013';

/*"A Clockwork Orange"
"Citizen Kane"
"Django Unchained"
"Inception"
"Memento"
"Over Flew Over The Cuckoos Nest"
"Pulp Fiction"
"The Avengers"
"The Godfather"
"The Hangover Part III"
"The Pianist"
"The Shining"
"The Silence of the Lambs"*/

/* 6) Qual o nome real (em ordem alfabética) de todos os atores que atuaram em filmes alugados pelo cliente 'João José da Silva' */
SELECT DISTINCT ATOR.nomereal
FROM FILME, ATOR, CLIENTE, ESTRELA, EMPRESTIMO
WHERE CLIENTE.nome = 'João José da Silva' and
CLIENTE.numcliente = EMPRESTIMO.cliente and
EMPRESTIMO.numfilme = FILME.numfilme and
ESTRELA.numfilme = FILME.numfilme and
ESTRELA.codator = ATOR.cod
ORDER BY ATOR.nomereal ASC;

/*"Alfredo James Pacino"
"Alicia Christian Foster"
"Christoph Waltz"
"Eric Marlon Bishop"
"James Edmund Caan"
"Leonardo Wilhelm DiCaprio"
"Marlon Brando Jr."
"Philip Anthony Hopkins"
"Philip Anthony Mair Heald"*/

/* 7) Qual é a quantidade de filmes alugados antes do dia '12/10/2012' */
SELECT COUNT(FILME.numfilme)
FROM FILME, EMPRESTIMO
WHERE FILME.numfilme = EMPRESTIMO.numfilme and
EMPRESTIMO.dataret <= '12/10/2012';

/*"4"*/

/* 8) Qual a quantidade de filmes de cada categoria a locadora possui (listar o nome da categoria e a quantidade) */
SELECT categoria, COUNT(categoria)
FROM FILME
GROUP BY categoria
ORDER BY categoria;

/*"Ação"	"1"
"Ação/Aventura/Mistério"	"1"
"Ação/Drama/Terror"	"1"
"Aventura/Velho-Oeste"	"1"
"Biografia/Drama/História"	"1"
"Comédia"	"1"
"Crime/Drama"	"1"
"Crime/Drama/Ficção Científica"	"1"
"Crime/Drama/Thriller"	"2"
"Drama"	"1"
"Drama/Mistério"	"1"
"Drama/Musical/Romance"	"1"
"Mistério/Thriller"	"1"
"Terror/Mistério"	"1"*/

/* 9) Quantos filmes da locadora cada ator estrelou (listar a quantidade juntamente com o nome artístico dos atores em ordem alfabética) */
SELECT ATOR.nomeartistico, COUNT(ESTRELA.codator)
FROM FILME, ESTRELA, ATOR
WHERE FILME.numfilme = ESTRELA.numfilme and 
ATOR.cod = ESTRELA.codator
GROUP BY ATOR.nomeartistico
ORDER BY ATOR.nomeartistico ASC;

/*"Adrien Brody"	"1"
"Adrienne Corri"	"1"
"Agnes Moorehead"	"1"
"Al Pacino"	"1"
"Amanda Seyfried"	"1"
"Anthony Heald"	"1"
"Anthony Hopkins"	"1"
"Brad Pitt"	"1"
"Bradley Cooper"	"1"
"Bruce Willis"	"1"
"Carrie-Anne Moss"	"1"
"Christoph Waltz"	"1"
"Christopher Lloyd"	"1"
"Danny DeVito"	"1"
"Dorothy Comingore"	"1"
"Ed Helms"	"1"
"Ellen Page"	"1"
"Emilia Fox"	"1"
"Frank Finlay"	"1"
"Guy Pearce"	"1"
"Hugh Jackman"	"1"
"Jack Nicholson"	"2"
"James Caan"	"1"
"Jamie Foxx"	"1"
"Jodie Foster"	"1"
"Joe Pantoliano"	"1"
"John Travolta"	"1"
"Joseph Cotten"	"1"
"Joseph Gordon-Levitt"	"1"
"Leonardo DiCaprio"	"2"
"Malcolm McDowell"	"1"
"Mark Ruffalo"	"1"
"Marlon Brando"	"1"
"Matthew Fox"	"1"
"Mireille Enos"	"1"
"Robert Downey Jr."	"1"
"Russel Crowe"	"1"
"Samuel L. Jackson"	"1"
"Scarlett Johansson"	"1"
"Scatman Crothers"	"1"
"Shelley Duvall"	"1"
"Warren Clarke"	"1"
"Zach Galifianakis"	"1"*/

/* 10) Qual é a data de lançamento mais recente entre os filmes disponíveis na locadora */
SELECT MAX(FILME.data_lancamento)
FROM FILME;

/*"2013-06-21"*/

/* 11) Qual é o título original e a categoria do filme que possui a data de lançamento mais antiga da locadora*/
SELECT FILME.titulo_original, FILME.categoria
FROM FILME
WHERE FILME.data_lancamento = (SELECT MIN(FILME.data_lancamento) FROM FILME);

/*"Citizen Kane"	"Drama/Mistério"*/


/* 12) Quanto o cliente 'João José da Silva' gastou na locadora em empréstimos até hoje */
SELECT SUM(EMPRESTIMO.valor_pg)
FROM EMPRESTIMO, CLIENTE
WHERE CLIENTE.nome = 'João José da Silva' and 
CLIENTE.numcliente = EMPRESTIMO.cliente;

/*"63735"*/

/* 13) Qual a duração média dos filmes da classificação ACERVO  */
SELECT AVG(FILME.duracao)
FROM FILME, CLASSIFICACAO
WHERE FILME.classificacao = CLASSIFICACAO.cod and CLASSIFICACAO.nome = 'Acervo';

/*"140.7500000000000000"*/

/* 14) Quais são os nomes das classificações cujo total de filmes do acervo da locadora é maior do que 5 */
SELECT CLASSIFICACAO.nome
FROM FILME, CLASSIFICACAO, MIDIA
WHERE FILME.classificacao = CLASSIFICACAO.cod and
MIDIA.numfilme = FILME.numfilme
GROUP BY CLASSIFICACAO.nome
HAVING COUNT(MIDIA.numfilme) > 5;
/*
"Acervo"
"Super-lançamento"*/


/* 15) Quais são os nomes artísticos dos atores que estrelaram mais do que 3 filmes dos disponíveis no acervo da locadora. */
SELECT ATOR.nomeartistico
FROM FILME, ESTRELA, ATOR
WHERE FILME.numfilme = ESTRELA.numfilme and 
ATOR.cod = ESTRELA.codator
GROUP BY ATOR.nomeartistico
HAVING (COUNT (ESTRELA.codator)) > 3;

/* */

/* 16) Quais são os nomes artísticos dos atores que estrelaram mais do que 2 filmes dos disponíveis no acervo da locadora com a classificação LANÇAMENTO. */
SELECT ATOR.nomeartistico
FROM FILME, ESTRELA, ATOR, CLASSIFICACAO
WHERE FILME.numfilme = ESTRELA.numfilme and 
ATOR.cod = ESTRELA.codator and
FILME.classificacao = CLASSIFICACAO.cod and
CLASSIFICACAO.nome = 'Lançamento'
GROUP BY ATOR.nomeartistico
HAVING (COUNT (CLASSIFICACAO.nome)) > 2;

/* */

/* 17) Quantas nacionalidades diferentes existem na tabela ator */
SELECT COUNT (DISTINCT ATOR.nacionalidade)
FROM ATOR;

/*"7"*/

/* 18) Qual a nacionalidade que possui o maior número de atores registrados no BD da locadora */
SELECT ATOR.nacionalidade
FROM ATOR
GROUP BY ATOR.nacionalidade
ORDER BY (COUNT(ATOR.nacionalidade)) DESC
LIMIT 1;

/*"USA"*/

/* 19) Quantos filmes o cliente Y 'João José da Silva' já alugou e devolveu */
SELECT COUNT(EMPRESTIMO.dataret) AS Alugou, COUNT(EMPRESTIMO.datedev) AS Devolveu
FROM CLIENTE, EMPRESTIMO
WHERE CLIENTE.numcliente = EMPRESTIMO.cliente and
CLIENTE.nome = 'João José da Silva';

/*"3"	"3"*/
