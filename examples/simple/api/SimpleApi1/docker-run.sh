#!/usr/bin/env bash

echo "# Should now be available at: http://localhost:8080/api/v1/greeting"

docker run --publish 8080:5000 johnmorsley/simple-api-1:v1

