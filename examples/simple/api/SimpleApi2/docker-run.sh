#!/usr/bin/env bash

echo "# Should now be available at: http://localhost:8081/api/v1/grub"

docker run --publish 8081:6000 johnmorsley/simple-api-2:v1