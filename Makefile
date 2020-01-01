# Starts all services for the app
start:
	docker-compose up

# Starts up a rails console in the api container
rails_console:
	docker exec -it api rails c

# Starts up a guard console in the api container
guard_console:
	docker exec -it api guard

# Starts up a psql console in the db container
psql_console:
	docker exec -it db psql -U postgres app_development