CREATE TABLE item (
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  archived BOOLEAN DEFAULT false,
  genre_id INT,
  PRIMARY KEY (id),
  FOREIGN KEY (genre_id) REFERENCES genre(id)
);
