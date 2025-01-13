#!/bin/bash

echo -e "\nadding job for dkron 3.2.6"
curl --request POST localhost:8080/v1/jobs \
-H "Content-Type: application/json" \
-d '{
"name": "redis-check",
"schedule": "@every 10s",
"executor": "shell",
"executor_config": {
  "command": "redis-cli -h redis publish check 1"
}
}'

echo -e "\nadding job for dkron 3.2.7"
curl --request POST localhost:8081/v1/jobs \
-H "Content-Type: application/json" \
-d '{
"name": "redis-check",
"schedule": "@every 10s",
"executor": "shell",
"executor_config": {
  "command": "redis-cli -h redis publish check 1"
}
}'

echo -e "\nadding job for dkron 4.0.2"
curl --request POST localhost:8082/v1/jobs \
-H "Content-Type: application/json" \
-d '{
"name": "redis-check",
"schedule": "@every 10s",
"executor": "shell",
"executor_config": {
  "command": "redis-cli -h redis publish check 1"
}
}'

