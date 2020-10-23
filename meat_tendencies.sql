
-- QUERY TOP 10 PAISES DE CONSUMO PER CAP DA SOMA DE TODOS TIPOS DE CARNE

WITH kg_per_cap AS (
    SELECT *
    FROM meat_consumption_worldwide
    WHERE MEASURE = 'KG_CAP'
)
SELECT LOCATION, TIME, ROUND((SUM(Value)),2) AS 'Kg p/ pessoa'
FROM kg_per_cap
WHERE TIME = 2017
GROUP BY 1 
ORDER BY 3 DESC
LIMIT 10;

-- Variação no consumo per capita de carne de 2000 a 2017 no Brasil

WITH kg_per_cap AS (
    SELECT *
    FROM meat_consumption_worldwide
    WHERE MEASURE = 'KG_CAP'
)
SELECT LOCATION, TIME, ROUND((SUM(Value)),2) AS 'Kg por pessoa'
FROM kg_per_cap
WHERE TIME BETWEEN 2000 AND 2017
AND LOCATION = 'BRA'
GROUP BY 2;

-- Variação no consumo per capita de carne de 2000 a 2017 no mundo

WITH kg_per_cap AS (
    SELECT *
    FROM meat_consumption_worldwide
    WHERE MEASURE = 'KG_CAP'
)
SELECT
    CASE
        WHEN LOCATION LIKE '%' THEN 'WORLD'
    END AS LOCATION, 
    TIME, ROUND((SUM(Value)/18),2) AS 'Kg por pessoa'
FROM kg_per_cap
WHERE TIME BETWEEN 2000 AND 2017
GROUP BY 2;

-- Porcentagem de consumo de cada tipo de carne mundialmente em 2017

WITH kg_per_cap AS (
    SELECT *
    FROM meat_consumption_worldwide
    WHERE MEASURE = 'KG_CAP'
)
SELECT SUBJECT, ROUND(AVG(Value),2) AS 'Kg p/ pessoa', ROUND((100 * AVG(Value)/40.9),2) AS 'PORCENTAGEM'
FROM kg_per_cap
WHERE TIME = 2017
GROUP BY 1;