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

achaItem :: CodBar -> IO()
achaItem x = do hSetBuffering stdout NoBuffering
                acha "listaProdutos.txt" x



acha :: String -> CodBar -> IO()
acha base cod = do       
                  h <- openFile base ReadMode
                  k <- leDadosDeArquivo h cod
                  hClose h
                  grava k

leDadosDeArquivo :: Handle -> CodBar -> IO (Nome,Preco)
leDadosDeArquivo h cod =
   do
     x <- hIsEOF h
     if x then return ("",0)
     else
         do
            y <- hGetLine h
            if (pegaCod (read y)==cod) then return (retornaNP (read y))
            else leDadosDeArquivo h cod


pegaCod::Produto -> CodBar
pegaCod (Produto a b c) = a

retornaNP::Produto -> (Nome,Preco)
retornaNP (Produto a b c) = (b,c)

grava::(Nome,Preco) -> IO ()
grava k = appendFile "Recibo.txt" (show k ++ "\n")

fazRecibo :: ListaDeCodigos -> IO()
fazRecibo l = do if (l == []) then return ()
                 else do 
                        achaItem (head l)
                        let y = removeCabeca l
                        fazRecibo y
removeCabeca [x] = []
removeCabeca (x:xs) = xs

somaPrecosRecibo::String -> IO()
somaPrecosRecibo f = do
                        h <- openFile f ReadMode
                        preco <- lePrecos h 0
                        hClose h
                        putStrLn (formataTotal preco)

lePrecos :: Handle -> Int -> IO Int
lePrecos h p =
   do
     x <- hIsEOF h
     if x
     then return p
     else
       do
        y <- hGetLine h
        let k = pegaPreco (read y)
        lePrecos h (k+p)

pegaPreco::(String, Int) -> Int
pegaPreco (a, b) = b

formataCentavos :: Preco -> String
formataCentavos x = s where s = (show(div x 100)) ++ "," ++ (show(mod x 100))

geraRecibo::ListaDeCodigos->IO()
geraRecibo l = do hSetBuffering stdout NoBuffering
                  writeFile "Recibo.txt" ""
                  fazRecibo l
                  putStrLn ""
                  putStrLn "Supermercado Qlegal"
                  h <- openFile "Recibo.txt" ReadMode
                  printaRecibo h
                  hClose h
                  somaPrecosRecibo "Recibo.txt"

printaRecibo::Handle -> IO ()
printaRecibo h = do 
                   x <- hIsEOF h
                   if x
                   then return ()
                   else
                     do
                       y <- hGetLine h
                       putStr (formataLinha (read y))
                       printaRecibo h



formataLinha :: (Nome,Preco) -> String
formataLinha (x,y) = x ++ replicate (tamLinha - length (x++s) - 1) '.' ++ "$" ++ s ++ "\n" where s = formataCentavos y

formataTotal :: Preco -> String
formataTotal x = formataLinha("Total", x)