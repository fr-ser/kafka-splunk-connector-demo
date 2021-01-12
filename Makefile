teardown:
	docker-compose down --remove-orphans --volumes --timeout=5

restart-kafka-connect:
	docker-compose up --build connect0 connect1

connector-install:
	curl --silent -X POST -H "Content-Type: application/json" -d @splunk-sink.json http://localhost:8083/connectors/ | jq .

connector-delete:
	curl --silent -X DELETE http://localhost:8083/connectors/SplunkSink/ | jq .

connector-status:
	curl --silent http://localhost:8083/connectors/SplunkSink/status/ | jq .

start-splunk:
	docker-compose up --detach --build splunk
	@echo Should be running at http://localhost:8000

start-kafka-connect:
	docker-compose pull
	docker-compose build
	docker-compose run --rm kafka-cli
	docker-compose run --rm wait-for-kafka-connect

publish-events:
	echo a$$(date +%s%N) | kafkacat -P -b localhost:9092 -t test.topic
	echo b$$(date +%s%N) | kafkacat -P -b localhost:9092 -t test.topic
