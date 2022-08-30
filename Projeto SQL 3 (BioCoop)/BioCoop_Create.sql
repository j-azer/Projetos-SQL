
USE master
GO

DROP DATABASE IF EXISTS BioCoop_JonathasAzer
GO

CREATE DATABASE BioCoop_JonathasAzer
GO

USE BioCoop_JonathasAzer
GO



/******************************************
	Criação de Tabelas 
*******************************************/


DROP TABLE IF EXISTS Referir
DROP TABLE IF EXISTS TelefoneCliente
DROP TABLE IF EXISTS Subscrever
DROP TABLE IF EXISTS Autorizar
DROP TABLE IF EXISTS Associar
DROP TABLE IF EXISTS DetalheCabaz
DROP TABLE IF EXISTS HistoricoPreco
DROP TABLE IF EXISTS Cabaz
DROP TABLE IF EXISTS Produto
DROP TABLE IF EXISTS Categoria
DROP TABLE IF EXISTS Associado
DROP TABLE IF EXISTS Cliente
DROP TABLE IF EXISTS Plano
DROP TABLE IF EXISTS Cooperativa

GO

--------------------------------------------------------------------------------------------------------
CREATE TABLE Cooperativa 

(
	Codigo INT IDENTITY (1, 1) PRIMARY KEY,
	Nome NVARCHAR (128) NOT NULL,
	Email NVARCHAR (255) NOT NULL,
	Nif  NVARCHAR (20) NOT NULL,
	Telefone NVARCHAR(20) NOT NULL,
	CoordWhat3 NVARCHAR(30) NOT NULL,

	CONSTRAINT UN_Cooperativa_Nif UNIQUE (Nif),

)
GO


--------------------------------------------------------------------------------------------------------
CREATE TABLE Plano

(
	Codigo INT IDENTITY (1, 1) PRIMARY KEY,
	Nome NVARCHAR (128) NOT NULL,
	Descricao NVARCHAR (385) NOT NULL,
	Preco  DECIMAL (8,2) NOT NULL,
	Ativo CHAR(3) NOT NULL,


	CONSTRAINT CHK_Plano_Ativo CHECK (Ativo IN ('Sim', 'Não')),

)
GO


--------------------------------------------------------------------------------------------------------
CREATE TABLE Cliente 

(
	Id INT IDENTITY (1, 1) PRIMARY KEY,
	Nome NVARCHAR (50) NOT NULL,
	Apelido NVARCHAR (128) NOT NULL,
	Email NVARCHAR (256) NOT NULL,
	Sexo CHAR (1) NOT NULL,
	Nif  VARCHAR (15) NOT NULL,
	CoordWhat3 NVARCHAR(30) NOT NULL,
	CodigoCooperativa INT NOT NULL,


	CONSTRAINT UN_Cliente_Nif UNIQUE (Nif),

	CONSTRAINT CHK_Cliente_Sexo CHECK (Sexo IN ('M', 'F')),

	CONSTRAINT FK_CLiente_CodigoCooperativa FOREIGN KEY (CodigoCooperativa) REFERENCES Cooperativa (Codigo),

)
GO


--------------------------------------------------------------------------------------------------------
CREATE TABLE Associado 

(
	Id INT IDENTITY (1, 1) PRIMARY KEY,
	Nome NVARCHAR (128) NOT NULL,
	Nif  VARCHAR (15) NOT NULL,
	Telefone NVARCHAR(20) NOT NULL,
	CodigoCooperativa INT NOT NULL,

	CONSTRAINT UN_Associado_Nif UNIQUE (Nif),

	CONSTRAINT FK_Associado_CodigoCooperativa FOREIGN KEY (CodigoCooperativa) REFERENCES Cooperativa (Codigo),

)
GO


--------------------------------------------------------------------------------------------------------
CREATE TABLE Categoria 

(
	Id INT IDENTITY (1, 1) PRIMARY KEY,
	Nome NVARCHAR (50) NOT NULL,
	CodigoCooperativa INT NOT NULL,

	CONSTRAINT FK_Categoria_CodigoCooperativa FOREIGN KEY (CodigoCooperativa) REFERENCES Cooperativa (Codigo),

)
GO


--------------------------------------------------------------------------------------------------------
CREATE TABLE Produto 

(
	Id INT IDENTITY (1, 1) PRIMARY KEY,
	Nome NVARCHAR (50) NOT NULL,
	Unidade  CHAR (2) NOT NULL,
	PrecoAtual  DECIMAL (8,2) NOT NULL,
	IdCategoria INT NOT NULL,
	CodigoCooperativa INT NOT NULL,

	CONSTRAINT CHK_Produto_Unidade CHECK (Unidade IN ('kg', 'g', 'mg', 'l', 'cl', 'ml', 'un')),

	CONSTRAINT FK_Produto_IdCategoria FOREIGN KEY (IdCategoria) REFERENCES Categoria (Id),
				  
	CONSTRAINT FK_Produto_CodigoCooperativa FOREIGN KEY (CodigoCooperativa) REFERENCES Cooperativa (Codigo),

)
GO


