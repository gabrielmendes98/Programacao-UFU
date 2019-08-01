pot2' :: Integer -> Integer
pot2' n
  |n==0 = 1
  |otherwise = 2*pot2' (n-1)

fatDuplo 1 = 1
fatDuplo 2 = 2
fatDuplo n = fatDuplo (n-2) * n

prodIntervalo m n 
   |m==n = m
   |otherwise = (prodIntervalo (m+1) n) * m

fat' n = prodIntervalo 1 n

soma x 0 = x
soma x y = soma (succ x) (y-1)

subt x 0 = x
subt x y = subt (pred x) (y-1)

potencia x 0 = 1
potencia x y = x*potencia x (y-1)

qer x y = qer' x y 0
qer' 0 y n = (n,0)
qer' x y n = if x>y then qer' (x-y) y (n+1) else (n,x)

mdc a b = if b==0 then a else if b>0 then mdc b (mod a b) else mdc a (-b)

fib x = fib x 1
fib' 1 1 = 1
fib' 2 1 = 1
fib' x n = fib' (x-1) (n+x) + fib (x-2) 