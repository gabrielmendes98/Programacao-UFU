--1. Construir uma função que dados dois inteiros a e b construa a lista dos inteiros contidos no intervalo fechado [a,b]. Quando a for igual a b, a função devolve a lista unitária [a]. Quando a > b a função deverá devolver a lista vazia.
constroi a b = if a == b then [a] else if a>b then [] else [a..b]

--2. Construir uma função que dada uma lista, devolve uma lista com os objetos repetidos
repetidos [] = []
repetidos (x:xs) = x:x:repetidos xs

--3. Construir uma função que, dado um valor inteiro, devolva a lista de todos os divisores deste número.
divisores x = divisores' x x

divisores' x 0 = []
divisores' x k = if mod x k == 0 then k:divisores' x (k-1) else divisores' x (k-1)

--4. Construir uma função que ordene uma lista de valores numéricos dados, em ordem crescente.
maior [x] = x
maior (x:y:xs) = if x>y then maior (x:xs) else maior (y:xs)

menor [x] = x
menor (x:y:xs) = if x<y then menor (x:xs) else menor (y:xs)

remove' elem [] = []
remove' elem (x:xs) = if elem == x then xs else x:remove' elem xs

ordena [] = []
ordena (x:xs) = k:ordena l where l = remove' k (x:xs)
                                 k = menor (x:xs)

--5. Repetir o exercício anterior ordenando uma lista de n-uplas segundo algum de seus campos.
menor' :: [(Integer,Integer)] -> (Integer,Integer)
menor' [x] = x
menor' (x:y:xs) = if (fst x)<(fst y) then menor' (x:xs) else menor' (y:xs)

ordena' [] = []
ordena' (x:xs) = k:ordena' l where l = remove' k (x:xs)
                                   k = menor' (x:xs)

--6. Construir uma função que receba uma lista de inteiros e os separe em duas listas: a primeira contendo os pares e a segunda contendo os ímpares. Devolver o resultado como uma lista de listas.
separa l = [[x | x<-l, even x]]++[[x | x<-l, odd x]]

--7
uniao x y = x++y

--8

--9 //quicksort
quicksort [] = []
quicksort (p:xs) = (quicksort lesser) ++ [p] ++ (quicksort greater)
    where
        lesser = filter (< p) xs
        greater = filter (>= p) xs

--10
remove elem [] = []
remove elem (x:xs) = if elem == x then remove elem xs else x:remove elem xs

removeRepetidos [] = []
removeRepetidos (x:xs) = if elem x xs then x:removeRepetidos l else x:removeRepetidos xs where l = remove x xs

--11
--a
uniao2 x y = removeRepetidos (x++y)
--b
uniao3 [] l2 = ordena l2
uniao3 (x:xs) l2 = if elem x l2 then ordena (uniao3 xs l2) else ordena (x:uniao3 xs l2) 
--c

--12
--a
l1 = [x | x<-[100..300], mod x 3 == 0]

--b
fatores n = [x | x<-[1..n], mod n x == 0]
primo x = if (length (fatores x)) /= 2 then False else True
l2 = [x | x<-[1..100], primo x]

--c
l3 = [(x,y) | x<-l1, y<-l2]

--d

--e
l5 = [((x*x) + (7*x) + 1) | x<-[0.00,0.01..1]]

--f
dec2bin :: Int -> String
dec2bin 0 = "0"
dec2bin 1 = "1"
dec2bin n = dec2bin(n `div` 2) ++ show(n `mod` 2)

l6 = [dec2bin x | x<-[0..100], length (dec2bin x) < 5 ]