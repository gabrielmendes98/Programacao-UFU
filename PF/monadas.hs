agenda :: [(String,String)]
agenda = [  ("Bob","01788 665242"),
            ("Fred","01624 556442"),
            ("Alice","01889 985333"),
            ("Jane","01732 187565") ]

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

data Exp = Cte Integer 
           | Som Exp Exp 
           | Sub Exp Exp 
           | Mul Exp Exp 
           | Div Exp Exp 
           deriving (Read, Show)

expOk = Mul (Div (Cte 73) (Som (Cte 3) (Cte 3))) (Cte 8)
expProblema = Som (Div (Cte 73) (Sub (Cte 3) (Cte 3))) (Cte 8)

avalia :: Exp->Integer
avalia (Cte x) = x
avalia (Som a b) = avalia a+avalia b
avalia (Sub a b) = avalia a-avalia b
avalia (Mul a b) = avalia a*avalia b
avalia (Div a b) = div (avalia a) (avalia b)