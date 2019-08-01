---------------------- 1 ----------------------
SELECT *
FROM PRODUTO


CREATE OR REPLACE FUNCTION audit_product_price()
RETURNS trigger AS $$ BEGIN
RAISE NOTICE 'product_id = %, old_price = %, new_price =
%', old.codprod, old.valunit, new.valunit ;
RAISE NOTICE 'A redução de preço é de mais de 25
porcento';
-- insert row into the product_price_audit table
INSERT INTO product_price_audit (product_id, old_price,
new_price) VALUES (old.codprod, old.valunit,
new.valunit);
RETURN NULL; -- sempre deve ter um retorno
END $$ language 'plpgsql';

CREATE TRIGGER before_product_price_update
BEFORE UPDATE OF valunit ON produto
FOR EACH ROW WHEN (new.valunit < old.valunit * 0.75)
EXECUTE PROCEDURE audit_product_price();


UPDATE PRODUTO 
SET valunit = 0.05
WHERE codprod = 22

CREATE TABLE product_price_audit (
product_id INTEGER
CONSTRAINT price_audit_fk_products
REFERENCES produto(codprod),
old_price NUMERIC(5, 2),
new_price NUMERIC(5, 2)
);

select *
from vendedor;

update vendedor set salfixo = 2850 where codvend = 11;

create table auditoria_salario (
	codvend integer not null,
	salanterior float,
	salnovo float,
	dataalt date not null,
	constraint fk_auditoriasalario
		foreign key (codvend) references vendedor(codvend)
);

select * from auditoria_salario

CREATE OR REPLACE FUNCTION auditoria_sal_change()
RETURNS trigger AS $$ BEGIN
INSERT INTO auditoria_salario (codvend, salanterior,
salnovo, dataalt) VALUES (new.codvend, old.salfixo,
new.salfixo, current_timestamp);
RETURN NULL; -- sempre deve ter um retorno
END $$ language 'plpgsql';

CREATE TRIGGER auditoria_change
BEFORE UPDATE OF salfixo ON vendedor
EXECUTE PROCEDURE auditoria_sal_change();

---------------------- 2 A ----------------------
create table auditoria_salario (
	codvend integer NOT NULL,
	salanterior float,
	salnovo float,
	--dataalt date not null,
	constraint fk_auditoriasalario
		foreign key (codvend) references vendedor(codvend)
);

select * from auditoria_salario

CREATE OR REPLACE FUNCTION auditoria_sal_change()
RETURNS trigger AS $$ BEGIN
INSERT INTO auditoria_salario (codvend, salanterior,
salnovo) VALUES (old.codvend, old.salfixo,
new.salfixo);
RETURN NULL; -- sempre deve ter um retorno
END $$ language 'plpgsql';

CREATE TRIGGER auditoria_change
BEFORE UPDATE OF salfixo ON vendedor
FOR EACH ROW WHEN (new.salfixo >= old.salfixo)
EXECUTE PROCEDURE auditoria_sal_change();

CREATE OR REPLACE FUNCTION aumenta_sal_empregado()
RETURNS VOID AS $$ BEGIN
	UPDATE vendedor	
		SET salfixo = salfixo*1.05
	WHERE faixacomis = 'A';
	UPDATE vendedor	
		SET salfixo = salfixo*1.10
	WHERE faixacomis = 'B';
	UPDATE vendedor	
		SET salfixo = salfixo*1.15
	WHERE faixacomis = 'C';
END $$ language 'plpgsql';


SELECT aumenta_sal_empregado();

select *
from auditoria_salario


---------------------- 2 C ----------------------
CREATE OR REPLACE FUNCTION insere_item_pedido(INTEGER N,INTEGER C,INTEGER Q)
RETURNS trigger AS $$ BEGIN
	INSERT INTO ITEMPED (NUMPED, CODPROD, QUANT)
	VALUES (N, C, Q);
	RETURN NULL; -- sempre deve ter um retorno
END $$ language 'plpgsql';

CREATE TRIGGER checaPedido
BEFORE INSERT OF NUMPED ON ITEMPED
FOR EACH ROW WHEN (COUNT(NUMPED.ITEMPED) < 10)
EXECUTE PROCEDURE insere_item_pedido(INTEGER N,INTEGER C,INTEGER Q);

