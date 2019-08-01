--------- 2 ----------
--a
alter table cliente add total integer;

create or replace function atualizaCliente()
returns void as $$
declare aux cliente%rowtype;
begin
	for aux in select codcli from cliente
	loop
		update cliente set total = 
			(select count(p.numped)
			from pedido p
			where p.codcli = aux.codcli)
		where codcli = aux.codcli;
	end loop;
end; $$ language 'plpgsql';

select * from atualizaCliente();
select * from cliente;
		
--b
create or replace function calculaTotal 
(in num_ped pedido.numped%type, out total_ped float)
returns float as $$
begin
	select sum(i.quant*pr.valunit) into total_ped
	from pedido p, produto pr, itemped i
	where p.numped = i.numped and
	pr.codprod = i.codprod and
	p.numped = num_ped
	group by p.numped;
end; $$ language 'plpgsql';

select calculaTotal(1489);

--c
create or replace function insere_cliente_e_vendedor
(in cod_cli cliente.codcli%type, in nome_cli cliente.nomecli%type, in endereco_cli cliente.endereco%type, in cidade_cli cliente.cidade%type, 
 in cep_cli cliente.cep%type, in uf_cli cliente.cep%type, in cgc_cli cliente.cgc%type,
 in cod_vend vendedor.codvend%type, in nome_vend vendedor.nomevend%type, 
 in sal_fixo vendedor.salfixo%type, in faixa_comis vendedor.faixacomis%type)
returns void as $$
begin
	insert into cliente values (cod_cli, nome_cli, endereco_cli, cidade_cli, cep_cli, uf_cli, cgc_cli);
	insert into vendedor values (cod_vend, nome_vend, sal_fixo, faixa_comis);
end; $$ language 'plpgsql';

select * from cliente;
select * from vendedor;

select insere_cliente_e_vendedor(1,'1','1','1','1','1','1',1,'1',1,'1');

--d
create or replace function insere_cliente
(in cod_cli cliente.codcli%type, in nome_cli cliente.nomecli%type, in endereco_cli cliente.endereco%type, in cidade_cli cliente.cidade%type, 
 in cep_cli cliente.cep%type, in uf_cli cliente.cep%type, in cgc_cli cliente.cgc%type)
returns void as $$
begin
	if cod_cli > 1000 then
		raise exception 'o codigo do cliente nao pode ser maior que 1000';
	else
		insert into cliente values (cod_cli, nome_cli, endereco_cli, cidade_cli, cep_cli, uf_cli, cgc_cli);
	end if;
end; $$ language 'plpgsql';

select insere_cliente(1001,'a','a','a','a','a','a');
------------------------------------------------------------------------------------------------------------------------------------------
-------- gatilhos --------
--a
create table auditoria_salarios(
	codvend integer not null,
	salanterior float,
	salnovo float,
	dataalt date not null
);

create or replace function altera_salario ()
returns trigger as $$
begin
	insert into auditoria_salarios values (old.codvend, old.salfixo, new.salfixo, current_timestamp);
	return null;
end; $$ language 'plpgsql';

create trigger on_update_salario
after update on vendedor
for each row
execute procedure altera_salario();

select * from vendedor;
update vendedor set salfixo = 2800 where codvend = 11;
select * from auditoria_salarios;

create or replace function altera_salarios()
returns void as $$
begin 
	UPDATE vendedor	
		SET salfixo = salfixo*1.05
	WHERE faixacomis = 'A';
	UPDATE vendedor	
		SET salfixo = salfixo*1.10
	WHERE faixacomis = 'B';
	UPDATE vendedor	
		SET salfixo = salfixo*1.15
	WHERE faixacomis = 'C';
end; $$ language 'plpgsql';

select altera_salarios();

--b
alter table pedido add quant_itens integer;

create or replace function atualiza_pedido()
returns void as $$
declare aux record;
begin
for aux in select numped from pedido loop
	update pedido set quant_itens = (
		select count(i.numped)
		from itemped i, pedido p
		where p.numped = i.numped and p.numped = aux.numped)
	where aux.numped = pedido.numped;
end loop;
end; $$ language 'plpgsql';

select atualiza_pedido();
select * from pedido;

INSERT INTO ITEMPED VALUES (300, 13, 168);
delete from itemped where codprod = 13;

CREATE OR REPLACE FUNCTION verifica_qtde_itens()
RETURNS trigger AS $$
BEGIN
IF (TG_OP = 'DELETE') THEN
UPDATE PEDIDO SET quant_itens = quant_itens - 1 WHERE numped =
old.numped;
RETURN OLD;
ELSEIF (TG_OP = 'INSERT') THEN
UPDATE PEDIDO SET quant_itens = quant_itens + 1 WHERE numped =
new.numped;
RETURN NEW;
END IF;
END $$ language 'plpgsql';

CREATE TRIGGER verifica_item_pedido
BEFORE INSERT OR DELETE ON ITEMPED
FOR EACH ROW EXECUTE PROCEDURE verifica_qtde_itens();










