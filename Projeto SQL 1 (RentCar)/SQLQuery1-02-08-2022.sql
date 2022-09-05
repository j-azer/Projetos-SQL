USE RentCar1
GO

SELECT Nome NOME , Apelido APELIDO, Telefone TELEFONE
FROM CLIENTE, TELEFONE
WHERE CLIENTE.Id = TELEFONE.IdCliente
ORDER BY CLIENTE.Nome

-- Listar clientes que já alugaram carro


SELECT Cliente.Nome NOME ,CLIENTE.Apelido APELIDO, Aluguer.DataAluguer DATA_ALUGUER, Aluguer.Matricula MATRICULA
FROM Cliente, Aluguer
WHERE Cliente.Id = Aluguer.IdCliente
ORDER BY CLIENTE.Nome


-- Contar o nº de clientes que alugaram algum carro a partir de 23-11-2020


SELECT DISTINCT Cliente.Nome NOME, CLIENTE.Id ID ,CLIENTE.Apelido APELIDO, Aluguer.DataAluguer DATA_ALUGUER
FROM Cliente, Aluguer
WHERE Cliente.Id = Aluguer.IdCliente AND Aluguer.DataAluguer >= '2020-11-23'



SELECT COUNT (DISTINCT IdCliente) AS ALUGUERES
FROM Aluguer
WHERE DataAluguer > '2020-11-23'



SELECT * FROM Aluguer
ORDER BY IdCliente

-- Apresentar o valor total recebido e também a multa




-- Apresentar o nº de vezes que um aluguer originou uma multa


SELECT Cliente.Nome NOME ,CLIENTE.Apelido APELIDO, Aluguer.Multa MULTA, Aluguer.DataAluguer DATA_ALUGUER
FROM Cliente, Aluguer
WHERE Multa is not null




-- Liste as pessoas do sexo feminino e o carro que foi alugado para cada ocorrência


SELECT Cliente.Nome NOME ,CLIENTE.Apelido APELIDO, Cliente.Sexo SEXO, Aluguer.Matricula MATRICULA
FROM Cliente, Aluguer
WHERE Cliente.Sexo = 'F'




-- Mostar as viaturas que ainda não foram alugadas nenhuma vez


SELECT Viatura.Matricula , Aluguer.Matricula
FROM Viatura, Aluguer
WHERE Viatura.Matricula != Aluguer.Matricula

-- Mostar as viaturas que ainda não foram alugadas nenhuma vez

DELETE FROM Aluguer WHERE Matricula= '73-93-44'

SELECT *
FROM Viatura 
WHERE Matricula NOT IN
	(
		SELECT DISTINCT Matricula
		FROM Aluguer
		)


-- fazendo inner join

Select v.Matricula, v.Estado, CONCAT(m.Nome,  '-', mo.Nome) AS Modelo, 
        'Nunca foi alugado - Shame' Mensagem  
from Viatura v JOIN modelo mo ON mo.Id = v.IdModelo
			   JOIN Marca m ON m.Id = mo.IdMarca
where Matricula NOT IN 
    (
        -- todas as viaturas que foram alugadas
        Select DISTINCT Matricula 
        from Aluguer
    )






	Select v.Matricula, v.NIV, mo.Nome [Modelo], m.Nome AS 'Marca', va.Alugueres 
from Viatura v JOIN Modelo mo ON v.IdModelo = mo.Id
	JOIN Marca m ON mo.IdMarca = m.Id
	JOIN (
		-- viaturas que foram alugadas mais de uma vez
		SELECT a.matricula, count(*) 'Alugueres'
		FROM Aluguer a
		GROUP BY a.Matricula 
		HAVING COUNT(*) = (
			SELECT max (contador) 
			FROM
				(
					select count(*) contador
					FROM Aluguer a
					group BY matricula
					-- order by 1 desc
			  ) mx
		)
	) va ON va.matricula = v.Matricula
ORDER BY 1



SELECT COUNT(*) 
FROM Cliente
union all
SELECT COUNT(*) 
FROM Viatura
union all
SELECT COUNT(*)
FROM Aluguer


_______________________________________________#__________________________________________________#_____________________________________



--1. Liste as viaturas que já foram alugadas pelo menos uma vez (sem usar o JOIN)

SELECT DISTINCT a.Matricula
from Aluguer a




--2. Quantas viaturas já foram alugadas?

SELECT COUNT (DISTINCT a.Matricula) 
from  Aluguer a




--3. Quantas pessoas alugaram viaturas mais de 2 vezes?

SELECT * 
FROM Cliente
WHERE Id IN
(
	SELECT IdCliente
	FROM Aluguer
	GROUP BY (IdCliente)
	HAVING COUNT(*) > 2
)




--4. Qual o total faturado pela empresa RentCar?

SELECT (SUM(a.Valor) + SUM(a.Multa)) 'FATURAMENTO TOTAL'
FROM Aluguer a




--5. Qual a média que cada cliente paga em multas?


SELECT AVG(a.Multa) 'MÉDIA MULTAS'
FROM Aluguer a




--6. Qual é o montante máximo do valor de um aluguer, e o mínimo?


SELECT MAX(a.Valor) 'MULTA MAXIMA', MIN(a.Valor) 'MULTA MINIMA'
FROM Aluguer a




--7. Liste os clientes que alugaram mais viaturas.


SELECT * 
FROM Cliente
WHERE Id IN 
(
	SELECT IdCliente 
	FROM Aluguer
	GROUP BY (IdCliente)
	HAVING COUNT(*)=4
)

		UNION ALL

			SELECT * 
			FROM Cliente
			WHERE Id IN
			(
				SELECT IdCliente
				FROM Aluguer
				GROUP BY (IdCliente)
				HAVING COUNT(*)=3
			)

					UNION ALL

						SELECT * 
						FROM Cliente
						WHERE Id IN
						(
							SELECT IdCliente
							FROM Aluguer
							GROUP BY (IdCliente)
							HAVING COUNT(*)=2
						)




--8. Quais os clientes cuja carta expira no ano mais longínquo?

SELECT TOP(5) *
FROM Cliente C
ORDER BY C.DataExpCarta DESC



--9. Quais as 3 viaturas mais alugadas?

SELECT TOP (3) a.matricula, count(*) 'Alugueres'
FROM Aluguer a
GROUP BY a.Matricula 
ORDER BY 2 DESC




--10. Liste todos os clientes que já alugaram mais de 2 viaturas durante os últimos 360 dias GetDate() ??????????






--11. Liste o nome do cliente, assim como o modelo e marca da viatura do seu último aluguer ??????????











