CREATE DATABASE andthen;

\connect andthen;

CREATE TABLE users (
	id serial PRIMARY KEY,
	username varchar NOT NULL UNIQUE,
	password varchar NOT NULL,
	admin boolean
);

CREATE ROLE andthen_auth LOGIN;
ALTER ROLE andthen_auth WITH PASSWORD 'temporary_password';

ALTER TABLE users OWNER TO andthen_auth;

CREATE TABLE players (
	id serial PRIMARY KEY,
	display_name varchar,
	user_id int NOT NULL
);

CREATE ROLE andthen_players LOGIN;
ALTER ROLE andthen_players WITH PASSWORD 'temporary_password';

ALTER TABLE players OWNER TO andthen_players;

CREATE TABLE games (
	id serial PRIMARY KEY,
	owner_id int NOT NULL,
	player_ids int[] NOT NULL,
	words_per_move int NOT NULL,
	total_words_allowed int NOT NULL,
	current_word_index int NOT NULL
);

CREATE TABLE moves (
	id serial PRIMARY KEY,
	game_id int NOT NULL,
	player_id int NOT NULL,
	index_in_story int NOT NULL
);

CREATE ROLE andthen_games LOGIN;
ALTER ROLE andthen_games WITH PASSWORD 'temporary_password';

ALTER TABLE games OWNER TO andthen_games;
ALTER TABLE moves OWNER TO andthen_games;
