--1 – Definir a função triplo que calcula o triplo do seu argumento.
triplo x = 3*x

--2 – Definir a função maiorDeTres que dados três argumentos devolve o maior.
maiorDeDois :: Int->Int->Int
maiorDeDois x y |x>=y = x
                |x<y  = y

maiorDeTres :: Int->Int->Int->Int
maiorDeTres x y z = maiorDeDois x k where k = maiorDeDois y z

--tamanho de uma lista
tamanho :: [Int]->Int
tamanho [] = 0
tamanho (x:xs) = tamanho xs + 1

--3 – Definir a função somatório que dado um valor inteiro positivo n devolva o somatório
--somatorio x = y where y=sum [1..x]
somatorio 1 = 1
somatorio n = somatorio (n-1) + n

--4 – Definir a função nEsimoTermoPA que dados o primeiro termo, a razão de uma progressão aritmética e n devolva o valor do n-ésimo termo.
--nEsimoTermoPA x1 r n = last (take n [x1,(r+1)..])
nEsimoTermoPA x1 r 1 = x1
nEsimoTermoPA x1 r n = nEsimoTermoPA x1 r (n-1) + r

--5 – Construir a função nEsimoTermoPG
nEsimoTermoPG x1 r 1 = x1
nEsimoTermoPG x1 r n = nEsimoTermoPG x1 r (n-1) * r

--6 – Definir uma função que devolve a soma dos n primeiros termos de uma progressão aritmética.
--somaDosNPrimeirosPA x1 r n = sum (take n [x1,(r+1)..])
somaDosNPrimeirosPA x1 r 1 = x1
somaDosNPrimeirosPA x1 r n = somaDosNPrimeirosPA x1 r (n-1) + nEsimoTermoPA x1 r n

--7 – Definir uma função que devolve a soma dos n primeiros termos de uma progressão geométrica.
somaDosNPrimeirosPG x1 r 1 = x1
somaDosNPrimeirosPG x1 r n = somaDosNPrimeirosPG x1 r (n-1) + nEsimoTermoPG x1 r n

--8 – Definir uma função que devolve o n-ésimo termo de uma seqüência de Fibonacci cujos dois primeiros termos sejam 1 e 1.
fib 1 = 1
fib 2 = 1
fib n = fib(n-1) + fib(n-2)

--9 – Construir uma função que informa se um determinado ano é bissexto.
bissexto x = if mod x 4 == 0 && not(mod x 100 == 0) then True
             else if mod x 400 == 0 then True
             else False

--10 – Definir uma função que informa se um dado número inteiro positivo é primo.
{-
primo :: Int -> Bool
primo x  = not(temDivisor x (x-1))

temDivisor :: Int -> Int -> Bool
temDivisor n 1 = False
temDivisor n n2 = 
   if n2 == 0 then False 
   else 
     if (mod n n2) == 0 then True 
     else temDivisor n (n-1)
-}

--11 – Construir um predicado (função que devolve um valor booleano) que, dado um caractere, retorne o valor verdade se este for uma letra maiúscula.
ehMaiuscula :: Char -> Bool
ehMaiuscula c = elem c ['A'..'Z']

--12 - Construir um predicado que, dado um caractere, retorne o valor verdade se este for uma letra minúscula.
ehMinuscula :: Char -> Bool
ehMinuscula c = elem c ['a'..'b']

--13 - Construir um predicado que, dado um caractere, retorne o valor verdade se este for um dígito.
{-
ehDigito :: Int -> Bool
ehDigito x = elem x []
-}

--14 – construir uma função que, dado uma cadeia de caracteres (String) e um número inteiro n forma uma nova cadeia repetindo n vezes a cadeia dada.
repete str n = take (n*length str)(cycle str)

--15 – definir uma função unária que, dado n ≥ 0 devolve uma cadeia com n espaços em branco.
repeteEspaco n = take n (cycle " ")

--16 - Construir a função que, dado um valor inteiro n e uma cadeia, insere brancos até que a cadeia resultante tenha tamanho n. 
insere_brancos n str = repeteEspaco (n-length str) ++ str

--17 - Definir uma função de 3 argumentos inteiros que devolva o par formado pelo menor e maior elementos.
maxEmin x y z = (menorDeTres x y z, maiorDeTres x y z)

menorDeDois x y | x >= y = y
                | y > x  = x

menorDeTres x y z = menorDeDois (menorDeDois x y) z

--18 - Definir uma função de dois valores inteiros que devolva o maior divisor comum destes números.
mdc a b = if a==b then a else if b>a then mdc b a else mdc (a-b) b

--19 – Definir uma função de 3 argumentos inteiros que devolva como valor uma tupla formada pelos três elementos em ordem crescente.
--ordena x y z

--20 - Construa uma função que, dados dois pontos, devolva a reta formada por eles.
--

--21
--

--duvida nos exercicios 10, 13 e do 19 até 23