DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

/****************** criação tabela *********************************/

CREATE TABLE planos(
    plano_id SMALLINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tipo_plano VARCHAR(20) NOT NULL,
    valor_plano DECIMAL(4,2) NOT NULL
) engine = InnoDB;

CREATE TABLE usuarios(
	  usuario_id SMALLINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_usuario VARCHAR(45) NOT NULL,
    idade_usuario INT NOT NULL,
    plano_id SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES planos (plano_id)
) engine = InnoDB;

CREATE TABLE artistas(
    artista_id SMALLINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_artista VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE albuns(
    album_id SMALLINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_album VARCHAR(20) NOT NULL,
    artista_id SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
) engine = InnoDB;

CREATE TABLE cancoes(
    cancao_id SMALLINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_cancao VARCHAR(200) NOT NULL,
    album_id SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albuns (album_id)
) engine = InnoDB;

CREATE TABLE historico_usuario (
  usuario_id SMALLINT UNSIGNED NOT NULL,
  cancao_id SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (usuario_id, cancao_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
  FOREIGN KEY (cancao_id) REFERENCES cancoes (cancao_id) -- ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE seguidores_artista (
  usuario_id SMALLINT UNSIGNED NOT NULL,
  artista_id SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (usuario_id, artista_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
  FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
) ENGINE=InnoDB;

/****************** insercao dados *********************************/

INSERT INTO planos (tipo_plano, valor_plano)
VALUE
  ('gratuito', 0.00),
  ('universitário', 5.99),
  ('familiar', 7.99);
  

INSERT INTO usuarios (nome_usuario, idade_usuario, plano_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 3),
  ('Bill', 20, 2),
  ('Roger', 45, 1);
  
INSERT INTO artistas (nome_artista)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');
  
INSERT INTO albuns (nome_album, artista_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);
  
INSERT INTO cancoes (nome_cancao, album_id)
VALUES
  ('Soul For Us', 1),
  ('Reflections Of Magic', 1),
  ('Dance With Her Own', 1),
  ('Troubles Of My Inner Fire', 2),
  ('Time Fireworks', 2),
  ('Magic Circus', 3),
  ('Honey, So Do I', 3),
  ('Sweetie, Let\'s Go Wild', 3),
  ('She Knows', 3),
  ('Fantasy For Me', 4),
  ('Celebration Of More', 4),
  ('Rock His Everything', 4),
  ('Home Forever', 4),
  ('Diamond Power', 4),
  ('Honey, Let\'s Be Silly', 4),
  ('Thang Of Thunder', 5),
  ('Words Of Her Life', 5),
  ('Without My Streets', 5);

INSERT INTO historico_usuario (usuario_id, cancao_id)
VALUES
  (1, 1),
  (1, 6),
  (1, 14),
  (1, 16),
  (2, 13),
  (2, 17),
  (2, 2),
  (2, 15),
  (3, 4),
  (3, 16),
  (3, 6),
  (4, 3),
  (4, 18),
  (4, 11);
  
INSERT INTO seguidores_artista (usuario_id, artista_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);
