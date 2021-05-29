CREATE VIEW top_3_artistas AS SELECT a.artista AS 'artista', COUNT(*) AS 'seguidores' FROM SpotifyClone.seguindo_artistas AS sa INNER JOIN SpotifyClone.artistas AS a ON a.artista_id = sa.artista_id GROUP BY sa.artista_id ORDER BY `seguidores` DESC, `artista` ASC LIMIT 3;