--------------------------------------------------------------------------------------------------------
CREATE TABLE Cabaz

(
	Id INT IDENTITY (1, 1) PRIMARY KEY,
	Data DATETIME2 (0) NOT NULL DEFAULT (GETDATE()),
	PrecoTotal  DECIMAL (8,2) NOT NULL,
	CodigoPlano INT NOT NULL,
	IdAssociado INT NOT NULL,
	IdCliente INT NOT NULL,


	CONSTRAINT FK_Cabaz_CodigoPlano FOREIGN KEY (CodigoPlano) REFERENCES Plano (Codigo),
				
	CONSTRAINT FK_Cabaz_IdAssociado FOREIGN KEY (IdAssociado) REFERENCES Associado (Id),
			
	CONSTRAINT FK_Cabaz_IdCliente FOREIGN KEY (IdCliente) REFERENCES Cliente (Id),
)
GO


--------------------------------------------------------------------------------------------------------
CREATE TABLE HistoricoPreco

(
	Id INT IDENTITY (1, 1) PRIMARY KEY,
	Preco  DECIMAL (8,2) NOT NULL,
	DataInicio DATETIME2 (0) NOT NULL DEFAULT (GETDATE()),
	DataFim DATETIME2 (0) NOT NULL,
	IdProduto INT NOT NULL,

			
	CONSTRAINT FK_HistoricoPreco_IdProduto FOREIGN KEY (IdProduto) REFERENCES Produto (Id),
)
GO


----------------------------------------------------------------------------------------------------------
CREATE TABLE DetalheCabaz

(
	Id INT IDENTITY (1, 1) PRIMARY KEY,
	Qtd NUMERIC (8,2) NOT NULL,
	Preco  DECIMAL (8,2) NOT NULL,
	PrecoUnit  DECIMAL (8,2) NOT NULL,
	IdCabaz INT NOT NULL,
	IdProduto INT NOT NULL,


	CONSTRAINT FK_DetalheCabaz_IdCabaz FOREIGN KEY (IdCabaz) REFERENCES Cabaz (Id),
			
	CONSTRAINT FK_DetalheCabaz_IdProduto FOREIGN KEY (IdProduto) REFERENCES Produto (Id),
)
GO


--------------------------------------------------------------------------------------------------------
CREATE TABLE Associar 

(
	IdAssociado INT NOT NULL,
	IdCliente INT PRIMARY KEY,
	Data DATETIME2 (0) NOT NULL DEFAULT (GETDATE()),
	Ativo CHAR(3) NOT NULL DEFAULT ('Não'),
	Motivo NVARCHAR (385) ,
	

	CONSTRAINT FK_Associar_IdAssociado FOREIGN KEY (IdAssociado) REFERENCES Associado (Id),

	CONSTRAINT FK_Associar_IdCliente FOREIGN KEY (IdCliente) REFERENCES Cliente (Id),

	CONSTRAINT CHK_Associar_Ativo CHECK (Ativo IN ('Sim', 'Não')),

)
GO


--------------------------------------------------------------------------------------------------------
CREATE TABLE Autorizar 

(
	IdAssociado INT,
	IdProduto INT,
	Data DATETIME2 (0) NOT NULL DEFAULT (GETDATE()),
	IsBlocked CHAR(3) NOT NULL DEFAULT ('Sim'),
	
	CONSTRAINT PK_Autorizar PRIMARY KEY CLUSTERED (IdAssociado, IdProduto),

	CONSTRAINT FK_Autorizar_IdAssociado FOREIGN KEY (IdAssociado) REFERENCES Associado (Id),

	CONSTRAINT FK_Autorizar_IdProduto FOREIGN KEY (IdProduto) REFERENCES Produto (Id),

	CONSTRAINT CHK_Autorizar_IsBlocked CHECK (IsBlocked IN ('Sim', 'Não')),

)
GO


--------------------------------------------------------------------------------------------------------
CREATE TABLE Subscrever

(
	IdCliente INT,
	CodigoPlano INT,
	Data DATETIME2 (0) NOT NULL DEFAULT (GETDATE()),
	

	CONSTRAINT PK_Subscrever PRIMARY KEY CLUSTERED (IdCliente, CodigoPlano),

	CONSTRAINT FK_Subscrever_IdCliente FOREIGN KEY (IdCliente) REFERENCES Cliente (Id),

	CONSTRAINT FK_Subscrever_CodigoPlano FOREIGN KEY (CodigoPlano) REFERENCES Plano (Codigo),

)
GO


--------------------------------------------------------------------------------------------------------
CREATE TABLE TelefoneCliente

(
	IdCliente INT,
	Telefone NVARCHAR(20),

	CONSTRAINT PK_TelefoneCliente PRIMARY KEY CLUSTERED (IdCliente, Telefone),
	
	CONSTRAINT FK_TelefoneCliente_IdCliente FOREIGN KEY (IdCliente) REFERENCES Cliente (Id),
)
GO


--------------------------------------------------------------------------------------------------------
CREATE TABLE Referir

