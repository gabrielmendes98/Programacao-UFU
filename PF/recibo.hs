type Nome = String
type Preco = Int
type CodBar = Int
type BaseDeDados = [(CodBar,Nome,Preco)]

listaDeProdutos :: BaseDeDados
listaDeProdutos =[(1234, "Oleo DoBom, 1l" , 195),
                  (4756, "Chocolate Cazzeiro, 250g" , 180), 
                  (3216, "Arroz DoBom, 5Kg", 213),
                  (5823, "Balas Pedregulho, 1Kg" , 379),
                  (4719, "Queijo Mineirim, 1Kg" , 449),
                  (6832, "Iogurte Maravilha, 1Kg" , 499),
                  (1112, "Rapadura QuebraDente, 1Kg", 80),
                  (1111, "Sal Donorte, 1Kg", 221),
                  (1113, "Cafe DoBom, 1Kg", 285),
                  (1115, "Biscoito Bibi, 1Kg", 80),
                  (3814, "Sorvete QGelo, 1l", 695)]

type ListaDeCodigos = [CodBar]
type Recibo = [(Nome,Preco)]

formataCentavos :: Preco -> String
formataCentavos x = s where s = (show(div x 100)) ++ "," ++ (show(mod x 100))

tamLinha :: Int
tamLinha = 30

formataLinha :: (Nome,Preco) -> String
formataLinha (x,y) = x ++ replicate (tamLinha - length (x++s) - 1) '.' ++ "$" ++ s ++ "\n" where s = formataCentavos y

formataLinhas :: [(Nome,Preco)] -> String
formataLinhas [] = []
formataLinhas (x:xs) = formataLinha x ++ formataLinhas xs

geraTotal :: Recibo -> Preco
geraTotal l = sum ([x | (y,x)<-l])

formataTotal :: Preco -> String
formataTotal x = formataLinha("Total", x)

formataRecibo' :: Recibo -> String
formataRecibo' [] = ""
formataRecibo' ((x,y):xs) = formataLinha (x,y) ++ formataRecibo' xs

formataRecibo :: Recibo -> String
formataRecibo l = "Supermercado QLegal\n" ++ formataRecibo' l ++ formataTotal (geraTotal l)

acha :: BaseDeDados -> CodBar -> (Nome,Preco)
acha base cod = if elem cod [x | (x,y,z) <- base] then retorna2 base cod
                else ("item desconhecido", 0)

conta (x:xs) v = if x==v then 1 else (conta xs v) + 1

retorna2 :: BaseDeDados -> CodBar -> (Nome,Preco)
retorna2 base cod = [(n,p) | (c,n,p) <- base] !! (s - 1) where s = conta [x | (x,y,z) <- base] cod

achaItem :: CodBar -> (Nome,Preco)
achaItem x = acha listaDeProdutos x

fazRecibo :: ListaDeCodigos -> Recibo
fazRecibo [] = []
fazRecibo (x:xs) = [achaItem x] ++ fazRecibo xs

geraRecibo :: ListaDeCodigos -> String
geraRecibo lc = formataRecibo(fazRecibo lc)