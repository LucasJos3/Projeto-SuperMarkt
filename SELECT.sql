SELECT  
    cidade,
    SUM(vendas) AS totalVendas
FROM
    supermercado
GROUP BY
    cidade 
ORDER BY 
    totalVendas DESC;

SELECT   
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

SELECT 
    categoriaProduto,
    SUM(vendas) AS totalVendas
FROM
    supermercado
GROUP BY
    categoriaProduto
ORDER BY 
    totalvendas DESC;


SELECT  
    categoriaProduto,
    SUM(vendas)* 1.0 / COUNT(DISTINCT orderID)AS TICKET_MEDIO
FROM
    supermercado
GROUP BY 
    categoriaProduto
ORDER BY 
    TICKET_MEDIO DESC;

SELECT  
    categoriaProduto,
    COUNT(categoriaProduto) AS totalCategoria
FROM
    supermercado
GROUP BY
    categoriaProduto
ORDER BY
    totalCategoria DESC;


SELECT  
    segmento,
    COUNT(segmento) AS totalSegmentos
FROM 
    supermercado
GROUP BY 
    segmento
ORDER BY 
    totalSegmentos DESC;

SELECT
   ROUND(
    AVG(
        julianday(
            substr(dataEnvio, 7, 4) || '-'|| substr(dataEnvio, 4, 2) || '-' || substr(dataEnvio, 1, 2) ) -
    julianday(substr(dataOrdem, 7, 4) || '-'|| substr(dataOrdem, 4, 2) || '-' || substr(dataOrdem, 1, 2) )), 2)
    AS mediaDias
FROM
    supermercado
