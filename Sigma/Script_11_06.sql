CREATE TABLE livro (
	id serial,
	titulo varchar(80),
	autor varchar(80),
	editora varchar(30),
	genero varchar(20)
);

create table emprestimo (
	id serial,
	data_retirada date,
	data_devolucao date
);

create table usuario (
	id serial primary key,
	nome_completo varchar(50),
	matricula char(6),
	email varchar(50)
);

alter table emprestimo add primary key (id);
alter table livro add primary key (id);

alter table emprestimo add column id_livro int;
alter table emprestimo add column id_usuario int;

--alterando a tabela empréstimo e adicionando uma restrição
alter table emprestimo add constraint fk_livro
--referenciando a coluna id_livro da tabela com a coluna id da tabela livro
foreign key (id_livro) references livro(id);

alter table emprestimo add constraint fk_usuario
foreign key (id_usuario) references usuario(id);

insert into usuario (nome_completo, matricula, email)
values ('teste1', '156737', 'teste1@aluno.senai.br'),
('teste2', '146037', 'teste2@aluno.senai.br');