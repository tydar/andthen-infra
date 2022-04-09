CREATE DATABASE andthen;

\connect andthen;

CREATE TABLE users (
	id integer PRIMARY KEY,
	username varchar NOT NULL,
	salt varchar NOT NULL,
	password varchar NOT NULL
);

CREATE ROLE andthen_auth LOGIN;
ALTER ROLE andthen_auth WITH PASSWORD 'temporary_password';

ALTER TABLE users OWNER TO andthen_auth;
