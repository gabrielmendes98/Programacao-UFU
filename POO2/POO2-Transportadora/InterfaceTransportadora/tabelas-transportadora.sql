CREATE TABLE `Transportadora`.`Pedido` ( `idpedido` SERIAL NOT NULL AUTO_INCREMENT , `idcliente` INT NOT NULL , `statuspedido` VARCHAR(20) NOT NULL , `datapedido` VARCHAR(8) NOT NULL , `dataPrevistaDeEntrega` VARCHAR(8) NOT NULL , `valor` DOUBLE NOT NULL , `valorEmPontos` DOUBLE NOT NULL , `cidadeAtual` VARCHAR(30) NOT NULL , `cidadeDestino` VARCHAR(30) NOT NULL , `cidadePartida` INT(30) NOT NULL , `pesoTotal` DOUBLE NOT NULL , `toxico` BOOLEAN NOT NULL , `inflamavel` BOOLEAN NOT NULL , `radioativo` BOOLEAN NOT NULL , `liquido` BOOLEAN NOT NULL , `normal` BOOLEAN NOT NULL , `idveiculo` INT NOT NULL , PRIMARY KEY (`idpedido`)) ENGINE = InnoDB;

CREATE TABLE `Transportadora`.`Cliente` ( `idCliente` SERIAL NOT NULL AUTO_INCREMENT , `nome` VARCHAR(30) NOT NULL , `cpfOuCnpj` VARCHAR(11) NOT NULL , `tipoCliente` VARCHAR(30) NOT NULL , `pontos` DOUBLE NOT NULL , `idlocalidade` INT NOT NULL , `idpedidos` INT NOT NULL , PRIMARY KEY (`idCliente`)) ENGINE = InnoDB;

CREATE TABLE `Transportadora`.`constantesdao` ( 
 `id` SERIAL NOT NULL AUTO_INCREMENT ,
 `realPorDistanciaExpress10` DOUBLE NOT NULL ,
 `realPorDistanciaSarve` DOUBLE NOT NULL ,
 `realPorDistanciaNormal` DOUBLE NOT NULL ,
 `multiplicadorTipoRadioativoEToxico` DOUBLE NOT NULL ,
 `multiplicadorTipoInflamavel` DOUBLE NOT NULL ,
 `multiplicadorTipoNormalELiquido` DOUBLE NOT NULL ,
 `taxaConversaoReiasPontos` DOUBLE NOT NULL ,
 PRIMARY KEY (`id`)) ENGINE = InnoDB;

CREATE TABLE `Transportadora`.`Veiculo` ( 
 `idVeiculo` SERIAL NOT NULL AUTO_INCREMENT, 
 `modelo` VARCHAR(30) NOT NULL,
 `placa` VARCHAR(30) NOT NULL,
 `marca` VARCHAR(30) NOT NULL,
 `ultimaRevisao` VARCHAR(30),
 `pesoMaximo` DOUBLE NOT NULL,
 `pesoAtual` DOUBLE NOT NULL,
 `cidadeAtual` VARCHAR(30) NOT NULL,
 `idRota` INT,
 `statusVeiculo` VARCHAR(30),
 `tipoVeiculo` VARCHAR(30) NOT NULL,
 `idPedidosCarregados`INT NOT NULL,
 `toxico` BOOLEAN NOT NULL,
 `inflamavel` BOOLEAN NOT NULL,
 `radioativo` BOOLEAN NOT NULL ,
 `liquido` BOOLEAN NOT NULL,
 `normal` BOOLEAN NOT NULL
 )



