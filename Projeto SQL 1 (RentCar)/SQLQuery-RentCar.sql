
-- Criando tabela

USE RentCar
CREATE TABLE Cliente
(
	Id INT IDENTITY(1,1) PRIMARY KEY
	PrimeiroNome NVARCHAR(50) NOT NULL
	Sobrenome NVARCHAR(50) NOT NULL
	Sexo CHAR(1) NOT NULL
	NIF VARCHAR(20) NOT NULL
	NumCarta VARCHAR(20) NOT NULL
	DataExpCarta DATE NOT NULL
)


-- Criando tabela

USE RentCar

CREATE TABLE Aluguer
(
	Id INT IDENTITY(1,1) PRIMARY KEY
	Valor NVARCHAR(15) NOT NULL
	Multa NVARCHAR(15) NOT NULL
	DataAluguer DATE NOT NULL
	DataEntrega DATE NOT NULL
	DataEstEntrega DATE NOT NULL
)


-- Criando tabela

CREATE TABLE Viatura
(
	Matricula NVARCHAR(15) PRIMARY KEY
	Estado NVARCHAR(15) NOT NULL
	NIV INT IDENTITY(1,1) NOT NULL
	AnoAquisicao DATE NOT NULL
)


-- Criando tabela

CREATE TABLE Modelo
(
	Id INT IDENTITY(1,1) PRIMARY KEY
	Nome VARCHAR(50) NOT NULL
)


-- Inserindo coluna na Tabela Modelo

USE RentCar
GO

ALTER TABLE dbo.Modelo ADD IdMarca INT NOT NULL
GO


-- Inserindo coluna na Tabela Viatura

USE RentCar
GO

ALTER TABLE dbo.Viatura ADD IdModelo INT NOT NULL
GO


-- Inserindo 2 colunas na Tabela Aluguer

USE RentCar
GO

ALTER TABLE dbo.Aluguer ADD IdCliente INT NOT NULL
GO

ALTER TABLE dbo.Aluguer ADD MatViatura NVARCHAR(15) NOT NULL
GO


-- Inserindo uma FOREIGN KEY na dbo.Modelo

ALTER TABLE dbo.Modelo ADD CONSTRAINT FK1_Modelo_Marca FOREIGN KEY (IdMarca) REFERENCES dbo.Marca (Id)
GO


-- Inserindo uma FOREIGN KEY na dbo.Viatura

ALTER TABLE dbo.Viatura ADD CONSTRAINT FK1_Viatura_Modelo FOREIGN KEY (IdModelo) REFERENCES dbo.Modelo (Id)
GO


-- Inserindo duas FOREIGN KEY na dbo.Aluguer

ALTER TABLE dbo.Aluguer ADD CONSTRAINT FK1_Aluguer_Cliente FOREIGN KEY (IdCliente) REFERENCES dbo.Cliente (Id)
GO

ALTER TABLE dbo.Aluguer ADD CONSTRAINT FK2_Aluguer_Viatura FOREIGN KEY (MatViatura) REFERENCES dbo.Viatura (Matricula)
GO


-- Inserindo uma FOREIGN KEY na dbo.Telefone

ALTER TABLE dbo.Telefone ADD CONSTRAINT FK1_Telefone_Cliente FOREIGN KEY (IdCliente) REFERENCES dbo.Cliente (Id)
GO


-- Inserindo um INDEX na dbo.Modelo

CREATE INDEX Idx_Modelo_IdMarca ON dbo.Modelo (IdMarca)
GO


-- Inserindo um INDEX na dbo.Viatura

CREATE INDEX Idx_Viatura_IdModelo ON dbo.Viatura (IdModelo)
GO


-- Inserindo um INDEX na dbo.Telefone

CREATE INDEX Idx_Telefone_IdCliente ON dbo.Telefone (IdCliente)
GO


-- Inserindo (alimentando) informações na Tabela Viatura

USE RentCar
GO

