### Instructions

1. Execute `make`  


2. Register the connector

```shell
sh register-debezium-connector.sh
```

3. cURL the accounts endpoint

```shell
curl -X POST http://localhost:8080/accounts/1/deposit\?amount\=5
```
Result: `Deposit successful%`

4. Consume from the Kafka topic

```shell
make consume
```
