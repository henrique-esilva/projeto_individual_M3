create database resiliadata;
use resiliadata;

-- entidades: empresas_parceiras, tecnologias, colaboradores

-- empresas parceiras
create table empresasparceiras(
	id_empresaparceira int primary key auto_increment,
	nome varchar(128) not null,
	cnpj varchar(64) not null
);

-- areas
create table areas(
	id_area int primary key auto_increment,
	nome varchar(128)
);

drop table areas;
drop table tecnologias;
drop table empresasparceiras_tecnologias;

-- tecnologias, especificando a área
create table tecnologias(
	id_tecnologia int primary key auto_increment,
	nome varchar(128) not null,
	id_area int not null
);

-- empresasparceiras_tecnologias
create table empresasparceiras_tecnologias(
	id_empresaparceira_tecnologia int primary key auto_increment,
	id_empresaparceira int not null,
	id_tecnologia int not null
);

-- colaboradores
create table colaboradores(
	id_colaborador int primary key auto_increment,
	nome varchar(128),
	cpf varchar(11),
	id_empresaparceira int not null
);


-- chaves estrangeiras
alter table colaboradores add constraint fk_colaboradores_empresasparceiras foreign key (id_empresaparceira) references empresasparceiras(id_empresaparceira);
alter table tecnologias add constraint fk_tecnologias_areas foreign key (id_area) references areas(id_area);

alter table empresasparceiras_tecnologias
add constraint fk_empresasparceiras_tecnologias__empresasparceiras foreign key (id_empresaparceira) references empresasparceiras(id_empresaparceira),
add constraint fk_empresasparceiras_tecnologias__tecnologias foreign key (id_tecnologia) references tecnologias(id_tecnologia);

-- inserts
insert into empresasparceiras (id_empresaparceira, nome, cnpj) values
(null, 'microsoft', '00000001'),
(null,    'openai', '00000002'),
(null,     'apple', '00000003'),
(null,    'google', '00000004');

insert into areas (id_area, nome) values
(null, 'cibersegurança'),
(null, 'computação em núvem'),
(null, 'versionamento'),
(null, 'armazenamento em núvem');

insert into tecnologias (id_tecnologia, nome, id_area) values
(null, 'azure', 2),
(null, 'google drive', 4),
(null, 'onedrive', 4),
(null, 'dropbox', 4),
(null, 'git', 3);

insert into empresasparceiras_tecnologias (id_empresaparceira_tecnologia, id_empresaparceira, id_tecnologia) values
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

-- descobrindo a relação entre empresas e tecnologias
select empresasparceiras.nome, tecnologias.nome from
empresasparceiras inner join empresasparceiras_tecnologias inner join tecnologias
on empresasparceiras.id_empresaparceira = empresasparceiras_tecnologias.id_empresaparceira and empresasparceiras_tecnologias.id_tecnologia = tecnologias.id_tecnologia;





