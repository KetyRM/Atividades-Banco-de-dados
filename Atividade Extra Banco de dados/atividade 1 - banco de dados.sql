create database banco_artistas

use banco_artistas


drop database banco_artistas;

create table tb_artista(
  pk_id_art int auto_increment primary key not null,
  nome_art varchar(100) not null
);

create table tb_gravadora(
  pk_id_gravadora int primary key auto_increment not null, 
  nome_grav varchar(50) not null
);

create table tb_categoria(
 pk_id_cat int primary key auto_increment not null,
 nome_cat varchar(50) not null
);

create table tb_estado(
 pk_id_est int primary key auto_increment not null,
 sigla_est char(2) not null,
 nome_est char(20) not null
);

create table tb_cidade(
pk_id_cid int primary key auto_increment not null,
sigla_est char(2) not null,
nome_cid varchar(100) not null
);

create table tb_cliente(
 pk_id_cli int primary key auto_increment not null,
 fk_id_cid int not null,
 nome_cli varchar(100) not null,
 end_cli varchar(100) not null,
 renda_cli decimal(10,2) not null default 0 check (renda_cli >=0),
 sexo_cli char(1) not null default 'F' check (sexo_cli in('F','M')),
 foreign key (fk_id_cid) references tb_cidade(pk_id_cid)
);

create table tb_conjuge(
fk_id_cli int not null,
nome_conj varchar (100) not null,
renda_conj decimal (10,2) not null,
sexo_conj char(1) not null default 'F' check (sexo_conj in('F','M')),
foreign key (fk_id_cli) references tb_cliente(pk_id_cli)
);

create table tb_funcionario(
pk_id_func int primary key auto_increment not null,
nome_func varchar (100) not null,
end_func varchar(200) not null,
sal_func decimal (10,2) not null default 0 check(sal_func >=0),
sexo_func char(1) not null default 'F' check (sexo_func in('F','M')),
);

create table tb_dependente(
pk_id_dep int primary key auto_increment not null,
fk_id_func int not null,
nome_dep varchar(100) not null,
sexo_dep char(1) not null default 'F' check (sexo_fdep in('F','M')),
foreign key (fk_id_func) references tb_funcionario(pk_id_func)
);

create table tb_titulo(
pk_id_tit int primary key auto_increment not null,
fk_id_cat int not null,
fk_id_grav int not null,
nome_cd varchar(100) not null,
val_cd decimal(10,2) not null,
qtd_estoq int not null,
foreing key (fk_id_cat) references tb_categoria(pk_id_cat),
foreing key (fk_id_grav) references tb_gravadora(pk_id_grav)
);

create table tb_pedido(
 pk_id_ped int primary key auto_increment not null,
 fk_id_cli int not null,
 data_ped datetime not null,
 val_ped decimal (10,2) not null,
 foreing key (fk_id_cli) references tb_clientes(pk_id_cli)
 );
 
 create table tb_titulo_pedido(
 fk_id_num_ped int not null,
 fk_id_tit int not null,
 cod_tit int not null,
 qtd_cd int not null,
 val_cd decimal (10,2) not null,
 foreing key (fk_id_num_ped) references tb_pedido(pk_id_ped),
 foreing key (fk_id_tit) references tb_titulo(pk_id_tit)
 );
 
 create table table_titulo_artista(
 fk_id_tit int not null,
 fk_id_art int not null,
 foreing key (fk_id_tit) references tb_titulo(pk_id_tit)
 foreing key (fk_id_art) references tb_artista(pk_id_art)
 
 );
 