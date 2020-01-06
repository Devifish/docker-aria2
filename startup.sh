#!/bin/bash

docker-compose stop
docker-compose rm -f
docker rmi $(docker images -f "dangling=true" -q)

# 创建并运行服务
docker-compose build
docker-compose up -d