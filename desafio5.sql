CREATE VIEW top_2_hits_do_momento AS
SELECT
m.nome_musica AS cancao,
COUNT(hr.musica_id) AS reproducoes
FROM SpotifyClone.musicas AS m
INNER JOIN SpotifyClone.historico_de_reproducao AS hr ON m.musica_id = hr.musica_id
GROUP BY hr.musica_id
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;
