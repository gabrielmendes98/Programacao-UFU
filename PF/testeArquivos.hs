import System.IO

type Nome = String
type Preco = Int
type CodBar = Int
type BaseDeDados = [(CodBar,Nome,Preco)]

data Produto = Produto CodBar Nome Preco deriving (Eq, Show, Read)

{-
readPriceList :: String -> IO ()
readPriceList f = do     h <- openFile f ReadMode
                         y <- hGetLine h
                         let preco = pegaPreco (read y)
                         y <- hGetLine h
                         let preco2 = pegaPreco (read y)
                         hClose h
                         putStrLn (show preco)
                         putStrLn (show preco2)

pegaPreco::Produto -> Preco
pegaPreco (Produto a b c) = c
-}

{-
transforma::Produto -> (CodBar,Nome,Preco)
transforma (Produto a b c) = (a,b,c)

retornaLista :: String -> IO BaseDeDados
retornaLista f = 
     do
        h <- openFile f ReadMode
        let list = geraLista h []
        hClose h
        return list

geraLista :: Handle -> BaseDeDados -> BaseDeDados
geraLista h g =
   do
     x <- hIsEOF h
     if x
     then g
     else
       do
        y <- hGetLine h
        let k = g:transforma (read y)
        geraLista h k
        -}

readPriceList :: String -> IO (Nome,Preco)
readPriceList f = do     h <- openFile f ReadMode
                         y <- hGetLine h
                         let tupla = pegaTupla (read y)
                         hClose h
                         return (tupla)

retornaIO::(Nome,Preco) -> IO (Nome,Preco)
retornaIO (a,b) = return (a,b)

main::IO ()
main = do   if ((readPriceList "listaProdutos.txt") == (retornaIO ("", 0))) then putStrLn "Nao encontrado"
            else putStrLn (show (readPriceList "listaProdutos.txt"))

pegaPreco::Produto -> Preco
pegaPreco (Produto a b c) = c

pegaTupla::Produto->(Nome,Preco)
pegaTupla (Produto a b c) = (b,c)


