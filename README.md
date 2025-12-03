# Projeto-SuperMarkt
Projeto para estudo sobre um mercado 

🔵 . Objetivo do Projeto
Criar uma análise exploratória completa das vendas de um supermercado usando SQL e DataViz, aplicando técnicas aprendidas nos cursos Google.
________________________________________
🟢 . Perguntas de negócio 



1. Qual filial vende mais? Filial de Nova York
2. Quais dias da semana têm maior faturamento? Sabado é o dia com maior valor de vendas
3. Quais linhas de produto são mais vendidas?Office Suplies
4. Qual é o ticket médio por categoria? Tech = 544.73 Furniture = 421.92 Office Supplies = 191.899
5.  Qual segmento que gera mais vendas ?
6. Qual categoria tem maior numero de pedido ? Office Suplies
7.   Qual a media de dias entra a data da ordem e data de envio




________________________________________
🟠 . Limpeza de dados (Prepare Data)
Aplicará:
•	TRIM() → limpar texto
•	SUBSTR() → corrigir city, códigos etc
•	LENGTH() → detectar inconsistências
•	CAST() → transformar preço (string → real)
•	DISTINCT → remover duplicatas na consulta
•	DATE() → extrair data
•	COALESCE() → lidar com valores nulos
________________________________________
🟤 . Transformações SQL
Criação de colunas:
•	receita total
•	receita por produto
•	mês
•	dia da semana
•	hora da compra
•	ticket médio por cliente
________________________________________
🟡 . Análises SQL principais
  CONSULTA PARA VERIFICAR QUAL A CIDADE QUE MAIS VENDE
```
SELECT  
    cidade,
    SUM(vendas) AS totalVendas
FROM
    supermercado
GROUP BY
    cidade 
ORDER BY 
    vendas DESC
```
CONSULTA PRA VER QUAL DIA DA SEMANA TEM MAIOR VENDA
SELECT   
        ```
CASE strftime('%w', 
        substr(dataOrdem, 7,4) || '-' || 
        substr(dataOrdem, 4,2) || '-' || 
        substr(dataOrdem, 1,2))
            WHEN '0' THEN 'Domingo'
            WHEN '1' THEN 'Segunda-feira'
            WHEN '2' THEN 'Terça-feira'
            WHEN '3' THEN 'Quarta-feira'
            WHEN '4' THEN 'Quinta-feira'
            WHEN '5' THEN 'Sexta-feira'
            WHEN '6' THEN 'Sábado'
        END AS nome_dia,
    SUM(vendas) AS total_vendas
FROM
    supermercado
GROUP BY 
    nome_dia
ORDER BY
    total_vendas DESC;
```
CONSULTA PARA VER QUAL A CATEGORIA QUE TEM O MAIOR VALOR DE VENDAS
```
SELECT 
    categoriaProduto,
    SUM(vendas) AS totalVendas
FROM
    supermercado
GROUP BY
    categoriaProduto
ORDER BY 
    totalvendas DESC;
```
________________________________________
🟩 . Dashboard ( Looker Studio )
•	 filial com mais faturamento
•	Modo de envio mais ulitilizada
•	Ticket médio de vendas
•	Vendas por categoria
________________________________________
🟧 . Storytelling (Insights do negócio)

•	Filial de Nova York é a mais rentavel.
•	Vendas ao Sabado são mais altas.
•	A categoria de envio mais ultilizada é a Standart por conta de seu custo-beneficio
•	“Electronic Accessories” é a linha mais lucrativa.
