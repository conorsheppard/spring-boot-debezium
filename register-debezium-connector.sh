#!/bin/zsh

curl -X POST http://localhost:8083/connectors \
  -H "Content-Type: application/json" \
  -d '{
    "name": "bank-connector",
    "config": {
      "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
      "database.hostname": "postgres",
      "database.port": "5432",
      "database.user": "postgres",
      "database.password": "password",
      "database.dbname": "bank",
      "database.server.name": "bank_server",
      "table.include.list": "public.account",
      "plugin.name": "pgoutput",
      "slot.name": "debezium_slot",
      "topic.prefix": "bank_server",
      "decimal.handling.mode": "string"
    }
  }'
