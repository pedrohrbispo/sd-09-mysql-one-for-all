CREATE VIEW SpotifyClone.faturamento_atual AS
SELECT
	ROUND(MIN(p.price), 2) AS faturamento_minimo,
    ROUND(MAX(p.price), 2) AS faturamento_maximo,
    ROUND(AVG(p.price), 2) AS faturamento_medio,
    ROUND(SUM(p.price), 2) AS faturamento_total
FROM SpotifyClone.plans AS p;
-- INNER JOIN SpotifyClone.users AS u
-- ON p.id_plan = u.plan;

DROP VIEW SpotifyClone.faturamento_atual;

SELECT * FROM SpotifyClone.faturamento_atual;