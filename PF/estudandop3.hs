{-
module Main (main) where
import System.IO (stdout,hSetBuffering,BufferMode(NoBuffering))
main::IO()
main = do   hSetBuffering stdout NoBuffering
            putStrLn "Bem-vindo ao calculo de peso ideal"
            putStr "Digite sua altura: "
            h <- getLine
            putStrLn "Digite seu sexo: M ou F"
            s <- getLine
            if (read s == "M") then putStrLn (fM (read h))
            else putStrLn (fF (read h))

fM::Float -> String
fM h = show (72.7*h-58)
fF::Float -> String
fF h = show (62.1*h-44.7)
-}

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
main::IO()
main = do   hSetBuffering stdout NoBuffering
            putStrLn "Digite as 3 notas do aluno:"
            n1 <- readLn
            n2 <- readLn
            n3 <- readLn
            let media = (n1+n2+n3)/3
            putStrLn ("Media:"++show media)
            putStr "Situacao:"
            if (media < 3) then putStrLn "Reprovado"
            else if (media< 7) then putStrLn "Exame especial"
            else putStrLn "Aprovado"
-}

{-
module Main (main) where
import System.IO (stdout,hSetBuffering,BufferMode(NoBuffering))
main::IO()
main = imprimelista [1..30]

imprimelista [] = do {putStrLn""; return()}
imprimelista (x:xs) = if mod x 2 == 0 then do { putStr (show x ++ ", "); imprimelista xs}
                      else imprimelista xs
-}

{-
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
-}

{-
module Main (main) where
import System.IO (stdout,hSetBuffering,BufferMode(NoBuffering))
main::IO()
main = do   hSetBuffering stdout NoBuffering
            putStr "Informe seu salario inicial: "
            sInicial <- readLn
            putStr "Informe o ano de contratacao: "
            anoC <- readLn
            putStr "Informe o ano atual: "
            anoA <- readLn
            let salarioAtual = calculaSAtual sInicial (anoA-anoC) 0.0150
            putStrLn ("Salario atual: " ++ show (salarioAtual))
            
calculaSAtual s 0 a = s
calculaSAtual sInicial n aumento = calculaSAtual (sInicial*(1.0+aumento)) (n-1) (aumento*2)
-}

module Main (main) where
import System.IO (stdout,hSetBuffering,BufferMode(NoBuffering))
main :: IO()
main = do   hSetBuffering stdout NoBuffering
            putStrLn "Digite dois numeros para serem somados:"
            x <- getLine
            y <- getLine
            putStrLn (show ((read x::Float) + (read y::Float)))
