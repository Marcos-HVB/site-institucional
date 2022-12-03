create database oncotech;
use oncotech;

create table unidade(
idUnidade int primary key auto_increment,
empresa varchar(100),
nomeUnidade varchar(45),
rua varchar(45),
numero varchar(45),
bairro varchar(45),
cep char(8),
complemento varchar(45),
cnpj char(14),
fkMatriz int,
foreign key (fkMatriz) references unidade(idUnidade)
);

insert into unidade values
(null,'Bayer','Unidade Matriz Tatuape','Tuiuti','1023','Tatuape','08471250',null,'04966357000180',null),
(null,'Bayer','Unidade Mogi','rose prestes','585','Mogi das Cruzes','0845710',null,'04966354510215',1),
(null,'Brainfarma','Unidade Matriz Paulista','hadock lobo','23','Av. Paulista','08471981',null,'04256357001528',null),
(null,'Brainfarma','Unidade Sé','Tuiuti','1023','Tatuape','0847999',null,'03570001801579',3),
(null,'Brainfarma','Unidade São Matheus','jose coutinho','1023','Tatuape','08424562',null,'04889112512220',3),
(null,'Eurofarma','Unidade Matriz Tatuape','Mota souza','10','Tatuape','08498754','proximo ao HOSPITAL almeida','04966357511110',null),
(null,'Medley Indústria Farmacêutica','Unidade Matriz Eng.Goulart','Av. Alameda','545','engenheiro goulart','08401123','Andar de cima a o restaurante','04966357000180',null);


create table setor(
idSetor int auto_increment,
nomeSetor varchar(45),
localSetor varchar(45),
fkUnidade int,
foreign key (fkUnidade) references unidade(idUnidade),
primary key (idSetor,fkUnidade)
);


insert into usuario values

(1,'thiago','pequeno','Chefe de setor','thiago.castro@sptech.school','12345',1);

create table remedio(
idRemedio int auto_increment,
nomeRemedio varchar (45),
quantidade int,
valor decimal(7,2),
tempIdeal decimal(5,2),
umidIdeal decimal(5,2),
fkSetor int,
fkUnidade int,
foreign key (fkUnidade) references unidade(idUnidade),
foreign key (fkSetor) references setor(idSetor),
primary key (idRemedio, fkSetor, fkUnidade)
);

create table sensor(
idSensor int,
nomeSensor varchar(45),
temperatura decimal(5,2),
umidade decimal(5,2),
dthora dateTime,
fkSetor int,
fkUnidade int,
foreign key (fkSetor) references setor(idSetor),
foreign key (fkUnidade) references unidade(idUnidade),
primary key (idSensor,fkSetor,fkUnidade) 
);



create table usuario(
idUsuario int auto_increment,
nome varchar(45),
sobrenome varchar(45),
cargo varchar(45),
email varchar(45),
senha varchar(45),
fkUnidade int,
foreign key (fkUnidade) references unidade(idUnidade),
primary key (idUsuario, fkUnidade)
);

-- INSERT UNIDADE
select * from usuario;
select * from unidade;
insert into unidade values
(1,'Hinovace','hinovace','hadocklobo','1023','paulista','08410070',NULL,'88791470001-94',null);

insert into unidade values
(2,'Hinovace','hinovace','hadocklobo','1023','paulista','08410070',NULL,'88791470001-94',1);

select * from usuario    ;

desc unidade;
desc usuario;
desc setor;
desc remedio;
desc sensor;

select * from unidade as u join unidade as m
	on u.fkMatriz = m.idUnidade join setor
		on setor.fkUnidade = u.idUnidade join remedio
			on remedio.fkSetor = idSetor join sensor
				on sensor.fkSetor = idSetor;
                
select * from usuario as f join usuario as r
	on f.fkResponsavel = r.idUsuario left join unidade 
		on f.fkUnidade = idUnidade;