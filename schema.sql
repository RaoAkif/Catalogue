CREATE TABLE Item
(
  id INTEGER PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  FOREIGN KEY (book_id) REFERENCES Book(id)
  FOREIGN KEY (music_album_id) REFERENCES MusicAlbum(id)
  FOREIGN KEY (movie_id) REFERENCES Movie(id)
  FOREIGN KEY (game_id) REFERENCES Game(id)
  FOREIGN KEY (author_id) REFERENCES Author(id)
  FOREIGN KEY (label_id) REFERENCES Label(id)
  FOREIGN KEY (genre_id) REFERENCES Genre(id)
  FOREIGN KEY (source_id) REFERENCES Source(id)
);

CREATE TABLE Book
(
  id INTEGER PRIMARY KEY,
  genre VARCHAR(100) NOT NULL,
  label VARCHAR(100) NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  publisher VARCHAR(100) NOT NULL,
  cover_state VARCHAR(100) NOT NULL,
  FOREIGN KEY (author_id) REFERENCES Author(id)
  FOREIGN KEY (label_id) REFERENCES Label(id)
);

CREATE TABLE MusicAlbum
(
  id INTEGER PRIMARY KEY,
  genre VARCHAR(100) NOT NULL,
  source VARCHAR(200) NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  on_spotify BOOLEAN NOT NULL,
  FOREIGN KEY (genre_id) REFERENCES Genre(id)
  FOREIGN KEY (source_id) REFERENCES Source(id)
);

CREATE TABLE Movie
(
  id INTEGER PRIMARY KEY,
  genre VARCHAR(100) NOT NULL,
  source VARCHAR(200) NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  silent BOOLEAN NOT NULL,
  FOREIGN KEY (genre_id) REFERENCES Genre(id)
  FOREIGN KEY (source_id) REFERENCES Source(id)
);

CREATE TABLE Game
(
  id INTEGER PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL, 
  multiplayer BOOLEAN NOT NULL, 
  last_played_at DATE NOT NULL,
  FOREIGN KEY (genre_id) REFERENCES Genre(id)
  FOREIGN KEY (source_id) REFERENCES Source(id)
);

CREATE TABLE Genre
(
  id INTEGER PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE Source
(
  id INTEGER PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE Author
(
  id INTEGER PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL
  last_name VARCHAR(100) NOT NULL
);

CREATE TABLE Label
(
  id INTEGER PRIMARY KEY,
  title VARCHAR(100) NOT NULL
  color VARCHAR(100) NOT NULL
);
