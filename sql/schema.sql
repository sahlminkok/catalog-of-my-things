 -- Book schema structure
CREATE TABLE book (
	id SERIAL PRIMARY KEY,
	publisher VARCHAR(250) NOT NULL,
	publish_date date NOT NULL,
	cover_state VARCHAR(250) NOT NULL,
	genre_id INT,
	label_id INT,
	author_id INT,
	FOREIGN KEY (genre_id) REFERENCES genre(id),
	FOREIGN KEY (label_id) REFERENCES label(id),
	FOREIGN KEY (author_id) REFERENCES author(id)
);

-- Label schema structure

CREATE TABLE label (
	id SERIAL PRIMARY KEY,
	title VARCHAR(250) NOT NULL,
	color VARCHAR(250) NOT NULL
);

-- Item schema structure

CREATE TABLE item (
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  archived BOOLEAN,
  genre_id INT,
  label_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (genre_id) REFERENCES genre(id),
  FOREIGN KEY (label_id) REFERENCES label(id)
);

-- Music Album schema structure

CREATE TABLE music_album (
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  genre_id INT,
	label_id INT,
	author_id INT,
  PRIMARY KEY (id),
	FOREIGN KEY (genre_id) REFERENCES genre(id),
	FOREIGN KEY (label_id) REFERENCES label(id),
	FOREIGN KEY (author_id) REFERENCES author(id)
);

-- Genre schema structure

CREATE TABLE genre (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  item_id INT,
  PRIMARY KEY (id)
);

-- Game schema structure

CREATE TABLE game (
  id INT GENERATED ALWAYS AS IDENTITY,
  multiplayer VARCHAR(255),
  last_played_at DATE,
  publish_date DATE,
  archived BOOLEAN,
  genre_id INT,
	label_id INT,
	author_id INT,
  PRIMARY KEY (id),
	FOREIGN KEY (genre_id) REFERENCES genre(id),
	FOREIGN KEY (label_id) REFERENCES label(id),
	FOREIGN KEY (author_id) REFERENCES author(id)
);

-- Author schema structure

CREATE TABLE author (
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  PRIMARY KEY (id)
);