CREATE VIEW historico_reproducao_usuarios AS
SELECT u.user_name AS usuario,
s.song AS nome
FROM SpotifyClone.historic
JOIN SpotifyClone.user_table AS U
ON U.id = historic.user_id
JOIN SpotifyClone.songs AS S
ON S.id = historic.song_id
ORDER BY usuario ASC, nome ASC;
