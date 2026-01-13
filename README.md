# 🛒 Projeto-SuperMarkt

Projeto de estudo sobre um supermercado, com análise exploratória de vendas usando **SQL** e **Data Visualization**, aplicando técnicas aprendidas nos cursos do Google.

---

## 🎯 Objetivo do Projeto
Criar uma análise completa das vendas do supermercado, identificando padrões de compra, comportamento dos clientes e insights para tomada de decisão.

---

## 🟢 Perguntas de Negócio

| Pergunta | Resposta |
|-----------|----------|
| Qual filial vende mais? | Nova York |
| Quais dias da semana têm maior faturamento? | Sábado |
| Quais linhas de produto são mais vendidas? | Office Supplies |
| Ticket médio por categoria | Tech: 544.73<br>Furniture: 421.92<br>Office Supplies: 191.90 |
| Qual segmento gera mais vendas? |Tecnologia|
| Qual categoria tem maior número de pedidos? | Office Supplies |
| Média de dias entre ordem e envio | 4 |

---

## 🟠 Limpeza de Dados (Prepare Data)
Técnicas aplicadas:

- `TRIM()` → remover espaços desnecessários  
- `SUBSTR()` → corrigir cidades, códigos etc.  
- `LENGTH()` → detectar inconsistências  
- `CAST()` → transformar preços (string → real)  
- `DISTINCT` → remover duplicatas  
- `DATE()` → extrair data  
- `COALESCE()` → lidar com valores nulos  

---

## 🟤 Transformações SQL
Colunas e métricas criadas:

- Receita total  
- Dia da semana  
- Ticket médio 

---
## 📊 Dashboard no Looker Studio

👉 [Clique aqui para ver o Dashboard] https://lookerstudio.google.com/reporting/deef5b0e-f46e-44a4-aa86-f60ae9761d38


## 🟡 Principais Consultas SQL

### 1️⃣ Qual a cidade que mais vende?

```sql
SELECT  
    cidade,
    SUM(vendas) AS totalVendas
FROM
    supermercado
GROUP BY
    cidade 
ORDER BY 
    totalVendas DESC;
2️⃣ Qual dia da semana tem maior faturamento?
sql
Copiar código
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
3️⃣ Qual categoria tem maior valor de vendas?
sql
Copiar código
SELECT 
    categoriaProduto,
    SUM(vendas) AS totalVendas
FROM
    supermercado
GROUP BY
    categoriaProduto
ORDER BY 
    totalVendas DESC;
🟩 Dashboard (Looker Studio)
Principais métricas e visualizações:

🏢 Filial com maior faturamento

📦 Método de envio mais utilizado

💰 Ticket médio de vendas

🛍️ Vendas por categoria

🟧 Insights do Negócio (Storytelling)
🏢 A filial de Nova York é a mais rentável.

📅 Sábado é o dia com maior faturamento.

🚚 O método de envio mais utilizado é Standard, pelo custo-benefício.

💻 A linha mais lucrativa é Electronic Accessories.




