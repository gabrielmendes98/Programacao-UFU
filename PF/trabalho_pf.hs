espacoBranco :: [Char]
espacoBranco = ['\n','\t',' ']

--a
pertence :: Char -> [Char] -> Bool
pertence x [] = False
pertence x (h:t) = if x==h then True else pertence x t

--b
devolvePalavra :: String -> String
devolvePalavra [] = []
devolvePalavra (x:xs) = if pertence x espacoBranco then [] else [x] ++ devolvePalavra xs

--c
removePalavra :: String -> String
removePalavra [] = []
removePalavra (x:xs) = if pertence x espacoBranco then (x:xs) else removePalavra xs

--d
removaEspaco :: String -> String
removaEspaco [] = []
removaEspaco (x:xs) = if pertence x espacoBranco then xs else removaEspaco xs

--e
type Palavra = String
obtemPalavras :: String -> [Palavra]
obtemPalavras [] = []
obtemPalavras str = [str2] ++ obtemPalavras xs where xs = removaEspaco (str3)
                                                     str2 = devolvePalavra str
                                                     str3 = removePalavra str

--f
--versao 1
type Linha = [Palavra]
obtemLinha :: Int -> [Palavra] -> Linha
obtemLinha n [] = []
obtemLinha n (x:xs) = if (length x)>n then [] else if n<=0 then [] else [x] ++ obtemLinha n2 xs where n2 = n - (length x + 1)
{-
--versao 2 
type Linha = [Palavra]
obtemLinha :: Int -> [Palavra] -> Linha
obtemLinha n [] = []
obtemLinha n (x:xs) = if n<=0 then [] else [kx] ++ obtemLinha n2 xs where n2 = n - (length x + 1)
                                                                          kx = take n x
-}

--Responda: por que o resto da linha é comp – (length p + 1)?
--Porque é o tamanho de p + o \n para saltar de linha

--g
removeLinha :: Int -> [Palavra] -> [Palavra]
removeLinha n [] = []
removeLinha n l =  disjuntas ls l where ls = obtemLinha n l

removeElem e (x:xs) = if e == x then xs else x:removeElem e xs

disjuntas [] l1 = l1
disjuntas (x:xs) l1 = if elem x l1 then disjuntas xs (removeElem x l1) else disjuntas xs l1

--h
obtemLinhas :: [Palavra] -> [Linha]
obtemLinhas [] = []
obtemLinhas l = [l1]++obtemLinhas l2 
                where 
                l1 = obtemLinha tamLinha l
                l2 = removeLinha tamLinha l

tamLinha :: Int
tamLinha = 5

--i
geraLinhas :: String -> [Linha]
geraLinhas [] = []
geraLinhas str = [take tamLinha str]:(geraLinhas str2) where str2 = removeNPrimeiros tamLinha str

removeNPrimeiros :: Int->String->String
removeNPrimeiros 0 l = l
removeNPrimeiros n [] = []
removeNPrimeiros n l = removeNPrimeiros (n-1) xs where xs = removeElem (head l) l

--j
juntaLinhas :: [Linha] -> String
juntaLinhas l = concat s where s = concat l