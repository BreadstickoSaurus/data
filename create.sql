DROP DATABASE IF EXISTS game_collections;

CREATE DATABASE game_collections;
USE game_collections;

CREATE TABLE users (
user_id INT AUTO_INCREMENT PRIMARY KEY,
PASSWORD VARCHAR(30) NOT NULL,
username VARCHAR(30) NOT NULL
);

CREATE TABLE collections (
collection_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
FOREIGN KEY (user_id) REFERENCES users (user_id)
);

ALTER TABLE collections
ADD CONSTRAINT oneColPerUser UNIQUE (user_id);

CREATE TABLE countries (
country_code CHAR(2) PRIMARY KEY,
country_name VARCHAR(55) NOT NULL
);

CREATE TABLE game_states (
state_id INT AUTO_INCREMENT PRIMARY KEY,
state_name VARCHAR(30) NOT NULL,
state_description TEXT
);

CREATE TABLE platforms (
platform_id INT AUTO_INCREMENT PRIMARY KEY,
platform_name VARCHAR(30) NOT NULL,
platform_description TEXT,
release_date DATE NOT NULL
);

CREATE TABLE publishers (
publisher_id INT AUTO_INCREMENT PRIMARY KEY,
publisher_name VARCHAR(30) NOT NULL,
publisher_description TEXT,
country_code CHAR(2),
FOREIGN KEY (country_code) REFERENCES countries (country_code)
);

CREATE TABLE developers (
developer_id INT AUTO_INCREMENT PRIMARY KEY,
developer_name VARCHAR(30) NOT NULL,
developer_description TEXT,
country_code CHAR(2),
FOREIGN KEY (country_code) REFERENCES countries (country_code)
);

CREATE TABLE genres (
genre_id INT AUTO_INCREMENT PRIMARY KEY,
genre_name VARCHAR(30) NOT NULL
);

CREATE TABLE games (
game_id INT AUTO_INCREMENT PRIMARY KEY,
game_title VARCHAR(100) NOT NULL,
game_description TEXT NOT NULL,
release_date DATE NOT NULL,
collection_id INT NOT NULL,
wishlisted BOOL DEFAULT FALSE,
FOREIGN KEY (collection_id) REFERENCES collections (collection_id),
state_id INT NOT NULL,
FOREIGN KEY (state_id) REFERENCES game_states (state_id),
platform_id INT NOT NULL,
FOREIGN KEY (platform_id) REFERENCES platforms (platform_id),
release_country_code CHAR(2) NOT NULL,
FOREIGN KEY (release_country_code) REFERENCES countries (country_code),
publisher_id INT NOT NULL,
FOREIGN KEY (publisher_id) REFERENCES publishers (publisher_id),
developer_id INT NOT NULL,
FOREIGN KEY (developer_id) REFERENCES developers (developer_id),
genre_id INT NOT NULL,
FOREIGN KEY (genre_id) REFERENCES genres (genre_id)
);

CREATE TABLE images (
game_id INT NOT NULL,
image_url VARCHAR(150) NOT NULL,
PRIMARY KEY (game_id, image_url),
FOREIGN KEY (game_id) REFERENCES games (game_id)
);

CREATE TABLE alt_titles (
game_id INT NOT NULL,
alt_title VARCHAR(150) NOT NULL,
PRIMARY KEY (game_id, alt_title),
FOREIGN KEY (game_id) REFERENCES games (game_id)
);

create table games_embedding(
game_id int not null,
embedding_value_title JSON not null,
embedding_value_genre JSON not null,
FOREIGN KEY (game_id) references games (game_id)
);


ALTER TABLE users
ADD CONSTRAINT unique_username UNIQUE (username);
