# And Then infrastructure

And Then is a simple web game developed using a microservice architecture. Two or more players collaboratively create a short story by taking turns adding words.

It would be more straightforward to write this using a monolithic architecture but I have been curious about the execution of microservice-architected software and though a simple game was a fun way to learn a bit more, practically.

To run an instance of And Then, simply `docker-compose up`. Currently configured for local development.

Cross project opeartional TODOs before deploying to a production infrastructure:
* Update JWT secrets to be secrets.
* Update database credentials to be secret.
I'm sure there are others...

## Database

Postgres database intialized using the file `schema.sql`.

## Gateway

Haproxy configured using `haproxy.cfg`.

## Microservices

* [Auth](https://github.com/tydar/andthen-auth)
	* Written in Go
	* Hand-rolled JWT implementation (so, probably not secure)
	* Stateless auth & refresh token system.
	* Interacts with other services using asynchronous communications via PG listen/notify.
* [Players](https://github.com/tydar/andthen-players)
	* Express
	* Handles player's identity for game purposes.
	* Matches users authenticated user ID to a player ID and provides a JWT wrapping this info.
* [Games](https://github.com/tydar/andthen-games)
 	* Express
	* Handles the play of games
	* Matches users to games
	* Validates player moves
	* Doesn't store current game state but instead stores list of moves to reconstruct game state.

Final necessary piece of the puzzle will be a frontend -- likely written in React, but who knows!
