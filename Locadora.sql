create database LocadoraBenone;
use LocadoraBenone;

SET SQL_SAFE_UPDATES=0;

create table cliente(
idCliente int not null Auto_increment,
idFilme int not null default '0',
idJogo int not null default '0',
NomeCliente varchar(30),
sexo char(1),
DataNasc Date,
CPF Varchar(15),
DataAluguel date,
DataEntrega date,
Constraint PK_IdCliente Primary Key (idCliente),
constraint Fk_IdJogo foreign key (idjogo) references jogos(idjogo),
constraint fk_idfilme foreign key (idfilme) references filmes (idfilme)
);
create table clienteEnd(
idcliente int not null,
Endereco varchar(60),
telefone varchar(15),
constraint fk_id_cliente foreign key (idcliente) references cliente(idcliente));


create table Funcionario(
IdFuncionario int not null Auto_increment,
nomeFuncionario varchar(40),
sexo char(1),
funcao varchar(25), 
Constraint PK_IdFuncionario Primary Key (IdFuncionario));

create table CategoriaF(
NomeCatF varchar(30) DEFAULT "..",
ClasIndicativa int,
Constraint NomeCatFilme Primary Key (NomeCatF));

create table CategoriaJ(
NomeCatJ varchar(30) DEFAULT "..",
ClasIndicativa int,
Constraint NomeCatJogo Primary Key (NomeCatJ));

create table Filmes(
IdFilme int not null default '0',
NomeFilme varchar(70),
DataLanc date,
PrecoFilme Decimal(5,2),
Ator varchar(30),
Diretor varchar(30),
NomeCatF varchar(30),
TaxaAtrasoFilme decimal(3,2),


Constraint PK_IdFilme Primary Key (IdFilme),
Constraint FK_NomeCategoria Foreign Key (NomeCatF) References Categoriaf (NomeCatF));


create table Jogos(
idJogo int not null default '0',
NomeJogo varchar(40),
PrecoJogo decimal(4,2),
ClasIndicativa decimal(3,0),
NomeCatJ varchar(30),
TaxaAtrasoJogo decimal(3,2),

Constraint PK_IdJogo Primary Key (IdJogo),
Constraint FK_NomecatJ Foreign Key (NomecatJ) References Categoriaj (NomecatJ));

create table Ator(
IdAtor int not null auto_increment,
nomeAtor varchar(40),
NomeCatF varchar(30),
Constraint PK_IdAtor Primary Key (IdAtor),
Constraint FK_nomecatF foreign key(nomecatF) references categoriaF (nomecatF));


create table Midias(
IdFilme int not null,
IdJogo int not null,
NomeCatJ varchar(30),
NomeCatF varchar(30),
Constraint FK_idFilme Foreign Key (idFilme) References Filmes (IdFilme),
Constraint FK_idJogo Foreign Key (IdJogo) References Jogos (IdJogo),
Constraint FK_NomeCategoriaFilme Foreign Key (NomeCatF) References CategoriaF (NomeCatF),
Constraint FK_NomeCategoriaJogo Foreign Key (NomeCatJ) References CategoriaJ (NomeCatJ));


/* Alterações no Banco */
ALTER TABLE CategoriaJ DROP COLUMN ClasIndicativa;

ALTER TABLE CategoriaF DROP COLUMN ClasIndicativa;

ALTER TABLE Cliente ADD Email VARCHAR(50);

Alter Table Funcionario ADD TempoNaEmpresa date;

ALTER TABLE Cliente MODIFY COLUMN NomeCliente VARCHAR(40);

/*Inserções no Banco */

-- Insert na entidade Cliente
INSERT INTO Cliente VALUES (NULL,DEFAULT,2, "Matheus Dragneel", "M","1999-02-22", "700.330.012-12","2019-11-14", "2019-11-15","MaD@gmail.com");
INSERT INTO Cliente VALUES (NULL,2,1, "Iago Kamado", "M", "2001-01-23", "500-500-122.55", "2019-11-21","2019-11-22", "IagoK@gmail.com");
INSERT INTO Cliente VALUES (NULL,2, DEFAULT,"Mariana Fullbuster", "F", "1998-05-14","600.300.123--22", "2019-11-22", "2019-11-23", "MariFull@gmail.com");
INSERT INTO Cliente VALUES (NULL,3,4, "Renan Dreyar", "M", "1991-06-30","500.332.555-12","2019-11-23","2019--11-24", "RenanDre@Gmail.com");


-- insert na Entidade clienteEnd
INSERT INTO clienteEnd values (1, "Av.Bernardo Vieira de Melo", "98887-9909");
INSERT INTO clienteEnd values (2, "Pontes dos carvalhos, 1999", "98898-1042");
INSERT INTO clienteEnd values (3, "Av Presidente Kennedy, 1223", "98689-1048");
INSERT INTO clienteEnd values (4, "Zona norte la longe", "9999-0612");
-- Insert nas Entidades Funcionario

