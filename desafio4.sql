USE SpotifyClone;
CREATE VIEW top_3_artistas AS
	SELECT a.artist_name AS 'artista',
    COUNT(f.user_id) AS 'seguidores'
    FROM followers AS f
    INNER JOIN artist AS a ON a.artist_id = f.artist_id
    GROUP BY f.artist_id
    ORDER BY `seguidores` DESC, `artista`
    LIMIT 3;
    
SELECT * FROM top_3_artistas;
