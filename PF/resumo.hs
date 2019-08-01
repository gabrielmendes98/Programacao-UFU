--definindo tipo algebrico
data Dia = Dom | Seg | Ter | Qua |
 Qui | Sex | Sab deriving (Eq, Show, Read)

--definindo tipo cor como instancia da classe eq
data PontoCor = Pt Double Double Cor
instance Eq PontoCor where
	(Pt x1 y1 c1) == (Pt x2 y2 c2) = (x1==x2)&&(y1==y2)&&(c1==c2)

--arvore binaria como instancia de Eq
data ArvBin a = Vazia | No (ArvBin a) a (ArvBin a)
instance (Eq a) => Eq (ArvBin a) where
	Vazia == Vazia=True
	(No e1 x1 d1) == ( No e2 x2 d2) = x1==x2 && e1==e2 &&d1==d2
	 _ == _=False

--definir soma e subtracao de complexos
data Complexo a = Complexo (a,a) deriving (Eq,Show)
instance Num Complexo where
    (+) (Complexo (a1,b1)) (Complexo (a2,b2)) = Complexo (a1+a2,b1+b2)
    (-) mesma coisa
    
--TAD
	--implementando o tipo pilha
module Stack (Stack, push, pop, top, empty, isEmpty) where

data Stack a = Stk [a]

push::a->Stack a->Stack a
push x (Stk xs) = Stk (x:xs)

pop::Stack a -> Stack a
pop (Stk(_:xs)) = Stk xs
pop _ = error "Stack.pop: empty stack"

top::Stack a -> a
top(Stk (x:_)) = x
top _ = error "Stack.top: empty stack"

empty::Stack a
empty = Stk []

isEmpty::Stack a -> Bool
isEmpty (Stk []) = True
isEmpty (Stk _) = False

 	-- em outro arquivo deseja-se obter o numero de elementos de uma pilha
 import Stack
 size::Stack a -> Int
 size s | isEmpty s = 0
        | otherwise = 1 + size (pop s)

--Exemplo de programa com IO
module Main (main) where
import System.IO (stdout,hSetBuffering,BufferMode(NoBuffering))
main::IO()
main = do hSetBuffering stdout NoBuffering
                 putStrLn "Digite uma sequencia de numeros para serem somados (0 para sair)"
                 soma <- leESoma 0
                 putStrLn (show soma)

leESoma total = do  n<-readLn
                    if n == 0 then return total
                    else leESoma (total+n)

--le ou escreve em arquivo
import System.IO

escreveDados :: String -> IO ()
escreveDados f = 
     do
        putStrLn "Escrevendo em arquivo ..."
        h <- openFile f WriteMode
        escreveDadosDeArquivo 5 h
        hClose h

escreveDadosDeArquivo :: Int -> Handle -> IO ()
escreveDadosDeArquivo n h
  | n == 0 = return ()
  | otherwise =
       do
          putStr "Digite um valor:"
          l <- getLine
          hPutStrLn h l
          escreveDadosDeArquivo (n-1) h

leDados :: String -> IO ()
leDados f = 
     do
        h <- openFile f ReadMode
        leDadosDeArquivo h
        hClose h

leDadosDeArquivo :: Handle -> IO ()
leDadosDeArquivo h =
   do
     x <- hIsEOF h
     if x
     then return ()
     else
       do
        y <- hGetLine h
        putStrLn y
        leDadosDeArquivo h

--copia dados de um arquivo pro outro
module CopyArq where
main::IO ()
main = do putStr "Digite o nome do arquivo de entrada: "
                 ifile <- getLine
        	 putStr "Digite o nome do arquivo de sa´ıda: "
          	 ofile <- getLine
          	 s <- readFile ifile
          	 writeFile ofile s

--computacoes que podem falhar
data Maybe a = Nothing | Just a
instance Monad Maybe where
	return =Just
	Nothing >>=f = Nothing
	Just x>>=f = f x

--exemplo de monada
lookup' ::Eq a => a -> [(a,b)] -> Maybe b
lookup' x [] = Nothing
lookup' x ((y,v) :ys) |x==y =Just v
                      |otherwise = lookup' x ys

	--monada
lookup2 :: String->String->Maybe(String,String)
lookup2 a b = lookup' a agenda>>= \x ->
              lookup' b agenda>>= \y ->
              return (x,y)

	--do
lookup2' :: String->String->Maybe(String,String)
lookup2' a b = do x <- lookup' a agenda
                  	    y <- lookup' b agenda
                            return (x,y)

--expressoes aritmeticas
data Exp = Cte Integer 
           | Som Exp Exp 
           | Sub Exp Exp 
           | Mul Exp Exp 
           | Div Exp Exp 
           deriving (Read, Show)

	--exemplo de uso
expOk = Mul (Div (Cte 73) (Som (Cte 3) (Cte 3))) (Cte 8)
expProblema = Som (Div (Cte 73) (Sub (Cte 3) (Cte 3))) (Cte 8)

	--avalia expressao
avalia :: Exp->Integer
avalia (Cte x) = x
avalia (Som a b) = avalia a+avalia b
avalia (Sub a b) = avalia a-avalia b
avalia (Mul a b) = avalia a*avalia b
avalia (Div a b) = div (avalia a) (avalia b)

--calculo lambda exemplo
media :: Curso->Float
media l = (/) (sum (map (\(_,_,n)->n) l))
    	    (fromIntegral (length l))


--manipulando arquivos
geraRecibo::ListaDeCodigos->IO()
geraRecibo l = do putStrLn ""
                  putStrLn "Supermercado Qlegal"
                  geraRecibo' l 0


geraRecibo'::ListaDeCodigos->Int->IO()
geraRecibo' [] total = do putStrLn (formataTotal total)
                          return ()
geraRecibo' (x:xs) total = do hSetBuffering stdout NoBuffering
                              h <- openFile "listaProdutos.txt" ReadMode
                              t <- printaRecibo h x total
                              hClose h
                              geraRecibo' xs t

printaRecibo::Handle -> Int -> Int ->  IO Int
printaRecibo h x total = do 
                             y <- hIsEOF h
                             if y
                               then do
                                      return total
                                else
                                 do
                                   y <- hGetLine h
                                   if (x==pegaCod (read y)) then do putStr (formataLinha (retornaNP (read y)))
                                                                    return (total+retornaPreco (read y))
                                    else
                                        printaRecibo h x total

retornaPreco (Produto a b c) = c