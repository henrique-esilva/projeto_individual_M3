create database resiliadata;
use resiliadata;

-- empresas parceiras
create table empresasparceiras(
	id_empresaparceira int primary key auto_increment,
    nome varchar(128) not null,
    cnpj varchar(64) not null
);

-- areas
create table areas(
	id_area int primary key auto_increment,
	nome varchar(16)
);

-- tecnologias, especificando a área
create table tecnologias(
	id_tecnologia int primary key auto_increment,
    nome varchar(128) not null,
    id_area int not null
);

-- empresas_tecnologias
create table empresas_tecnologias(
	id_empresasparceiras_tecnologias int not null primary key auto_increment,
    id_empresaparceira int,
    id_tecnologia int
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

alter table empresas_tecnologias
add constraint fk_empresas_tecnologias__empresasparceiras foreign key (id_empresaparceira) references empresasparceiras(id_empresaparceira),
add constraint fk_empresas_tecnologias__tecnologias foreign key (id_tecnologia) references tecnologias(id_tecnologia);
