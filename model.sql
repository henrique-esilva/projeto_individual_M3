create database resiliadata;
use resiliadata;

-- entidades: empresas_parceiras, area, colaborador
-- entidades fracas: tecnologia
-- relacionamento promovido: empresaparceira_tecnologia

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

-- tecnologia, especificando a área
create table tecnologia(
	id_tecnologia int primary key auto_increment,
	nome varchar(128) not null,
	id_area int not null
);

-- empresaparceira_tecnologia
create table empresaparceira_tecnologia(
	id_empresaparceira_tecnologia int primary key auto_increment,
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
    
select id_empresaparceira from empresaparceira;

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
	
	(null, 2, 5),
	(null, 2, 1),
	
	(null, 3, 5),
	(null, 3, 2),
	(null, 3, 1),
	
	(null, 4, 5),
	(null, 4, 2),
	(null, 4, 1);

insert into colaborador (id_colaborador, nome, cpf, id_empresaparceira) values
	(null, 'Alex',     '00000000001', 1),
	(null, 'Felix',    '00000000002', 1),
	(null, 'Débora',   '00000000003', 2),
	(null, 'Tom',      '00000000004', 2),
	(null, 'Anderson', '00000000005', 3),
	(null, 'Cláudia',  '00000000006', 4);


-- funções úteis

delimiter //
create function formata_cpf (cpf varchar(11) )
returns varchar(14)
begin
	declare cpf_formatado varchar(14);
	set cpf_formatado = concat(
		substring(cpf,  1, 3), '.',
		substring(cpf,  4, 3), '.',
		substring(cpf,  7, 3), '-',
		substring(cpf, 10, 2)
	);
	return cpf_formatado;
end //
delimiter ;

-- pesquisas

-- descobrindo a relação entre empresas e tecnologias
select empresaparceira.nome as empresa, tecnologia.nome as tecnologia from
empresaparceira
inner join empresaparceira_tecnologia on empresaparceira.id_empresaparceira = empresaparceira_tecnologia.id_empresaparceira
inner join tecnologia on empresaparceira_tecnologia.id_tecnologia = tecnologia.id_tecnologia;

-- exibe a relação de nomes e cpf's, com o cpf no formato brasileiro
select nome, formata_cpf(cpf) as cpf
from colaborador;

-- exibe as tecnologias e suas áreas correspondentes
select tecnologia.nome as tecnologia, area.nome as area from tecnologia inner join area on tecnologia.id_area=area.id_area order by area;

-- tecnologias mais usadas
select tecnologia.nome as tecnologia, count(empresaparceira.id_empresaparceira) as 'N de empresas' from empresaparceira_tecnologia
inner join tecnologia on tecnologia.id_tecnologia=empresaparceira_tecnologia.id_tecnologia
inner join empresaparceira on empresaparceira_tecnologia.id_empresaparceira=empresaparceira.id_empresaparceira group by tecnologia;



