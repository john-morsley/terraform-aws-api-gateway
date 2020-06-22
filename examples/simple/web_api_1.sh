#!/usr/bin/env bash

docker run --detach --publish 80:5000 johnmorsley/simple-api-1:v1

# Should now be available at: http://[]]/api/v1/greeting