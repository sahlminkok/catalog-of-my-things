CREATE TABLE item (
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  archived BOOLEAN DEFAULT false,
  genre_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (genre_id) REFERENCES genre(id)
);

CREATE TABLE music_album (
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  PRIMARY KEY (id)
);
