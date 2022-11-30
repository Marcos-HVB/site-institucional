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


create table setor(
idSetor int auto_increment,
nomeSetor varchar(45),
localSetor varchar(45),
fkUnidade int,
foreign key (fkUnidade) references unidade(idUnidade),
primary key (idSetor,fkUnidade)
);


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
idUsuario int,
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