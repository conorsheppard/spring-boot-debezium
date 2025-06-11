SHELL := /bin/bash

default: up

up:
	docker-compose up --build --force-recreate

down:
	docker-compose down -v

connect:
	./shell/register-debezium-connector.sh

consume:
	docker exec kafka-console-consumer

ssh-db:
	docker exec -it postgres-sbd psql -U postgres -d bank

.SILENT:
.PHONY: default run
