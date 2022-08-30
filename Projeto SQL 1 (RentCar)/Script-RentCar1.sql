/*
Tipos de restrições:
	- NOT NULL
	- UNIQUE
	- PRIMARY KEY
	- FOREIGN KEY
	- CHECK
	- DEFAULT
*/

CREATE Database RentCar1
GO

USE RentCar1
Go

DROP TABLE IF EXISTS Telefone
DROP TABLE IF EXISTS Aluguer
DROP TABLE IF EXISTS Viatura
DROP TABLE IF EXISTS Modelo
DROP TABLE IF EXISTS Marca
DROP TABLE IF EXISTS Cliente


CREATE TABLE Marca (
	Id VARCHAR (10) PRIMARY KEY,
	Nome NVARCHAR (50) NOT NULL, 
	AnoFundacao SMALLINT NOT NULL,
	Descricao NVARCHAR (512) NULL,
)

 
CREATE TABLE Cliente (
	Id INT IDENTITY(1,1), --PRIMARY KEY,
	Nome NVARCHAR(50) NOT NULL,
	Apelido NVARCHAR(50) NOT NULL,
	NIF INT NULL,
	Sexo CHAR (1) NOT NULL,
	NumeroCarta VARCHAR (12) NOT NULL,
	DataExpCarta DATE NOT NULL,

	CONSTRAINT PK_Cliente PRIMARY KEY CLUSTERED (Id),
	CONSTRAINT UN_Cliente_NIF UNIQUE (NIF),
	CONSTRAINT UN_Cliente_NumeroCarta UNIQUE (NumeroCarta),
	CONSTRAINT CHK_Cliente_Sexo CHECK (Sexo = 'M' OR Sexo = 'F'),
)
GO

CREATE TABLE Telefone (
	IdCliente INT NOT NULL,
	Telefone VARCHAR (10) NOT NULL,

	CONSTRAINT PK_Telefone PRIMARY KEY CLUSTERED (IdCliente, Telefone),
	CONSTRAINT FK_Telefone_IdCliente FOREIGN KEY (IdCliente) REFERENCES Cliente (Id)
)

GO

CREATE TABLE Modelo(
	Id VARCHAR (20) PRIMARY KEY,
	Nome nvarchar (100) NOT NULL,
	IdMarca varchar (10) NULL,

	CONSTRAINT FK_Modelo_IdMarca FOREIGN KEY (IdMarca) REFERENCES Marca (Id)
)
GO

CREATE TABLE Viatura (
	Matricula VARCHAR (15),
	AnoAquisicao SMALLINT NOT NULL, 
	NIV varchar (20),
	Estado varchar (20) NOT NULL, -- CONSTRAINT DF_Car_Status DEFAULT 'razoavel',
	IdModelo varchar (20),

	CONSTRAINT PK_Viatura PRIMARY KEY CLUSTERED (Matricula),
	CONSTRAINT UN_Viatura_NIV UNIQUE (NIV), 
	CONSTRAINT CHK_Viatura_Estado CHECK (Estado IN ('excelente', 'bom', 'razoavel')),
	CONSTRAINT CHK_Viatura_AnoAquisicao CHECK (AnoAquisicao > 2010),

	CONSTRAINT FK_Viatura_IdModelo FOREIGN KEY (IdModelo) REFERENCES Modelo (Id)
)
GO

-- Adiciona o valor por omissão 'so-so' à coluna Estado da tabela Viatura
ALTER TABLE Viatura
	ADD CONSTRAINT DF_Viatura_Estado
	DEFAULT 'razoavel' FOR Estado;
GO


CREATE TABLE Aluguer (
	Id INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
	Matricula varchar (15) NOT NULL,
	DataAluguer DateTime2 (0) NOT NULL DEFAULT GetDate(),
	DataEstEntrega DateTime2 (0) NOT NULL,
	DataEntrega DateTime2 (0) NULL,
	Valor NUMERIC (9, 2) NOT NULL, 
	Multa NUMERIC (9, 2) NULL,
	IdCliente int NOT NULL,

	CONSTRAINT CHK_Aluguer_Valor CHECK (Valor >= 0),
	CONSTRAINT CHK_Aluguer_Multa CHECK (Valor >= 0),
	
	CONSTRAINT FK_Aluguer_IdCliente FOREIGN KEY (IdCliente) REFERENCES Cliente (Id),
	CONSTRAINT FK_Aluguer_Matricula FOREIGN KEY (Matricula) REFERENCES Viatura (Matricula)
)
GO


/*
	Índices para chaves estrangeiras

-- Sintaxe: CREATE INDEX 
-- CREATE [ CLUSTERED | NONCLUSTERED ] INDEX index_name
--    ON [ database_name . [ schema ] . | schema . ] table_name
--        ( { column [ ASC | DESC ] } [ ,...n ] )
*/

CREATE NONCLUSTERED INDEX IDX_Modelo_IdMarca ON Modelo (IdMarca)
CREATE NONCLUSTERED INDEX IDX_Viatura_IdModelo ON Viatura (IdModelo)

CREATE NONCLUSTERED INDEX IDX_Aluguer_Matricula ON Aluguer (Matricula)
CREATE NONCLUSTERED INDEX IDX_Aluguer_IdCliente ON Aluguer (IdCliente)

CREATE NONCLUSTERED INDEX IDX_Telefone_IdCliente ON Telefone (IdCliente)



-- Ordem na criação
/*
	Marca
	Cliente
	Modelo
	Viatura
	Aluguer
	Telefone
*/

/*
Ordem de remoção
	- Telefone
	- Aluguer
	- Viatura
	- Modelo
	- Cliente
	- Marca
*/
