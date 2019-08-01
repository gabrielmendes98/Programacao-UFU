sucessor::Int->Int
sucessor = \x -> x+1

duasVezes::(a->a) -> a -> a
duasVezes = \f -> \x -> f (f x)

mapeia::[Int]->[Int]
mapeia [] = []
mapeia (x:xs) = duasVezes sucessor x:mapeia xs

intercala::a->[a]->[[a]]
intercala e [] = [[e]]
intercala e (x:xs) = [e:x:xs] ++ map (x:) (intercala e xs)