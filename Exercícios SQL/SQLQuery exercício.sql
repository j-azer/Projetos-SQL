 
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
 3. Apresente o resultado da soma dos números de 1 a 5
 */

 SELECT 1+2+3+4+5



 /*
 4. Use uma função que apresente "HELLO WORLD" dada a string "hello world"
 */
 

 SELECT UPPER ('hello world')
 


 /*
 5. Use uma função que concatene "Hello" e "World" de forma que o resultado seja "Hello, World"
 */


 SELECT ('Hello ' + ',' + ' World') 


 /*
 6. Use uma função para obter o texto composto pelos primeiros 3 caracteres da string "SQL is Fantastic"
 */

 SELECT LEFT ('SQL is Fantastic',3)

 SELECT SUBSTRING ('SQL is Fantastic',1,3)


 /*
 7. Use uma função para obter o texto composto pelos últimos 9 caracteres da string "SQL is Fantastic"
 */


SELECT RIGHT ('SQL is Fantastic',9)



 /*
8. Use uma função para desenhar uma linha com 10 colunas usando o caracter "*". 
*/


SELECT REPLICATE('*',10)



/*
9. Apresente o texto "Let's have fun" apresentado ao contrário
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
11. Apresente o resultado da soma das strings '10' e '25'. O resultado era o que esperava, porquê?
Faça as necessárias adaptações para que obtenha o resultado numérico correto, i.e. 35
*/





/*
12. Dada a string 'Hoje vou à praia', utilize a função Substring para obter a 2ª palavra
*/


SELECT SUBSTRING('Hoje vou à praia', 5, 5);


/*
13. Apresente a data atual do sistema
 */


 SELECT GetDate()

SELECT SYSDATETIME()


/*
14. Dada a string 'Olá Mundo', obtenha a string 'Hello Mundo'
*/

SELECT REPLACE ('Olá Mundo', 'Olá', 'Hello')
 
/*
15. Quantos caracteres tem o texto 'Programming is pure art'
*/


SELECT LEN('Programming is pure art')

/*
16. Use a função SPACE para inserir 5 espaços entre as letras ABC
*/


SELECT 'A' + SPACE(5) + 'B' + SPACE(5) + 'C'



/*
17. Dada a string 'SQL programming ??** !!', use a função STUFF para apresentar o texto
SQL programming is fun !!
*/


SELECT STUFF('SQL programming ??** !!',16,17,' is fun!!' )



/*
18. Dada a data atual, apresente uma tabela com a data completa e cada uma das componentes:
Ano, Mês, Dia
*/


SELECT value FROM STRING_SPLIT('2022-08-02', '-')


/*
19. Explore a função COALESCE. Para que serve?
Apresente exemplos.
*/


SELECT COALESCE(NULL, NULL, NULL, NULL, 3+3, 'LUCA')


/*
20. Explore a função IIF
*/


SELECT IIF



/*
21. Para cada dia da semana, e tendo em atenção a data atual, apresente as seguintes mensagens:
- Sábado e domingo - Yuppii, é fim de semana
- 2a-feira" - Ainda estou a dormir
- 3ª-feira - Estou a acordar
- 4ª-feira - Estou com a força toda
- 5ª-feira - O fim de semana ainda é uma miragem
- 6ª-feira - Nunca mais são 18:00h
Nota: Use a instrução CASE para resolver o exercício
*/






/*
22. Declare, inicialize e apresente variváveis de diferentes tipos de dados
*/






