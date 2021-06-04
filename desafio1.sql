DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.`plans_table`(
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(25) NOT NULL,
    plan_value DECIMAL(4, 2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.`users_table`(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(30) NOT NULL,
    user_age INT,
    plan_id INT NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES `plans_table`(plan_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.`artists_table`(
    artist_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(35) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.`albums_table`(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_name VARCHAR(35) NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES `artists_table`(artist_id) 
) engine = InnoDB;

CREATE TABLE SpotifyClone.`songs_table`(
	song_id INT PRIMARY KEY AUTO_INCREMENT,
    song_name VARCHAR(35) NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES `albums_table`(album_id) 
) engine = InnoDB;

CREATE TABLE SpotifyClone.`following_artists_table`(
	user_id INT,
	artist_id INT,
    PRIMARY KEY(user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES `users_table`(user_id),
    FOREIGN KEY (artist_id) REFERENCES `artists_table`(artist_id) 
) engine = InnoDB;

CREATE TABLE SpotifyClone.`history_table`(
	user_id INT,
	song_id INT,
    PRIMARY KEY(user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES `users_table`(user_id),
    FOREIGN KEY (song_id) REFERENCES `songs_table`(song_id) 
) engine = InnoDB;

INSERT INTO SpotifyClone.`plans_table` (plan_name, plan_value)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO SpotifyClone.`users_table` (user_name, user_age, plan_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

INSERT INTO SpotifyClone.`artists_table` (artist_name)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

INSERT INTO SpotifyClone.`albums_table` (album_name, artist_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

INSERT INTO SpotifyClone.`songs_table` (song_name, album_id)
VALUES
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

INSERT INTO SpotifyClone.`following_artists_table` (user_id, artist_id)
VALUES
  (1, 1),
  (1, 3),
  (1, 4),
  (2, 1),
  (2, 3),
  (3, 1),
  (3, 2),
  (4, 4);

INSERT INTO SpotifyClone.`history_table` (user_id, song_id)
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
