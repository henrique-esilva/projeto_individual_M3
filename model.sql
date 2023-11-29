create database resiliadata;
use resiliadata;

-- entidades: empresas_parceiras, tecnologia, colaborador

-- empresas parceiras
create table empresaparceira(
	id_empresaparceira int primary key auto_increment,
	nome varchar(128) not null,
	cnpj varchar(64) not null
);

-- area
create table area(
	id_area int primary key auto_increment,
	nome varchar(128)
);

drop table area;
drop table tecnologia;
drop table empresaparceira_tecnologia;

-- tecnologia, especificando a área
create table tecnologia(
	id_tecnologia int primary key auto_increment,
	nome varchar(128) not null,
	id_area int not null
);

-- empresaparceira_tecnologia
create table empresaparceira_tecnologia(
	-- id_empresaparceira_tecnologia int primary key auto_increment,
	id_empresaparceira int not null,
	id_tecnologia int not null
);

-- colaborador
create table colaborador(
	id_colaborador int primary key auto_increment,
	nome varchar(128),
	cpf varchar(11),
	id_empresaparceira int not null
);


-- chaves estrangeiras
alter table colaborador add constraint fk_colaborador_empresaparceira foreign key (id_empresaparceira) references empresaparceira(id_empresaparceira);
alter table tecnologia add constraint fk_tecnologia_area foreign key (id_area) references area(id_area);

alter table empresaparceira_tecnologia
add constraint fk_empresaparceira_tecnologia__empresaparceira foreign key (id_empresaparceira) references empresaparceira(id_empresaparceira),
add constraint fk_empresaparceira_tecnologia__tecnologia foreign key (id_tecnologia) references tecnologia(id_tecnologia);

-- inserts
insert into empresaparceira (id_empresaparceira, nome, cnpj) values
(null, 'microsoft', '00000001'),
(null,    'openai', '00000002'),
(null,     'apple', '00000003'),
(null,    'google', '00000004');

insert into area (id_area, nome) values
(null, 'cibersegurança'),
(null, 'computação em núvem'),
(null, 'versionamento'),
(null, 'armazenamento em núvem');

insert into tecnologia (id_tecnologia, nome, id_area) values
(null, 'azure', 2),
(null, 'google drive', 4),
(null, 'onedrive', 4),
(null, 'dropbox', 4),
(null, 'git', 3);

insert into empresaparceira_tecnologia (id_empresaparceira_tecnologia, id_empresaparceira, id_tecnologia) values
(null, 1, 1),
(null, 1, 4),
(null, 1, 3),
(null, 1, 5),

(null, 4, 5),
(null, 4, 1),

(null, 5, 5),
(null, 5, 2),
(null, 5, 1),

(null, 6, 5),
(null, 6, 2),
(null, 6, 1);

-- pesquisas

-- descobrindo a relação entre empresas e tecnologia
select empresaparceira.nome, tecnologia.nome from
empresaparceira inner join empresaparceira_tecnologia inner join tecnologia
on empresaparceira.id_empresaparceira = empresaparceira_tecnologia.id_empresaparceira and empresaparceira_tecnologia.id_tecnologia = tecnologia.id_tecnologia;