(
	IdCategoria INT PRIMARY KEY,
	IdParentCategoria INT ,
	
	CONSTRAINT FK_Referir_IdParentCategoria FOREIGN KEY (IdParentCategoria) REFERENCES Categoria (Id),

	CONSTRAINT FK_Referir_IdCategoria FOREIGN KEY (IdCategoria) REFERENCES Categoria (Id),

	CONSTRAINT CHK_Referir_IdParentCategoria CHECK ( IdParentCategoria <> IdCategoria ),

)

GO




/******************************************
	Índices para chaves estrangeiras
*******************************************/


DROP INDEX IF EXISTS IDX_CLiente_CodigoCooperativa ON Cliente 

DROP INDEX IF EXISTS IDX_Associado_CodigoCooperativa ON Associado 

DROP INDEX IF EXISTS IDX_Categoria_CodigoCooperativa ON Categoria

DROP INDEX IF EXISTS IDX_Produto_IdCategoria ON Produto 

DROP INDEX IF EXISTS IDX_Produto_CodigoCooperativa ON Produto 

DROP INDEX IF EXISTS IDX_Cabaz_CodigoPlano ON Cabaz 

DROP INDEX IF EXISTS IDX_Cabaz_IdAssociado ON Cabaz 

DROP INDEX IF EXISTS IDX_Cabaz_IdCliente ON Cabaz 

DROP INDEX IF EXISTS IDX_HistoricoPreco_IdProduto ON HistoricoPreco

DROP INDEX IF EXISTS IDX_DetalheCabaz_IdCabaz ON DetalheCabaz 

DROP INDEX IF EXISTS IDX_DetalheCabaz_IdProduto ON DetalheCabaz

DROP INDEX IF EXISTS IDX_Associar_IdAssociado ON Associar 

DROP INDEX IF EXISTS IDX_Associar_IdCliente ON Associar 

DROP INDEX IF EXISTS IDX_Autorizar_IdAssociado ON Autorizar

DROP INDEX IF EXISTS IDX_Autorizar_IdProduto ON Autorizar 

DROP INDEX IF EXISTS IDX_Subscrever_IdCliente ON Subscrever

DROP INDEX IF EXISTS IDX_Subscrever_CodigoPlano ON Subscrever

DROP INDEX IF EXISTS IDX_TelefoneCliente_IdCliente ON TelefoneCliente

DROP INDEX IF EXISTS IDX_Referir_IdCategoria ON Referir

DROP INDEX IF EXISTS IDX_Referir_IdParentCategoria ON Referir

GO



CREATE NONCLUSTERED INDEX IDX_CLiente_CodigoCooperativa ON Cliente (CodigoCooperativa)

CREATE NONCLUSTERED INDEX IDX_Associado_CodigoCooperativa ON Associado (CodigoCooperativa)

CREATE NONCLUSTERED INDEX IDX_Categoria_CodigoCooperativa ON Categoria (CodigoCooperativa) 

CREATE NONCLUSTERED INDEX  IDX_Produto_IdCategoria ON Produto (IdCategoria)

CREATE NONCLUSTERED INDEX  IDX_Produto_CodigoCooperativa ON Produto (CodigoCooperativa)

CREATE NONCLUSTERED INDEX IDX_Cabaz_CodigoPlano ON Cabaz (CodigoPlano) 

CREATE NONCLUSTERED INDEX IDX_Cabaz_IdAssociado ON Cabaz (IdAssociado) 

CREATE NONCLUSTERED INDEX IDX_Cabaz_IdCliente ON Cabaz (IdCliente)

CREATE NONCLUSTERED INDEX IDX_HistoricoPreco_IdProduto ON HistoricoPreco (IdProduto)

CREATE NONCLUSTERED INDEX IDX_DetalheCabaz_IdCabaz ON DetalheCabaz (IdCabaz)

CREATE NONCLUSTERED INDEX IDX_DetalheCabaz_IdProduto ON DetalheCabaz (IdProduto)

CREATE NONCLUSTERED INDEX IDX_Associar_IdAssociado ON Associar (IdAssociado)

CREATE NONCLUSTERED INDEX IDX_Associar_IdCliente ON Associar (IdCliente)

CREATE NONCLUSTERED INDEX IDX_Autorizar_IdAssociado ON Autorizar (IdAssociado) 

CREATE NONCLUSTERED INDEX IDX_Autorizar_IdProduto ON Autorizar (IdProduto)

CREATE NONCLUSTERED INDEX IDX_Subscrever_IdCliente ON Subscrever (IdCliente) 

CREATE NONCLUSTERED INDEX IDX_Subscrever_CodigoPlano ON Subscrever (CodigoPlano) 

CREATE NONCLUSTERED INDEX IDX_TelefoneCliente_IdCliente ON TelefoneCliente (IdCliente)

CREATE NONCLUSTERED INDEX IDX_Referir_IdCategoria ON Referir (IdCategoria) 

CREATE NONCLUSTERED INDEX IDX_Referir_IdParentCategoria ON Referir (IdParentCategoria)

GO

