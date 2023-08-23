 -- Book schema structure
CREATE TABLE book (
	id GENERATED ALWAYS AS IDENTITY,
	publisher VARCHAR(250) NOT NULL,
	publish_date date NOT NULL,
	cover_state VARCHAR(250) NOT NULL,
	genre_id INT,
	label_id INT,
	author_id INT,
	PRIMARY KEY(id)
	FOREIGN KEY (genre_id) REFERENCES genre(id)
	FOREIGN KEY (label_id) REFERENCES label(id)
	FOREIGN KEY (author_id) REFERENCES author(id)
);

