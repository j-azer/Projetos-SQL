/*
	USE Master
	GO 

	DROP DATABASE IF EXISTS Movies4All
	GO

	CREATE DATABASE Movies4All
	GO

	USE Movies4All
	GO
*/
GO

/******************************************
	Criação de Tabelas 
*******************************************/

DROP TABLE IF EXISTS Precario
DROP TABLE IF EXISTS Episodio
DROP TABLE IF EXISTS Temporada
DROP TABLE IF EXISTS Participar
DROP TABLE IF EXISTS Ator
DROP TABLE IF EXISTS Avaliar
DROP TABLE IF EXISTS Aluguer
DROP TABLE IF EXISTS Show
DROP TABLE IF EXISTS Telemovel
DROP TABLE IF EXISTS Cartao
DROP TABLE IF EXISTS Associar
DROP TABLE IF EXISTS Utilizador

-- done 
CREATE TABLE Utilizador (
	Id INT IDENTITY (1, 1) PRIMARY KEY,
	Nome NVARCHAR (128) NOT NULL,
	NumFiscal  VARCHAR (10) NOT NULL,
	Email VARCHAR (255) NOT NULL,

	CONSTRAINT UN_Utilizador_NIF UNIQUE (NumFiscal)
)
GO

-- done
CREATE TABLE Telemovel (
	IdUtilizador INT,
	Telemovel VARCHAR(30),

	CONSTRAINT PK_Telemovel PRIMARY KEY CLUSTERED (IdUtilizador, Telemovel),
	CONSTRAINT FK_Telemovel_Utilizador FOREIGN KEY (IdUtilizador) REFERENCES Utilizador (Id)
)
GO

--done
CREATE TABLE Cartao (
  Id int NOT NULL PRIMARY KEY,
  Ano SMALLINT NOT NULL,
  Mes TINYINT NOT NULL,
  Numero VARCHAR (20) NOT NULL,
  CVC VARCHAR(4) NOT NULL,
  Nome VARCHAR(25) NOT NULL,
  IdUtilizador INT NOT NULL,

   CONSTRAINT FK_Cartao_IdUtilizador FOREIGN KEY (Idutilizador) REFERENCES Utilizador (Id)
)

-- done
CREATE TABLE Associar (
	IdAssociado INT PRIMARY KEY,
	IdUtilizador INT,
	
	CONSTRAINT FK_Associar_Associado FOREIGN KEY (IdAssociado) REFERENCES Utilizador (Id),
	CONSTRAINT FK_Associar_Utilizador FOREIGN KEY (IdUtilizador) REFERENCES Utilizador (Id),
	
	CONSTRAINT CHK_Associar_IdAssociado CHECK ( IdAssociado <> IdUtilizador)
)
GO

--done
CREATE TABLE Show (
	Id INT IDENTITY (1, 1) PRIMARY KEY,
	TipoShow VARCHAR(20) NOT NULL,	
	Titulo NVARCHAR(50) NOT NULL,
	Descricao VARCHAR(2000),
	AnoLancamento SMALLINT NOT NULL,
	CodPais CHAR(2) NOT NULL,

	CONSTRAINT CHK_Show_Tipo CHECK ( TipoShow IN ('Filme', 'Documentario', 'Serie'))
)
GO

--done
CREATE TABLE Aluguer (
	Id INT IDENTITY (1, 1) PRIMARY KEY,
	MetodoPag VARCHAR (10) NOT NULL,
	Valor NUMERIC(8,4) NOT NULL,
	Data DATETIME2(0) NOT NULL,
	DataFim DATETIME2(0) NULL,
	IdShow INT NOT NULL,
	IdUtilizador INT NOT NULL,

	CONSTRAINT CHK_Aluguer_MetodoPag CHECK (MetodoPag IN ('Débito', 'Crédito')),
	CONSTRAINT FK_Aluguer_IdShow FOREIGN KEY (IdShow) REFERENCES Show (Id),
	CONSTRAINT FK_Aluguer_IdUtilizador FOREIGN KEY (IdUtilizador) REFERENCES Utilizador (Id)
)
GO

-- done
CREATE TABLE Avaliar (
	IdUtilizador INT,
	IdShow INT,
	Stars TINYINT NOT NULL,
	Descricao NVARCHAR(2000) NULL,
	DescricaoEN NVARCHAR(2000) NULL,
	DataCriacao DATETIME2(7) NOT NULL DEFAULT (GETDATE()),	
	DataUpdate DATETIME2 (7) NULL,

	CONSTRAINT PK_Avaliar_IdShow_IdUtilizador PRIMARY KEY (IdUtilizador, IdShow),	
	CONSTRAINT CHK_Avaliacao_Quantitativo CHECK (stars BETWEEN 1 AND 5),
	CONSTRAINT FK_Avaliacao_Utilizador FOREIGN KEY (IdUtilizador) REFERENCES Utilizador (Id),
	CONSTRAINT FK_Avaliacao_Show FOREIGN KEY (IdShow) REFERENCES Show (Id)
)
GO


--done
CREATE TABLE Ator (
	Nickname VARCHAR (20) PRIMARY KEY,
	Nome NVARCHAR (100) NOT NULL,
	Genero CHAR (1) NOT NULL,
	
	CONSTRAINT CHK_Ator_Genero CHECK ( Genero IN ('M', 'F'))
)
GO

--done
CREATE TABLE Participar (
	AtorNickname VARCHAR (20),
	IdShow INT,
	
	CONSTRAINT PK_Integrar PRIMARY KEY CLUSTERED (AtorNickname, IdShow),
	CONSTRAINT FK_Integrar_Ator FOREIGN KEY (AtorNickname) REFERENCES Ator (Nickname),
	CONSTRAINT FK_Integrar_Show FOREIGN KEY (IdShow) REFERENCES Show (Id)
)
GO

-- done
CREATE TABLE Temporada (
	Id INT IDENTITY (1, 1) PRIMARY KEY,
	Nome NVARCHAR (100) NOT NULL,
	Numero TINYINT NOT NULL,
	IdShow INT,
	
	CONSTRAINT FK_Temporada_Show FOREIGN KEY (IdShow) REFERENCES Show (Id)
)
GO


--done
CREATE TABLE Episodio (
	Id INT IDENTITY (1, 1) PRIMARY KEY,
	Nome NVARCHAR (100) NOT NULL,
	Numero TINYINT NOT NULL,
	Data DATETIME2(0) NOT NULL,
	IdTemporada INT NOT NULL,
	
	CONSTRAINT FK_Episodio_Temporada FOREIGN KEY (IdTemporada) REFERENCES Temporada (Id)
)
GO


CREATE TABLE Precario (
	Id INT IDENTITY (1, 1) PRIMARY KEY,
	TipoShow VARCHAR (20) NOT NULL,
	DataInicio DATETIME2(0) NOT NULL,
	DataFim DATETIME2(0) NULL,
	Preco DECIMAL(8,4) NOT NULL,
	PeriodoDias TINYINT NOT NULL,

	CONSTRAINT CHK_Precario_TipoShow CHECK (TipoShow IN ('Filme', 'Documentario', 'Serie')),
)
GO



/******************************************
	Índices para chaves estrangeiras
*******************************************/
DROP INDEX IF EXISTS IDX_Cartao_IdUtilizador ON Cartao
-- do all the others ...


CREATE NONCLUSTERED INDEX IDX_Cartao_IdUtilizador ON Cartao (IdUtilizador)
-- do all the others..

GO
