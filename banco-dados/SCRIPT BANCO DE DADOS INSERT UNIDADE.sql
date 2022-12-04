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
    idRemedio INT AUTO_INCREMENT,
    nomeRemedio VARCHAR(45),
    tempMin DECIMAL(5 , 2 ),
    tempMax DECIMAL(5 , 2 )
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
    idSensor INT,
    nomeSensor VARCHAR(45),
    fkSetor INT,
    fkUnidade INT,
    FOREIGN KEY (fkSetor)
        REFERENCES setor (idSetor),
    FOREIGN KEY (fkUnidade)
        REFERENCES unidade (idUnidade),
    PRIMARY KEY (idSensor , fkSetor , fkUnidade)
);

CREATE TABLE IF NOT EXISTS medida (
    idmedida INT PRIMARY KEY,
    temperatura DECIMAL(3 , 1 ),
    umidadade DECIMAL(3 , 1 ),
    dataHora datetime
);

CREATE TABLE IF NOT EXISTS relatorio (
    fkMedida INT,
    fkSensor INT,
    fkSetor INT,
    fkUnidade INT,
    PRIMARY KEY (fkMedida , fkSensor , fkSetor , fkUnidade),
    FOREIGN KEY (fkMedida)
        REFERENCES medida (idMedida),
    FOREIGN KEY (fkSensor)
        REFERENCES sensor (idSensor),
    FOREIGN KEY (fkSetor)
        REFERENCES setor (idSetor),
    FOREIGN KEY (fkUnidade)
        REFERENCES unidade (idUnidade)
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


select temperatura,umidade,idSensor,idSetor from medida join relatorio on idMedida=fkMedida join sensor on fkSensor=idSensor join setor on sensor.fkSetor =idSetor;


select * from usuario;
select * from medida;
select * from unidade;