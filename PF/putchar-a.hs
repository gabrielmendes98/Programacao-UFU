{-
module Main (main) where
import System.IO (stdout,hSetBuffering,BufferMode(NoBuffering))
main :: IO()
main = do   hSetBuffering stdout NoBuffering
            putStr"Digite uma temperatura em Fahrenheit:"
            x <- getLine
            putStr (x ++ "°F equivale a ")
            putStrLn (show (celsius (read x)) ++ "°C")

celsius::Double->Double
celsius f = (5/9)*(f-32)
-}

{-
module Main (main) where
import System.IO (stdout,hSetBuffering,BufferMode(NoBuffering))
main :: IO()
main = do   hSetBuffering stdout NoBuffering
            putStrLn "Digite dois numeros para serem somados:"
            x <- getLine
            y <- getLine
            putStrLn (show (soma (read x) (read y)))

soma::Float->Float->Float
soma x y = x + y
-}

module Main (main) where
import System.IO (stdout,hSetBuffering,BufferMode(NoBuffering))
import Data.Char (toUpper)
main :: IO ()
main = do   hSetBuffering stdout NoBuffering
            putStr "Altura:"
            h <- readLn
            putStr "Sexo (f/m):"
            s <- getLine
            case toUpper (head s) of
                'F' -> putStrLn ("Peso ideal:"++show (62.1*h-44.7))
                'M' -> putStrLn ("Peso ideal:"++show (72.7*h-58))
                _ -> putStrLn"Sexo inválido"