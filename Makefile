SHELL := /bin/bash

default: up

clean:
	mvn clean

package: clean
	mvn package -DskipTests

build: package
	docker build --no-cache . -t conorsheppard/spring-boot-debezium

up:
	docker-compose up --build --force-recreate

down:
	docker-compose down -v

connect:
	./shell/register-debezium-connector.sh

consume:
	docker exec -it kafka-sbd kafka-console-consumer --bootstrap-server kafka-sbd:9092 --topic bank_server.public.account --from-beginning

ssh-db:
	docker exec -it postgres-sbd psql -U postgres -d bank

.SILENT:
.PHONY: default up down connect consume ssh-db