INSERT INTO Funcionario VALUES (NULL, "Raoni Etienne", "M", "Chefe/Dono", '2014-02-01');
INSERT INTO Funcionario VALUES (NULL, "Web Trevor", "M", "Analista Financeiro", '2014-02-01');
INSERT INTO Funcionario VALUES (NULL, "Diego Stark", "M", "Analista T.I", '2014-05-06');
INSERT INTO Funcionario VALUES (NULL, "EadMaldito", "M", "Auxiliar Administrativo", '2016-02-06');

-- Insert na entidade Filmes

INSERT INTO Filmes VALUES (NULL, "Harry Potter e a Pedra filosofal", "2001-11-23", 9.10, "Chris Colombus","Ação", 0.60);
INSERT INTO Filmes VALUES (NULL, "Compramos um Zoologico", "2011/12/23", 7.00, "Cameron Crowe", "Ação", 0.90);
INSERT INTO Filmes VALUES (NULL, "Sociedade Dos Poetas Mortos", "1990-02-28", 7.00, "Peter Weir", "Drama", 0.80);
INSERT INTO Filmes VALUES (NULL, "Jogador Numero 1", "2018-03-29", 9.50, "Steven Spielberg", "Ação", 0.70);

-- Insert na entidade Jogos

INSERT INTO Jogos VALUES (NULL, "Uncharted 4", 8.00, 12.0, "Aventura", 0.70);
INSERT INTO Jogos VALUES (NULL, "The last of Us", 7.00, 18.0, "Tiro", 0.60);
INSERT INTO Jogos VALUES (NULL, "God of war", 9.00, 18.0, "Aventura", 0,80);
INSERT INTO Jogos VALUES (NULL, "Detroit become human", 6.50, 18.0, "Aventura", 0.70);

-- Insert na entidade Categorias Filme

INSERT INTO CategoriaF VALUES ("Drama");
INSERT INTO CategoriaF VALUES ("Romance");
INSERT INTO CategoriaF VALUES ("Ação");
INSERT INTO CategoriaF VALUES ("Terror");

-- Insert na entidade Categorias Jogo

INSERT INTO CategoriaJ VALUES ("Terror");
INSERT INTO CategoriaJ VALUES ("Aventura");
INSERT INTO CategoriaJ VALUES ("Luta");
INSERT INTO CategoriaJ VALUES ("Tiro");

-- Insert na entidade Ator

INSERT INTO Ator VALUES (NULL, "Robin Williams", "Drama");
INSERT INTO Ator VALUES (NULL, "Daniel Radcliffe", "Ação");
INSERT INTO Ator VALUES (NULL, "Angelina Jolie","...");
INSERT INTO Ator VALUES (NULL, "Justin Timberlake", "...");

-- Updates 

UPDATE Jogos SET PrecoJogo = Precojogo * 1.05;

UPDATE Filmes SET PrecoFilme = PrecoFilme + TaxaAtrasoFilme;

UPDATE Jogos SET ClasIndicativa = '18' WHERE IdJogo = '3';

UPDATE Funcionario set Funcao = "Subchefe" WHERE IdFuncionario = '2';

UPDATE FILMES SET PRECOFILME = PRECOFILME *1.03 WHERE PRECOFILME between '7.00' AND '9.10';

-- Deletes 

DELETE FROM Cliente WHERE Idjogo = 0;

DELETE FROM Cliente WHERE IdFilme = 0;

DELETE FROM Funcionario WHERE IdFuncionario BETWEEN '2' AND '3';

DELETE FROM Funcionario WHERE TemponaEmpresa BETWEEN '2014-01-23' AND '2014-06-20';

DELETE FROM Cliente WHERE DataEntrega > '2019-11-20';
-- select

Select Count(*) From Jogos;

select idjogo, NomeJogo from jogos Where NomeCatJ <> "Aventura";

Select AVG(Precojogo) From Jogos;

Select Max(Precojogo) From Jogos;

Select Cliente.NomeCliente From Cliente Where
    Cliente.idCliente = (Select Filmes.idfilme from Filmes Where Filmes.NomeFilme = "Compramos um Zoologico");
    
SELECT idcliente, NomeCliente FROM Cliente WHERE NomeCliente LIKE "%R%";    

SELECT  idcliente, nomecliente FROM Cliente INNER JOIN Jogos
    ON Cliente.idjogo = jogos.idjogo
    WHERE nomejogo = "the last of us";
    
SELECT  nomecliente from cliente inner join clienteEnd 
		on cliente.idcliente = clienteEnd.idcliente
        where endereco = "Av.Bernardo Vieira de Melo";

Select idcliente, nomecliente from cliente inner join filmes 
	on cliente.idfilme = filmes.idfilme where filmes.nomecatf = (select nomecatF from categoriaf where nomecatf = "drama");