insert into Viatura (Matricula, AnoAquisicao, NIV) values ('3VWKX7', 2021, 1)
insert into Viatura (Matricula, AnoAquisicao, NIV) values ('3D73Y4', 2019, 2)
insert into Viatura (Matricula, AnoAquisicao, NIV) values ('WAUJC5', 2018, 3)
insert into Viatura (Matricula, AnoAquisicao, NIV) values ('5TDBM5', 2019, 4)
insert into Viatura (Matricula, AnoAquisicao, NIV) values ('1GD21Z', 2019, 5)
insert into Viatura (Matricula, AnoAquisicao, NIV) values ('3GYT4L', 2018, 6)
insert into Viatura (Matricula, AnoAquisicao, NIV) values ('JN8AZ2', 2016, 7)
insert into Viatura (Matricula, AnoAquisicao, NIV) values ('1G4HJ5', 2019, 8)
insert into Viatura (Matricula, AnoAquisicao, NIV) values ('ZHWGU5', 2018, 9)
insert into Viatura (Matricula, AnoAquisicao, NIV) values ('1G6YX3', 2016, 10)
insert into Viatura (Matricula, AnoAquisicao, NIV) values ('SCFEBB', 2016, 11)
insert into Viatura (Matricula, AnoAquisicao, NIV) values ('5N1AR1', 2017, 12)
insert into Viatura (Matricula, AnoAquisicao, NIV) values ('JTHBE1', 2019, 13)
insert into Viatura (Matricula, AnoAquisicao, NIV) values ('YK1CV6', 2021, 14)
insert into Viatura (Matricula, AnoAquisicao, NIV) values ('KMHEC4', 2019, 15)
GO


-- Inserindo (alimentando) informações na Tabela Marca

USE RentCar
GO

insert into dbo.Marca (Id, Nome, AnoFundacao, Descricao) values (1, 'Ford', 1986, 'Cross-group zero tolerance moratorium');
insert into dbo.Marca (Id, Nome, AnoFundacao, Descricao) values (2, 'Aston Martin', 2006, 'Up-sized bottom-line moderator');
insert into dbo.Marca (Id, Nome, AnoFundacao, Descricao) values (3, 'Dodge', 1992, 'Configurable scalable attitude');
insert into dbo.Marca (Id, Nome, AnoFundacao, Descricao) values (4, 'Suzuki', 1996, 'Front-line content-based system engine');
insert into dbo.Marca (Id, Nome, AnoFundacao, Descricao) values (5, 'Toyota', 1992, 'Advanced 24 hour migration');
insert into dbo.Marca (Id, Nome, AnoFundacao, Descricao) values (6, 'Land Rover', 2007, 'Optional secondary artificial intelligence');
insert into dbo.Marca (Id, Nome, AnoFundacao, Descricao) values (7, 'Kia', 1996, 'Triple-buffered demand-driven adapter');
insert into dbo.Marca (Id, Nome, AnoFundacao, Descricao) values (8, 'Chrysler', 1993, 'Synergistic transitional matrices');
insert into dbo.Marca (Id, Nome, AnoFundacao, Descricao) values (9, 'VW', 2006, 'Mandatory dedicated software');
insert into dbo.Marca (Id, Nome, AnoFundacao, Descricao) values (10, 'Mercedes-Benz', 1998, 'Automated web-enabled conglomeration');
insert into dbo.Marca (Id, Nome, AnoFundacao, Descricao) values (11, 'Chevrolet', 1996, 'Switchable intermediate analyzer');
insert into dbo.Marca (Id, Nome, AnoFundacao, Descricao) values (12, 'BMW', 2005, 'Streamlined high-level help-desk');
insert into dbo.Marca (Id, Nome, AnoFundacao, Descricao) values (13, 'Gurgel', 1984, 'Self-enabling background middleware');
insert into dbo.Marca (Id, Nome, AnoFundacao, Descricao) values (14, 'GMC', 1997, 'Front-line uniform alliance');
insert into dbo.Marca (Id, Nome, AnoFundacao, Descricao) values (15, 'Hyundai', 2009, 'Progressive asynchronous contingency');


-- Inserindo (alimentando) informações na Tabela Cliente

USE RentCar
GO

