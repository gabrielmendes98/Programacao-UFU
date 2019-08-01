type Dia = Int
type Mes = Int
type Ano = Int
type Data = (Dia,Mes,Ano)

bissexto x = if mod x 4 == 0 && not(mod x 100 == 0) then True
             else if mod x 400 == 0 then True
             else False

numDeDiasEmCadaMesDeUmAno :: Ano -> [Int]
numDeDiasEmCadaMesDeUmAno ano =
   [31,feb,31,30,31,30,31,31,30,31,30,31]
   where feb   |bissexto ano = 29
               |otherwise = 28

numDeDias :: Data -> Int
numDeDias (dia,mes,ano) =
   dia -- dias deste mes
   + sum(take (mes-1) (numDeDiasEmCadaMesDeUmAno ano))
   + (ano-2001)*365 + (ano-2001)`div`4

nomeDoDia :: Int -> String
nomeDoDia x
   | x==0 = "Domingo"
   | x==1 = "Segunda"
   | x==2 = "Terca"
   | x==3 = "Quarta"
   | x==4 = "Quinta"
   | x==5 = "Sexta"
   | x==6 = "Sabado"

diaDaSemana :: Data -> String
diaDaSemana (dia,mes,ano) = y 
    where 
        k = numDeDias (dia,mes,ano)
        x = mod k 7
        y = nomeDoDia x
