media3 x y z = (x+y+z)/3

maior2 :: (Int, Int) -> Int
maior2 (x,y) = if x>=y then x  else y

maior2' x y | x>=y      = x
            | otherwise = y

maior3 x y z = if x>=y && x>=z then x
               else if x>=y && x<z then z
               else if x<y && y>z then y
               else z

maior3' x y z  | x>=y && x>=z = x
               | x>=y && x>=z = x
               | x<y && y>z = y
               | otherwise = z

maior3'' :: (Int, Int, Int) -> Int
maior3'' (x,y,z) = maior2(x, maior2(y,z))


numRaizes :: Int -> Int -> Int -> Int
numRaizes a b c = if (b*b) - (4*a*c) > 0 then 2
                    else if (b*b) - (4*a*c) == 0 then 1
                    else 0