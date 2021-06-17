DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE usuarios(
usuario_id INT AUTO_INCREMENT,
usuario_nome VARCHAR(50) NOT NULL,
idade INTEGER,
plano_id INT,
FOREIGN KEY (plano_id) REFERENCES planos(plano_id),
CONSTRAINT PRIMARY KEY (usuario_id)
) Engine = InnoDB;

-- SELECT * FROM SpotifyClone.usuario;
-- ALTER TABLE usuario DROP valor_plano;
-- DROP TABLE SpotifyClone.seguindo;
-- DESCRIBE SpotifyClone.usuarios;

CREATE TABLE planos(
plano_id INT PRIMARY KEY AUTO_INCREMENT,
plano VARCHAR(30) NOT NULL,
preco DECIMAL(5,2) NOT NULL
) Engine = InnoDB;

CREATE TABLE artistas(
artista_id INT PRIMARY KEY AUTO_INCREMENT,
artista_nome VARCHAR(50) NOT NULL
) Engine = InnoDB;

CREATE TABLE albuns(
album_id INT PRIMARY KEY AUTO_INCREMENT,
album_nome VARCHAR(50),
artista_id INT,
FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) Engine = InnoDB;

CREATE TABLE cancoes(
cancao_id INT PRIMARY KEY AUTO_INCREMENT,
cancao_nome VARCHAR(50),
album_id INT,
FOREIGN KEY (album_id) REFERENCES albuns(album_id)
) Engine = InnoDB;

CREATE TABLE historico(
usuario_id INT,
cancao_id INT,
FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id)
) Engine = InnoDB;

CREATE TABLE seguindo(
usuario_id INT,
artista_id INT,
CONSTRAINT PRIMARY KEY (usuario_id, artista_id),
FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) Engine = InnoDB;

-- DESCRIBE SpotifyClone.historico;
-- SELECT * FROM SpotifyClone.usuarios;

INSERT INTO planos(plano, preco) VALUES
('gratuito', 0),
('universitário',5.99),
('familiar', 7.99);

INSERT INTO artistas(artista_nome) VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO albuns(album_nome, artista_id) VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO cancoes(cancao_nome, album_id) VALUES
('Soul For Us', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 2),
('Time Fireworks', 2),
('Magic Circus', 3),
('Honey, So Do I', 3),
("Sweetie, Let's Go Wild", 3),
('She Knows', 3),
('Fantasy For Me', 4),
('Celebration Of More', 4),
('Rock His Everything', 4),
('Home Forever', 4),
('Diamond Power', 4),
("Honey, Let's Be Silly", 4),
('Thang Of Thunder', 5),
('Words Of Her Life', 5),
('Without My Streets', 5);

INSERT INTO user_history(user_id, song_id) VALUES
(1, 1), (1, 6), (1, 14), (1, 16),
(2, 13), (2, 17), (2, 2), (2, 15),
(3, 4), (3, 16), (3, 6),
(4, 3), (4, 18), (4, 11);

INSERT INTO seguindo(usuario_id, artista_id) VALUES
(1, 1), (1, 4), (1, 3),
(2, 1), (2, 3),
(3, 2), (3, 1),
(4, 4);

INSERT INTO usuarios(usuario_nome, idade, plano_id) VALUES
('Thati', 23, 1),
('Cintia', 35, 3),
('Bill', 20, 2),
('Roger', 45, 1);