insert into dbo.Cliente (Nome, Apelido, NIF, Sexo, NumeroCarta, DataExpCarta) values ('Kimmie', 'Floweth', '7706902161', 'F', '69-114-8627', '11/7/2021');
insert into dbo.Cliente (Nome, Apelido, NIF, Sexo, NumeroCarta, DataExpCarta) values ('Berti', 'Minall', '0806823437', 'M', '03-021-2494', '3/18/2022');
insert into dbo.Cliente (Nome, Apelido, NIF, Sexo, NumeroCarta, DataExpCarta) values ('Jerome', 'MacTrusty', '6341061455', 'M', '44-256-4738', '8/7/2021');
insert into dbo.Cliente (Nome, Apelido, NIF, Sexo, NumeroCarta, DataExpCarta) values ('Lisette', 'Bach', '9296589940', 'F', '81-039-3084', '3/28/2022');
insert into dbo.Cliente (Nome, Apelido, NIF, Sexo, NumeroCarta, DataExpCarta) values ('Silvano', 'Scollard', '5386905724', 'M', '91-720-6890', '4/23/2022');
insert into dbo.Cliente (Nome, Apelido, NIF, Sexo, NumeroCarta, DataExpCarta) values ('Victoir', 'Colombier', '3737429537', 'M', '10-191-3897', '4/21/2022');
insert into dbo.Cliente (Nome, Apelido, NIF, Sexo, NumeroCarta, DataExpCarta) values ('Vito', 'Isaksson', '6595553392', 'M', '73-075-1880', '7/31/2021');
insert into dbo.Cliente (Nome, Apelido, NIF, Sexo, NumeroCarta, DataExpCarta) values ('Tillie', 'Francois', '3152914539', 'F', '16-243-3747', '12/18/2021');
insert into dbo.Cliente (Nome, Apelido, NIF, Sexo, NumeroCarta, DataExpCarta) values ('Giacomo', 'Dosdell', '0973003472', 'M', '73-649-1578', '3/10/2022');
insert into dbo.Cliente (Nome, Apelido, NIF, Sexo, NumeroCarta, DataExpCarta) values ('Rosmunda', 'Kunkel', '6880309682', 'F', '01-762-0531', '9/17/2021');
insert into dbo.Cliente (Nome, Apelido, NIF, Sexo, NumeroCarta, DataExpCarta) values ('Alvira', 'Willmont', '2404217216', 'F', '55-585-9779', '8/19/2021');
insert into dbo.Cliente (Nome, Apelido, NIF, Sexo, NumeroCarta, DataExpCarta) values ('Arlin', 'Gedge', '0728715260', 'M', '81-882-4416', '3/23/2022');
insert into dbo.Cliente (Nome, Apelido, NIF, Sexo, NumeroCarta, DataExpCarta) values ('Daniella', 'Binfield', '3043181298', 'F', '82-979-2568', '8/8/2021');
insert into dbo.Cliente (Nome, Apelido, NIF, Sexo, NumeroCarta, DataExpCarta) values ('Cherianne', 'Garriock', '8765734270', 'F', '66-881-9947', '9/27/2021');
insert into dbo.Cliente (Nome, Apelido, NIF, Sexo, NumeroCarta, DataExpCarta) values ('Jemie', 'Gianiello', '5810932509', 'F', '30-207-1685', '2/18/2022');


-- Inserindo (alimentando) informações na Tabela Telefone

USE RentCar
GO

insert into dbo.Telefone (IdCliente, Telefone) values (1, '9364837942');
insert into dbo.Telefone (IdCliente, Telefone) values (2, '9265342921');
insert into dbo.Telefone (IdCliente, Telefone) values (3, '7082227238');
insert into dbo.Telefone (IdCliente, Telefone) values (4, '8699956891');
insert into dbo.Telefone (IdCliente, Telefone) values (5, '3585896355');
insert into dbo.Telefone (IdCliente, Telefone) values (6, '7328665527');
insert into dbo.Telefone (IdCliente, Telefone) values (7, '9878935122');
insert into dbo.Telefone (IdCliente, Telefone) values (9, '1743666470');
insert into dbo.Telefone (IdCliente, Telefone) values (8, '7766584977');
insert into dbo.Telefone (IdCliente, Telefone) values (10, '4137839168');
insert into dbo.Telefone (IdCliente, Telefone) values (11, '7048149055');
insert into dbo.Telefone (IdCliente, Telefone) values (12, '5512365248');
insert into dbo.Telefone (IdCliente, Telefone) values (13, '2014125582');
insert into dbo.Telefone (IdCliente, Telefone) values (14, '6823339197');
insert into dbo.Telefone (IdCliente, Telefone) values (15, '6712954030');



-- Inserindo (alimentando) informações na Tabela Modelo

USE RentCar
GO

