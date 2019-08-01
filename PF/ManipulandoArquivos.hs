{-
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
-}

{-
module CopyArq where
main::IO ()
main = do putStr "Digite o nome do arquivo de entrada: "
          ifile <- getLine
          putStr "Digite o nome do arquivo de sa´ıda: "
          ofile <- getLine
          s <- readFile ifile
          writeFile ofile s
-}

module Main (main) where
main::IO()
main = do putStrLn "Digite o nome do arquivo"
          f <- getLine
          putStrLn "Digite o que deseja escrever no arquivo:"
          e <- getLine
          appendFile f e