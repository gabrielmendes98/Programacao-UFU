dist :: Float -> Float -> Float -> Float -> Float -> Float -> Float
dist x1 y1 z1 x2 y2 z2 = sqrt(((x2-x1)*(x2-x1))+((y2-y1)*(y2-y1))+((z2-z1)*(z2-z1)))

dist2 :: Int -> Int -> Int
dist2 x y = x-y

opp :: (Int,(Int,Int)) -> Int
opp z = if fst z==1
            then fst (snd z)+snd (snd z)
            else if fst z==2
                then fst (snd z)-snd (snd z)
                else 0

--f(x,y) = (a+1)*(a+2) where a = (x+y)/2

{-f a b c = ((-b+sqrt(d))/2*a,(-b-sqrt(d))/2*a)
        where d = b*b - 4*a*c-}

f a b c = let d = b*b - 4*a*c in ((-b+sqrt(d))/2*a,(-b-sqrt(d))/2*a)