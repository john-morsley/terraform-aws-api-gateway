#!/usr/bin/env bash

docker run --detach --publish 80:6000 johnmorsley/simple-api-2:v1

# Should now be available at: http://[]]/api/v1/grub