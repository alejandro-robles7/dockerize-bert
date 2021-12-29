#!/bin/sh

docker build -t bert-lambda .
docker run -p 8080:8080 bert-lambda
