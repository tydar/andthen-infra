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
