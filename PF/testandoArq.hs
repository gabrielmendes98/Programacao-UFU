import System.IO
import System.IO (stdout,hSetBuffering,BufferMode(NoBuffering))

type Nome = String
type Preco = Int
type CodBar = Int
type BaseDeDados = [(CodBar,Nome,Preco)]
type ListaDeCodigos = [CodBar]
type Recibo = [(Nome,Preco)]

tamLinha :: Int
tamLinha = 30

data Produto = Produto CodBar Nome Preco deriving (Eq, Show, Read)

pegaCod::Produto -> CodBar
pegaCod (Produto a b c) = a

retornaNP::Produto -> (Nome,Preco)
retornaNP (Produto a b c) = (b,c)

pegaPreco::(String, Int) -> Int
pegaPreco (a, b) = b

formataCentavos :: Preco -> String
formataCentavos x = s where s = (show(div x 100)) ++ "," ++ (show(mod x 100))

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
                                                                            printaRecibo h x (total+retornaPreco (read y))
                                           else
                                                printaRecibo h x total

retornaPreco (Produto a b c) = c

formataLinha :: (Nome,Preco) -> String
formataLinha (x,y) = x ++ replicate (tamLinha - length (x++s) - 1) '.' ++ "$" ++ s ++ "\n" where s = formataCentavos y

formataTotal :: Preco -> String
formataTotal x = formataLinha("Total", x)