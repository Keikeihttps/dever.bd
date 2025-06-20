create database aula16;

create table categoria(
	categoria_id serial,
	nome varchar(20),
	ultima_atualizacao timestamp
);

create table filme_categoria(
	filme_id int,
	categoria_id int,
	ultima_atualizacao timestamp
);

create table filme(
	filme_id serial,
	titulo varchar(35),
	descricao text,
	ano_lancamento char(4),
	id_linguagem int,
	duracao_aluguel int,
	aluguel_preco numeric(4,2),
	duracao int,
	multa numeric(4,2),
	class_indicativa int,
	ultima_atualizacao timestamp,
	ocasiao_especial text,
	sinopsia text
	
);

create table lingua( 
	lingua_id serial,
	nome varchar(20),
	ultima_atualizacao timestamp
);

create table ator_filme( 
	ator_id int,
	filme_id int,
	ultima_atualizacao timestamp
);

create table ator( 
	ator_id serial,
	primeiro_nome varchar(15),
	ultimo_nome varchar(30),
	ultima_atualizacao timestamp
);

create table funcionario(
	funcionario_id serial,
	primeiro_nome varchar(15),
	ultimo_nome varchar(30),
	endereco_id int,
	email varchar(60),
	store_id int,
	ativo bool,
	username varchar(40),
	senha varchar(12),
	ultima_atualizacao timestamp,
	foto bytea
);

create table pagamento(
	pagamento_id serial,
	cliente_id int, 
	funcionario_id int,
	aluguel_id int,
	preco numeric(4,2),
	data_pagamento timestamp
);

create table aluguel(
	aluguel_id serial,
	data_aluguel timestamp,
	estoque_id int,
	cliente_id int,
	data_devolucao timestamp,
	funcionario_id int,
	ultima_atualizacao timestamp
);

create table estoque(
	estoque_id serial,
	filme_id int,
	loja_id int,
	ultima_atualizacao timestamp
);

create table cliente( 
	cliente_id serial,
	loja_id int,
	primeiro_nome varchar(15),
	ultimo_nome varchar(30),
	email varchar(60),
	endereco_id int,
	ativo bool,
	data_criacao timestamp,
	ultima_atualizacao timestamp
);

create table endereco(
	endereco_id serial,
	endereco varchar(51),
	endereco_dois varchar(51),
	distrito varchar(31), 
	cidade_id int,
	cep char(8),
	celular char(13),
	ultima_atualizacao timestamp
);

create table cidade(
	cidade_id serial,
	cidade varchar(30),
	pais_id int,
	ultima_atualizacao timestamp
);

create table pais(
	pais_id serial,
	pais varchar(50),
	ultima_atualizacao timestamp
);

create table loja(
	loja_id serial,
	funcionario_id int, 
	endereco_id int,
	ultima_atualizacao timestamp
);

alter table categoria add primary key (categoria_id); 

alter table filme add primary key (filme_id); 

alter table lingua add primary key (lingua_id); 

alter table ator add primary key (ator_id);

alter table funcionario add primary key (funcionario_id); 

alter table pagamento add primary key (pagamento_id); 

alter table aluguel add primary key (aluguel_id); 

alter table estoque add primary key (estoque_id); 

alter table cliente add primary key (cliente_id); 

alter table endereco add primary key (endereco_id); 

alter table cidade add primary key (cidade_id); 

alter table pais add primary key (pais_id); 

alter table loja add primary key (loja_id); 

alter table filme rename column id_linguagem to lingua_id;

alter table funcionario rename column store_id to loja_id;

alter table filme_categoria add constraint fk_categoria
foreign key (categoria_id) references categoria(categoria_id);

alter table filme_categoria add constraint fk_filme
foreign key (filme_id) references filme(filme_id);

alter table ator_filme add constraint fk_ator
foreign key (ator_id) references ator(ator_id);

alter table filme add constraint fk_lingua
foreign key (lingua_id) references lingua(lingua_id);

alter table ator_filme add constraint fk_filme
foreign key (filme_id) references filme(filme_id);

alter table estoque add constraint fk_filme
foreign key (filme_id) references filme(filme_id);

alter table aluguel add constraint fk_estoque
foreign key (estoque_id) references estoque(estoque_id);

alter table aluguel add constraint fk_funcionario
foreign key (funcionario_id) references funcionario(funcionario_id);

alter table pagamento add constraint fk_aluguel
foreign key (aluguel_id) references aluguel(aluguel_id);

alter table pagamento add constraint fk_funcionario
foreign key (funcionario_id) references funcionario(funcionario_id);

alter table funcionario add constraint fk_loja
foreign key (loja_id) references loja(loja_id);

alter table funcionario add constraint fk_endereco
foreign key (endereco_id) references endereco(endereco_id);

alter table endereco add constraint fk_cidade
foreign key (cidade_id) references cidade(cidade_id);

alter table cidade add constraint fk_pais
foreign key (pais_id) references pais(pais_id);

alter table aluguel add constraint fk_cliente
foreign key (cliente_id) references cliente(cliente_id);

alter table pagamento add constraint fk_cliente
foreign key (cliente_id) references cliente(cliente_id);

alter table loja add constraint fk_endereco
foreign key (endereco_id) references endereco(endereco_id);

alter table loja add constraint fk_funcionario
foreign key (funcionario_id) references funcionario(funcionario_id);

alter table cliente add constraint fk_loja
foreign key (loja_id) references loja(loja_id);

--inserção de tabelas
insert into pais(pais, ultima_atualizacao)
values('Brasil', '2025-06-20 00:00:00'),
	  ('Portugal', '2025-06-20 00:00:00'),
	  ('Japão', '2025-06-20 00:00:00');
	  
insert into cidade(cidade, pais_id, ultima_atualizacao)
values('Petrópolis', 1, '2025-06-20 00:00:00'),
	  ('Tokyo', 5, '2025-06-20 00:00:00'),
	  ('Lisboa', 2, '2025-06-20 00:00:00');
	  
insert into endereco (endereco, endereco_dois, distrito, cidade_id, cep, celular, ultima_atualizacao)
values('Rua Varls','Rua Carls','Distrito Lars', 1,'12345678','1234567890124', '2025-06-20 00:00:00')