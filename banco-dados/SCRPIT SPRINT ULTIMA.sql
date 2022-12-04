create database if not exists oncotech;

use oncotech;

CREATE TABLE IF NOT EXISTS unidade (
    idUnidade INT PRIMARY KEY AUTO_INCREMENT,
    empresa VARCHAR(100),
    nomeUnidade VARCHAR(45),
    rua VARCHAR(45),
    numero VARCHAR(45),
    bairro VARCHAR(45),
    cep CHAR(8),
    complemento VARCHAR(45),
    cnpj CHAR(14),
    fkMatriz INT,
    FOREIGN KEY (fkMatriz)
        REFERENCES unidade (idUnidade)
);


CREATE TABLE IF NOT EXISTS remedio (
    idRemedio INT AUTO_INCREMENT primary key,
    nomeRemedio VARCHAR(45),
    tempMin DECIMAL(3 , 1 ),
    tempMax DECIMAL(3 , 1 )
);

insert into remedio values
	(null, 'Talidomida', 15,30),
    (null, 'Mesilato de Imatinibe', 15,30),
    (null, 'Dasatinibe', 15,30),
    (null, 'Rituximabe ', 2,8),
    (null, 'Trastuzumabe', 2,8),
    (null, 'Nilotinibe', 15,30),
    (null, 'Pertuzumabe', 2,8),
    (null, 'Zidovudina', 15,30);

CREATE TABLE IF NOT EXISTS setor (
    idSetor INT AUTO_INCREMENT,
    nomeSetor VARCHAR(45),
    localSetor VARCHAR(45),
    fkRemedio int,
    foreign key (fkRemedio) references remedio(idRemedio),
    fkUnidade INT,
    FOREIGN KEY (fkUnidade)
	REFERENCES unidade (idUnidade),
    PRIMARY KEY (idSetor , fkUnidade)
);



CREATE TABLE IF NOT EXISTS usuario (
    idUsuario INT AUTO_INCREMENT,
    nome VARCHAR(45),
    sobrenome VARCHAR(45),
    cargo VARCHAR(45),
    email VARCHAR(45),
    senha VARCHAR(45),
    fkUnidade INT,
    FOREIGN KEY (fkUnidade)
        REFERENCES unidade (idUnidade),
    PRIMARY KEY (idUsuario , fkUnidade)
);



CREATE TABLE IF NOT EXISTS sensor (
    idSensor INT auto_increment,
    nomeSensor VARCHAR(45),
    dthora DATETIME,
    fkSetor INT,
    fkUnidade INT,
    FOREIGN KEY (fkSetor)
        REFERENCES setor (idSetor),
    FOREIGN KEY (fkUnidade)
        REFERENCES unidade (idUnidade),
    PRIMARY KEY (idSensor , fkSetor , fkUnidade)
);

CREATE TABLE IF NOT EXISTS medida (
    idmedida INT PRIMARY KEY auto_increment,
    temperatura DECIMAL(3 , 1 ),
    umidade DECIMAL(3 , 1 )
);

CREATE TABLE IF NOT EXISTS relatorio (
    fkmedida INT,
    fksensor INT,
    fksetor INT,
    fkunidade INT,
    PRIMARY KEY (fkmedida , fksensor , fksetor , fkunidade),
    FOREIGN KEY (fkmedida)
        REFERENCES medida (idmedida),
    FOREIGN KEY (fksensor)
        REFERENCES sensor (idsensor),
    FOREIGN KEY (fksetor)
        REFERENCES setor (idsetor),
    FOREIGN KEY (fkunidade)
        REFERENCES unidade (idunidade)
);



-- INSERT VALUES
insert into unidade values
(null,'Bayer','Unidade Matriz Tatuape','Tuiuti','1023','Tatuape','08471250',null,'04966357000180',null),
(null,'Bayer','Unidade Mogi','rose prestes','585','Mogi das Cruzes','0845710',null,'04966354510215',1),
(null,'Brainfarma','Unidade Matriz Paulista','hadock lobo','23','Av. Paulista','08471981',null,'04256357001528',null),
(null,'Brainfarma','Unidade Sé','Tuiuti','1023','Tatuape','0847999',null,'03570001801579',3),
(null,'Brainfarma','Unidade São Matheus','jose coutinho','1023','Tatuape','08424562',null,'04889112512220',3),
(null,'Eurofarma','Unidade Matriz Tatuape','Mota souza','10','Tatuape','08498754','proximo ao HOSPITAL almeida','04966357511110',null),
(null,'Medley Indústria Farmacêutica','Unidade Matriz Eng.Goulart','Av. Alameda','545','engenheiro goulart','08401123','Andar de cima a o restaurante','04966357000180',null);

select * from setor;
select * from remedio;
select * from unidade;
select * from usuario;


insert into setor values
(null,'Setor Talidomida','Ala 1B 2ºAndar',1,1),
(null,'Setor Mesilato de Imatinibe','Ala A 5ºAndar',2,1),
(null,'Setor Dasatinibe','Ala A 2ºAndar',3,2),
(null,'Setor Rituximabe','Ala B 3ºAndar',4,5),
(null,'Setor Transtuzumabe','Ala M 5ºAndar',5,3),
(null,'Setor Nilotinibe','Ala C 6ºAndar',6,7),
(null,'Setor Pertuzumabe','Ala 2B 7ºAndar',7,2),
(null,'Setor Zidovudina','Ala D 3ºAndar',8,6),
(null,'Setor Zidovudina','Ala D 2ºAndar',8,6),
(null,'Setor Zidovudina','Ala D 1ºAndar',8,6);

select avg(temperatura),avg(umidade) from medida;


select temperatura,umidade,idSensor,idSetor from medida join relatorio on idMedida=fkMedida join sensor on fkSensor=idSensor join setor on sensor.fkSetor =idSetor;


select * from usuario;	
select * from medida;
select * from unidade;
select * from sensor;

insert into medida values
(null,10.3,12.2),
(null,12.5,12.7),
(null,13.5,14.5),
(null,12.3,13.1),
(null,10.3,12.5),
(null,11.3,11.8),
(null,12.3,10.5);