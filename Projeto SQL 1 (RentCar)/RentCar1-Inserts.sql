--Inserts 

INSERT INTO Marca (Id, Nome, AnoFundacao, Descricao)
	VALUES 
('Ford', 'Ford', '2005', 'Descricao'),
('Seat', 'Seat', '1980', 'Descricao'),
('Honda', 'Honda', 2007, 'Descricao'),
('Opel', 'Opel', 1970, 'Descricao'),
('Toyota', 'Toyota', 1996, 'Descricao'),
('Dodge', 'Dodge', 1999, 'Descricao'),
('Mazda', 'Mazda', 2008, 'Descricao'),
('Chevrolet', 'Chevrolet', 1999, 'Descricao'),
('BMW', 'BMW', 2002, 'Descricao'),
('Audi', 'Audi', 2008, 'Descricao');
GO

INSERT INTO Modelo (ID, Nome, IdMarca) 
	VALUES
	('1', 'Corsa', 'Opel'),
	('2', 'Fiesta', 'Ford'),
	('3', 'Civic', 'Honda'),
	('4', 'Ibiza', 'Seat'),
	('5', '320', 'BMW');
GO

--select * from cliente

insert into Cliente (Nome, Apelido, Sexo, NIF, NumeroCarta, DataExpCarta) 
VALUES
	('Reena', 'Zannotti', 'F', '681680392', 54088854, '2021-08-31'),
	('Odey', 'Mateiko', 'M', '399240877', 6722145, '2021-08-10'),
	('Hinze', 'Baudoux', 'M', '311441124', 60170124, '2021-11-20'),
	('Willi', 'McCaig', 'M', '561508506', 45217892, '2022-06-25'),
	('Enid', 'Pentercost', 'F', '334356765', 39057964, '2020-11-20'),
	('Maura', 'Dudden', 'F', '369812149', 18403050, '2022-12-29'),
	('Korey', 'Loftin', 'M', '714109712', 38590995, '2020-05-29'),
	('Mattheus', 'Baigrie', 'M', '538700926', 16835690, '2022-06-10'),
	('Harbert', 'Sharper', 'M', '494363335', 7263186, '2022-06-04'),
	('Gun', 'Krauss', 'M', '546822391', 86622234, '2022-06-21');
GO

insert into Viatura (Matricula, AnoAquisicao, NIV, Estado, IdModelo) 
VALUES
	('02-74-69', 2011, 'WAUML44E04N732186', 'bom', 2),
	('73-93-44', 2015, 'WDDLJ7GB5FA592594', 'excelente', 4),
	('35-14-40', 2011, '19XFB4F3XEE621970', 'razoavel', 5),
	('37-79-24', 2012, 'WBA3A5C5XDF311742', 'razoavel', 5),
	('41-75-04', 2016, 'JTJBC1BAXE2096787', 'excelente', 3),
	('74-15-93', 2016, 'YV1672MK1D2514618', 'bom', 4),
	('73-67-10', 2018, '1G6YV36A065396130', 'excelente', 5),
	('67-22-62', 2014, 'WAUAH94F46N635649', 'razoavel', 3),
	('51-18-34', 2020, '2V4RW3DG5BR323750', 'excelente', 2),
	('46-96-14', 2017, '3VW8S7AT3FM317434', 'bom', 5);
GO

insert into Aluguer (DataAluguer, DataEstEntrega, DataEntrega, Valor, Multa, IdCliente, Matricula) 
values
('2020-11-25T01:30:29', '2020-12-03T11:11:02', '2020-12-03T11:11:02', 48.01, NULL, '1', '02-74-69'),
('2020-11-22T09:27:47', '2020-11-30T13:12:40', '2020-11-30T13:12:40', 129.31, 10, '2', '73-93-44'),
('2020-11-24T21:59:46', '2020-12-01T07:44:23', '2020-12-01T07:44:23', 279.44, NULL, '3', '37-79-24'),
('2020-11-26T08:27:05', '2020-12-04T18:14:59', '2020-12-06T18:14:59', 136.92, '20', '4', '73-67-10'),
('2020-11-27T14:25:53', '2020-12-04T05:28:29', '2020-12-04T05:28:29', 276.02, NULL, '5', '67-22-62'),
('2020-11-23T17:20:15', '2020-11-29T12:44:01', '2020-12-02T12:44:01', 227.69, '40', '6', '02-74-69'),
('2020-11-24T06:07:15', '2020-12-01T16:01:33', '2020-12-01T16:01:33', 145.50, NULL, '7', '37-79-24'),
('2020-11-22T12:09:02', '2020-12-04T17:06:51', '2020-12-09T17:06:51', 113.97, '50', '8', '46-96-14'),
('2020-11-24T11:04:34', '2020-12-02T16:49:46', '2020-12-02T16:49:46', 105.69, NULL, '9', '51-18-34'),
('2020-11-26T19:06:09', '2020-12-04T17:32:53', '2020-12-10T17:32:53', 140.41, '60', '10', '35-14-40'),
('2020-11-27T05:35:37', '2020-12-02T01:36:19', '2020-12-04T17:32:53', 174.45, NULL, '5', '73-67-10'),
('2020-11-27T07:56:38', '2020-12-02T06:10:55', '2020-12-09T06:10:55', 113.67, '70', '6', '41-75-04'),
('2020-11-23T15:55:50', '2020-12-02T11:36:58', '2020-12-02T11:36:58', 299.19, NULL, '9', '46-96-14'),
('2020-11-26T04:58:25', '2020-11-29T12:48:01', '2020-10-31T12:48:01', 105.75, '20', '2', '02-74-69'),
('2020-11-25T07:09:12', '2020-12-04T23:44:23', '2020-12-04T23:44:23', 66.39, NULL, '1', '41-75-04'),
('2020-11-25T05:40:26', '2020-12-02T18:50:17', '2020-12-06T18:50:17', 10.03, '40', '6', '67-22-62'),
('2020-11-25T09:44:39', '2020-12-03T02:53:09', '2020-12-03T02:53:09', 62.15, NULL, '5', '74-15-93'),
('2020-11-22T11:14:23', '2020-12-03T06:36:28', '2020-12-08T06:36:28', 53.63, '50', '9', '35-14-40'),
('2020-11-23T20:52:12', '2020-12-04T11:50:17', '2020-12-04T11:50:17', 301.23, NULL, '8', '46-96-14'),
('2020-11-27T08:14:35', '2020-12-02T20:08:20', '2020-12-22T20:08:20', 332.52, '200', '6', '74-15-93');

GO


INSERT INTO Telefone (IdCliente, Telefone) VALUES (7, 253505252);
INSERT INTO Telefone (IdCliente, Telefone) VALUES (8, 253649137);
INSERT INTO Telefone (IdCliente, Telefone) VALUES (8, 253481379);
INSERT INTO Telefone (IdCliente, Telefone) VALUES (5, 253532636);
INSERT INTO Telefone (IdCliente, Telefone) VALUES (1, 253437701);
INSERT INTO Telefone (IdCliente, Telefone) VALUES (3, 253840898);
INSERT INTO Telefone (IdCliente, Telefone) VALUES (4, 253563006);
INSERT INTO Telefone (IdCliente, Telefone) VALUES (7, 253914665);
INSERT INTO Telefone (IdCliente, Telefone) VALUES (9, 253881533);
INSERT INTO Telefone (IdCliente, Telefone) VALUES (10, 253832581);
INSERT INTO Telefone (IdCliente, Telefone) VALUES (3, 253052162);
GO

