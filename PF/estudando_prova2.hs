--lista 3
--1
{-
> (\x -> x + 3) 5
8 -certo

> (\x -> \y -> x * y + 5) 3 4
17 -certo

> map (\x -> x ^3) [2,4,6]
[8,64,216] -certo

deriv :: Fractional a => (a -> a) -> a -> a -> a
deriv f dx = \x -> (f(x + dx) - f(x)) / dx
> deriv (\x -> x*x*x) 0.0001 1
3.00030001 -certo

> (\(x,y) -> x * y^2) (3,4)
48 -certo

> (\(x,y,_) -> x * y^2) (3,4,2)
48 -certo

> map (\(x,y,z) -> x + y + z) [(3,4,2),(1,1,2),(0,0,4)]
[9,4,4] -certo

> filter (\(x,y) -> x `mod` y == 0) [(4,2),(3,5),(6,3)]
[(4,2),(6,3)] -certo

> (\xs -> zip xs [1,2,3]) [4,5,6]
[(4,1),(5,2),(6,3)] -certo

> map (\xs -> zip xs [1..]) [[4,6],[5,7]]
[[(4,1),(6,2)],[(5,1),(7,2)]] -certo

> foldr1 (+) [1,2,3]
6 -certo

> foldr1 (\x -> \y -> x + y + 7) [1,2,3,4,5]
43 -certo
-}

--2
{-
data NomeP = Nome String deriving (Show)
data SobreNomeP = SobreNome String deriving (Show)
type NomeCompleto = (NomeP,SobreNomeP)
compara (Nome n1,SobreNome s1) (Nome n2,SobreNome s2) | n1==n2 && s1==s2 = True
                                                      | otherwise = False

instance Eq NomeP where
    Nome a == Nome b = a == b

instance Eq SobreNomeP where
    SobreNome a == SobreNome b = a == b
-}

--3
{-
data Exp a = Val a -- um numero
           | Neg (Exp a)
           | Add (Exp a) (Exp a) -- soma de duas expressoes
           | Sub (Exp a) (Exp a) -- subtracao
           | Mul (Exp a) (Exp a) -- multiplicacao
           | Div (Exp a) (Exp a) -- divisao
avalia :: Fractional a => Exp a -> a
avalia (Val x) = x
avalia (Neg exp) = - (avalia exp)
avalia (Add exp1 exp2) = (avalia exp1) + (avalia exp2)
avalia (Sub exp1 exp2) = (avalia exp1) - (avalia exp2)
avalia (Mul exp1 exp2) = (avalia exp1) * (avalia exp2)
avalia (Div exp1 exp2) = (avalia exp1) / (avalia exp2)
-}

--4
data LL = Latitude Int Int Int
   | Longitude Int Int Int deriving (Eq)

instance Show LL where
   show (Latitude a b c) = "Lat " ++ show a ++"°" ++ show b ++"'"++ show c ++"''"

type PosicaoLocal = (String, LL, LL)
type Cidades = [PosicaoLocal]

c1,c2::PosicaoLocal
c1 = ("Brasilia", Latitude (-15) 46 47, Longitude 47 55 47)
c2 = ("Uberlandia", Latitude (-18) 55 07, Longitude 48 16 38)
eLat::PosicaoLocal->(String,LL)
eLat (p, (Latitude a b c), (Longitude x y z)) = (p,(Latitude a b c))

norteDe::PosicaoLocal->PosicaoLocal->Bool
norteDe (p, (Latitude a b c), (Longitude x y z)) (p2, (Latitude a2 b2 c2), (Longitude x2 y2 z2))
   | a>a2 = True
   | a==a2 && b>b2 = True
   | a==a2 && b==b2 && c>c2 = True
   | otherwise = False

lcidades::Cidades
lcidades =
   [("Rio Branco", Latitude 09 58 29, Longitude 67 48 36),
   ("Brasilia", Latitude (-15) 46 47, Longitude 47 55 47),
   ("Torres", Latitude (-29) 20 07, Longitude 49 43 37),
   ("Joao Pessoa", Latitude (-07) 06 54, Longitude 34 51 47),
   ("Uberlandia", Latitude (-18) 55 07, Longitude 48 16 38)]

abaixoEquador::Cidades->Int
abaixoEquador cidades = contaMenores graus where latitudes = devolveLatitude cidades
                                                 graus = devolveGrau latitudes

devolveLatitude lista = [y | (x,y,z) <- lista]
devolveGrau [] = []
devolveGrau ((Latitude a b c):xs) = a:devolveGrau xs
contaMenores [] = 0
contaMenores (x:xs) = if x<0 then 1+contaMenores xs else contaMenores xs

long4050 cidades = verificaLongitude lnl where lnl = retornaLongENome cidades
retornaLongENome lista = [(x,z) | (x,y,z) <- lista]
verificaLongitude [] = []
verificaLongitude ((nome,Longitude a _ _):xs) = if a>=40 && a<=50 then nome:verificaLongitude xs else verificaLongitude xs

data Talvez a = Valor a | Nada deriving (Show)
divisaoSegura :: Float -> Float -> Talvez Float
divisaoSegura x y = if y == 0 then Nada else Valor (x/y)

addPares :: [(Int,Int)] -> [Int]
addPares lista = [m+n | (m,n) <- lista]

addParesT :: [(Int,Int)] -> [Int]
addParesT lista = [m+n | (m,n) <- lista, m<n]

addParesLamb :: [(Int,Int)] -> [Int]
addParesLamb = \lista -> ([m+n | (m,n) <- lista])

addParesLambFunc = \lista -> (map somaTupla (filter menorq lista))

menorq (x,y) | x<y = True
             | otherwise = False

somaTupla (x,y) = x+y

mp f [] ys = []
mp f xs [] = []
mp f (x:xs) (y:ys) = f x y : mp f xs ys

f x y = x+y

somaQuad n = foldr1 (+) (map (^2) [1..n])

somaQuadPos lista = foldr1 (+) (map (^2) lista2) where lista2 = filter (>0) lista

misterio xs = foldr (++) [4] (map fun xs)
fun x = [x^2]