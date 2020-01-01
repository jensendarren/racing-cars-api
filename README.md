# Racing Cars API

Basic racing cars API sample app

## Start the Application via Docker Compose

The application is using Docker so simply run:

```
docker-compose up
```

This starts up two services: the Rails API and the Postgres DB.

## Using Docker for the Terminal

Since Docker is used we need to first start the applicaton as mentioned above. Then start a terminal session in the running `api` container like so:

```
docker exec -it api bash
```

After that we can run any rails related commands in the running container.

Also check the [Makefile](./Makefile) for other useful commands.

## Create and seed database and call endpoint

Create the database and add seed data using the standard `rake` commands and then navigate to [http://localhost:3000/api/v1/cars/lamborghini_aventador](http://localhost:3000/api/v1/cars/lamborghini_aventador) to view the JSON response from the endpoint.

Try also passing a track name as follows: [http://localhost:3000/api/v1/cars/lamborghini_aventador?track=Nurburgring](http://localhost:3000/api/v1/cars/lamborghini_aventador?track=Nurburgring)

## Run tests in Docker

From within a running Docker container session run the specs as follows

```
rake spec
```

## Applicaton creation

The application was built in Docker using the following command:

```
docker-compose run api bundle exec rails new . --force --no-deps --skip-test-unit --api --database=postgresql
```