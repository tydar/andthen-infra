CREATE DATABASE andthen;

\connect andthen;

CREATE TABLE users (
	id serial PRIMARY KEY,
	username varchar NOT NULL UNIQUE,
	password varchar NOT NULL
);

CREATE ROLE andthen_auth LOGIN;
ALTER ROLE andthen_auth WITH PASSWORD 'temporary_password';

ALTER TABLE users OWNER TO andthen_auth;