insert into dbo.Modelo (Id, Nome, IdMarca) values (1, 'Accord', 1);
insert into dbo.Modelo (Id, Nome, IdMarca) values (2, 'XC90', 2);
insert into dbo.Modelo (Id, Nome, IdMarca) values (3, 'Lumina', 3);
insert into dbo.Modelo (Id, Nome, IdMarca) values (4, 'Seville', 4);
insert into dbo.Modelo (Id, Nome, IdMarca) values (5, 'Baja', 5);
insert into dbo.Modelo (Id, Nome, IdMarca) values (6, 'Firebird', 6);
insert into dbo.Modelo (Id, Nome, IdMarca) values (7, 'GT-R', 7);
insert into dbo.Modelo (Id, Nome, IdMarca) values (8, 'Monte Carlo', 8);
insert into dbo.Modelo (Id, Nome, IdMarca) values (9, 'LR3', 9);
insert into dbo.Modelo (Id, Nome, IdMarca) values (10, 'Viper', 10);
insert into dbo.Modelo (Id, Nome, IdMarca) values (11, 'Rio', 11);
insert into dbo.Modelo (Id, Nome, IdMarca) values (12, 'V70', 12);
insert into dbo.Modelo (Id, Nome, IdMarca) values (13, 'Virage', 13);
insert into dbo.Modelo (Id, Nome, IdMarca) values (14, 'Silverado 3500', 14);
insert into dbo.Modelo (Id, Nome, IdMarca) values (15, 'SJ 410', 15);



-- Inserindo (alimentando) informações na Tabela Aluguer

USE RentCar
GO


insert into dbo.Aluguer (IdCliente, Matricula, DataAluguer, DataEstEntrega, DataEntrega, Valor, Multa) values (1, '3VWKX7', '1/26/2021', '3/28/2021', null, 421.57, null);
insert into dbo.Aluguer (IdCliente, Matricula, DataAluguer, DataEstEntrega, DataEntrega, Valor, Multa) values (2, '3D73Y4', '1/18/2021', '3/14/2021', null, 377.68, null);
insert into dbo.Aluguer (IdCliente, Matricula, DataAluguer, DataEstEntrega, DataEntrega, Valor, Multa) values (3, 'WAUJC5', '1/11/2021', '3/11/2021', null, 576.87, null);
insert into dbo.Aluguer (IdCliente, Matricula, DataAluguer, DataEstEntrega, DataEntrega, Valor, Multa) values (4, '5TDBM5', '1/2/2021', '3/10/2021', null, 113.47, null);
insert into dbo.Aluguer (IdCliente, Matricula, DataAluguer, DataEstEntrega, DataEntrega, Valor, Multa) values (5, '1GD21Z', '1/26/2021', '3/13/2021', null, 433.22, null);
insert into dbo.Aluguer (IdCliente, Matricula, DataAluguer, DataEstEntrega, DataEntrega, Valor, Multa) values (6, '3GYT4L', '1/9/2021', '3/19/2021', null, 279.07, null);
insert into dbo.Aluguer (IdCliente, Matricula, DataAluguer, DataEstEntrega, DataEntrega, Valor, Multa) values (7, 'JN8AZ2', '1/21/2021', '3/1/2021', '3/15/2021', 482.93, 239.67);
insert into dbo.Aluguer (IdCliente, Matricula, DataAluguer, DataEstEntrega, DataEntrega, Valor, Multa) values (8, '1G4HJ5', '1/20/2021', '3/4/2021', null, 860.43, null);
insert into dbo.Aluguer (IdCliente, Matricula, DataAluguer, DataEstEntrega, DataEntrega, Valor, Multa) values (9, 'ZHWGU5',  '1/7/2021', '3/23/2021', null, 626.74, null);
insert into dbo.Aluguer (IdCliente, Matricula, DataAluguer, DataEstEntrega, DataEntrega, Valor, Multa) values (10, '1G6YX3', '1/24/2021', '3/20/2021', '3/30/2021', 771.44, 113.47);
insert into dbo.Aluguer (IdCliente, Matricula, DataAluguer, DataEstEntrega, DataEntrega, Valor, Multa) values (11, 'SCFEBB', '1/7/2021', '3/28/2021', null, 1059.67, null);
insert into dbo.Aluguer (IdCliente, Matricula, DataAluguer, DataEstEntrega, DataEntrega, Valor, Multa) values (12, '5N1AR1', '1/25/2021', '3/19/2021', null, 1004.48, null);
insert into dbo.Aluguer (IdCliente, Matricula, DataAluguer, DataEstEntrega, DataEntrega, Valor, Multa) values (13, 'JTHBE1', '1/23/2021', '3/21/2021', '4/21/2021', 801.89, 279.07);
insert into dbo.Aluguer (IdCliente, Matricula, DataAluguer, DataEstEntrega, DataEntrega, Valor, Multa) values (14, 'JN1CV6', '1/7/2021', '3/28/2021', null, 74.21, null);
insert into dbo.Aluguer (IdCliente, Matricula, DataAluguer, DataEstEntrega, DataEntrega, Valor, Multa) values (15, 'KMHEC4', '1/14/2021', '3/8/2021', '4/8/2021', 239.67, 433.22);


