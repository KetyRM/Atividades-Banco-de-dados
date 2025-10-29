create database banco_pokemon;
use banco_pokemon;

/*Tabela habitat*/
create table tb_habitat (
    id_habitat int auto_increment not null,
    tipo_habitat enum('água', 'fogo', 'terra', 'ar', 'neve') not null,
    constraint pk_id_habitat primary key (id_habitat)
);

insert into tb_habitat (tipo_habitat) values
('terra'),  
('terra'),  
('terra'),  
('fogo'),   
('fogo'),   
('ar'),     
('água'), 
('água'),   
('água'),   
('terra');

describe tb_habitat; /* Exibe a estrutura da tabela */
select * from tb_habitat; /* Exibe o conteúdo da tabela */
drop table tb_habitat; /* Exclui todo o conteúdo */
alter table tb_habitat; /*Alterar conteúdos dentro da tabela, mas precisa de permissão*/


/*Tabela do Treinador*/
create table tb_treinador (
    id_treinador int auto_increment not null,
    nome_treinador varchar(100) not null,
    nasc_treinador date not null,
    nivel_experiencia_treinador int not null,
    regiao_treinador varchar(50) not null,
    classe_treinador varchar(50) not null,
    estilo_treinador varchar(50) not null,
    id_equipe int,
    id_fazenda int,
    constraint pk_treinador primary key (id_treinador)
);

describe tb_treinador; /* Exibe a estrutura da tabela */
select * from tb_treinador; /* Exibe o conteúdo da tabela */
drop table tb_treinador; /* Exclui todo o conteúdo */
alter table tb_treinador; /*Alterar conteúdos dentro da tabela, mas precisa de permissão*/

insert into tb_treinador(nome_treinador, nasc_treinador, nivel_experiencia_treinador, regiao_treinador, classe_treinador, estilo_treinador, id_equipe, id_fazenda)values
('ash ketchum', '1990-05-22', 10, 'kanto', 'elite', 'agressivo', 1, 1),
('misty', '1991-03-10', 8, 'kanto', 'mediano', 'defensivo', 2, 2),
('brock', '1989-07-30', 9, 'kanto', 'elite', 'estrategico', 3, 3);

/*Tabela Fazenda*/
create table tb_fazenda (
    id_fazenda int auto_increment not null,
    nome_fazenda varchar(100) not null,
    capacidade_total_fazenda int not null,
    localizacao_fazenda varchar(100) not null,
    logradouro varchar(100) not null,
    ponto_de_referencia varchar(100) not null,
    id_habitat int,
    id_treinador int,
    constraint pk_id_fazenda primary key (id_fazenda),
    constraint fk_fazenda_habitat foreign key (id_habitat) references tb_habitat(id_habitat),
    constraint fk_fazenda_treinador foreign key (id_treinador) references tb_treinador(id_treinador)
);

describe tb_fazenda; /* Exibe a estrutura da tabela */
select * from tb_fazenda; /* Exibe o conteúdo da tabela */
drop table tb_fazenda; /* Exclui todo o conteúdo */
alter table tb_fazenda; /*Alterar conteúdos dentro da tabela, mas precisa de permissão*/

insert into tb_fazenda(nome_fazenda, capacidade_total_fazenda, localizacao_fazenda, logradouro, ponto_de_referencia, id_habitat, id_treinador)values
('fazenda pikachu', 50, 'kanto', 'rua da floresta 10', 'próximo ao lago', 1, 1),
('fazenda squirtle', 40, 'kanto', 'rua da água 25', 'ao lado da ponte', 2, 2),
('fazenda bulbasaur', 60, 'kanto', 'rua das flores 5', 'perto do jardim', 3, 3);



/*Tabela treinamento*/
create table tb_treinamento (
  id_equipe int auto_increment not null,
  tempo_de_treinamento int not null, 
  nome_equipe varchar(100) not null,
  id_pokemon int,
  id_treinador int,
  constraint pk_id_equipe primary key (id_equipe),
  constraint fk_treinamento_treinador foreign key (id_treinador) references tb_treinador(id_treinador),
  constraint fk_treinamento_pokemon foreign key (id_pokemon) references tb_pokemon(id_pokemon)
);

describe tb_treinamento; /* Exibe a estrutura da tabela */
select * from tb_treinamento; /* Exibe o conteúdo da tabela */
drop table tb_treinamento; /* Exclui todo o conteúdo */
alter table tb_treinamento; /*Alterar conteúdos dentro da tabela, mas precisa de permissão*/


insert into tb_treinamento (tempo_de_treinamento, nome_equipe, id_pokemon, id_treinador) values
(30, 'time bulbasaur', 1, 1),
(45, 'time ivysaur', 2, 1),
(60, 'time charmeleon', 5, 2),
(80, 'time charizard', 6, 2),
(50, 'time squirtle', 7, 3),
(70, 'time blastoise', 9, 3);

/*Tabela Pokemon*/
create table tb_pokemon (
    id_pokemon int auto_increment not null,
    nome_pokemon varchar(100) not null,
    tipo_1_pokemon varchar(50) not null,
    tipo_2_pokemon varchar(50),
    sexo_forma_pokemon enum('Masculine', 'Female') not null,
    hp_pokemon int not null,
    ataque_pokemon int not null,
    defesa_pokemon int not null,
    ataque_especial_pokemon int not null,
    agilidade_pokemon int not null,
    id_equipe int,
    id_habitat int,
    constraint pk_id_pokemon primary key (id_pokemon),
    constraint fk_pokemon_equipe foreign key (id_equipe) references tb_treinamento(id_equipe),
    constraint fk_pokemon_habitat foreign key (id_habitat) references tb_habitat(id_habitat)
);


describe tb_pokemon; /* Exibe a estrutura da tabela */
select * from tb_pokemon; /* Exibe o conteúdo da tabela */
drop table tb_pokemon; /* Exclui todo o conteúdo */
alter table tb_pokemon; /*Alterar conteúdos dentro da tabela, mas precisa de permissão*/

/*10 dados na tabela*/
insert into tb_pokemon(nome_pokemon,tipo_1_pokemon,tipo_2_pokemon,sexo_forma_pokemon,hp_pokemon,hp_pokemon,ataque_pokemon,defesa_pokemon,ataque_especial_pokemon,agilidade_pokemon)values
('bulbasaur', 'grass', 'poison', 'masculine', 45, 49, 49, 65, 45),
('ivysaur', 'grass', 'poison', 'masculine', 60, 62, 63, 80, 60),
('venusaur', 'grass', 'poison', 'masculine', 80, 82, 83, 100, 80),
('charmander', 'fire', '', 'masculine', 39, 52, 43, 60, 65),
('charmeleon', 'fire', '', 'masculine', 58, 64, 58, 80, 80),
('charizard', 'fire', 'flying', 'masculine', 78, 84, 78, 109, 100),
('squirtle', 'water', '', 'masculine', 44, 48, 65, 50, 43),
('wartortle', 'water', '', 'masculine', 59, 63, 80, 65, 58),
('blastoise', 'water', '', 'masculine', 79, 83, 100, 85, 78),
('caterpie', 'bug', '', 'masculine', 45, 30, 35, 20, 45);

