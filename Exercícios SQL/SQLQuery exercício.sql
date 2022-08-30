 
 /*
 1. Escreva na consola "Hello World"
 */

 SELECT 'Hello World'


 /*
 2. Use um Alias para formatar o nome da coluna criada anteriormente. 
	O nome da coluna deve ser mensagem
*/

PRINT 'Hello World'


/*
 3. Apresente o resultado da soma dos n�meros de 1 a 5
 */

 SELECT 1+2+3+4+5



 /*
 4. Use uma fun��o que apresente "HELLO WORLD" dada a string "hello world"
 */
 

 SELECT UPPER ('hello world')
 


 /*
 5. Use uma fun��o que concatene "Hello" e "World" de forma que o resultado seja "Hello, World"
 */


 SELECT ('Hello ' + ',' + ' World') 


 /*
 6. Use uma fun��o para obter o texto composto pelos primeiros 3 caracteres da string "SQL is Fantastic"
 */

 SELECT LEFT ('SQL is Fantastic',3)

 SELECT SUBSTRING ('SQL is Fantastic',1,3)


 /*
 7. Use uma fun��o para obter o texto composto pelos �ltimos 9 caracteres da string "SQL is Fantastic"
 */


SELECT RIGHT ('SQL is Fantastic',9)



 /*
8. Use uma fun��o para desenhar uma linha com 10 colunas usando o caracter "*". 
*/


SELECT REPLICATE('*',10)



/*
9. Apresente o texto "Let's have fun" apresentado ao contr�rio
*/
 

 SELECT REVERSE ('Let s have fun')



 /*
10.  Dada a string '  SQL is powerful ', apresente o seguinte output:
*SQL is powerful*
*SQL is powerful*
*SQL is powerful*
*SQL is powerful*

*/


SELECT ('*SQL is powerfull*')
UNION ALL
SELECT ('*SQL is powerfull*')
UNION ALL
SELECT ('*SQL is powerfull*')
UNION ALL
SELECT ('*SQL is powerfull*')


/*
11. Apresente o resultado da soma das strings '10' e '25'. O resultado era o que esperava, porqu�?
Fa�a as necess�rias adapta��es para que obtenha o resultado num�rico correto, i.e. 35
*/





/*
12. Dada a string 'Hoje vou � praia', utilize a fun��o Substring para obter a 2� palavra
*/


SELECT SUBSTRING('Hoje vou � praia', 5, 5);


/*
13. Apresente a data atual do sistema
 */


 SELECT GetDate()

SELECT SYSDATETIME()


/*
14. Dada a string 'Ol� Mundo', obtenha a string 'Hello Mundo'
*/

SELECT REPLACE ('Ol� Mundo', 'Ol�', 'Hello')
 
/*
15. Quantos caracteres tem o texto 'Programming is pure art'
*/


SELECT LEN('Programming is pure art')

/*
16. Use a fun��o SPACE para inserir 5 espa�os entre as letras ABC
*/


SELECT 'A' + SPACE(5) + 'B' + SPACE(5) + 'C'



/*
17. Dada a string 'SQL programming ??** !!', use a fun��o STUFF para apresentar o texto
SQL programming is fun !!
*/


SELECT STUFF('SQL programming ??** !!',16,17,' is fun!!' )



/*
18. Dada a data atual, apresente uma tabela com a data completa e cada uma das componentes:
Ano, M�s, Dia
*/


SELECT value FROM STRING_SPLIT('2022-08-02', '-')


/*
19. Explore a fun��o COALESCE. Para que serve?
Apresente exemplos.
*/


SELECT COALESCE(NULL, NULL, NULL, NULL, 3+3, 'LUCA')


/*
20. Explore a fun��o IIF
*/


SELECT IIF



/*
21. Para cada dia da semana, e tendo em aten��o a data atual, apresente as seguintes mensagens:
- S�bado e domingo - Yuppii, � fim de semana
- 2a-feira" - Ainda estou a dormir
- 3�-feira - Estou a acordar
- 4�-feira - Estou com a for�a toda
- 5�-feira - O fim de semana ainda � uma miragem
- 6�-feira - Nunca mais s�o 18:00h
Nota: Use a instru��o CASE para resolver o exerc�cio
*/






/*
22. Declare, inicialize e apresente variv�veis de diferentes tipos de dados
*/






