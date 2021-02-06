#!/bin/bash
echo "拉取镜像nacos/nacos-server"
docker pull nacos/nacos-server #拉取nacos镜像

docker run -d \
--name nacos \
-p 8848:8848 \
-e MODE=standalone \
-e PREFER_HOST_MODE=hostname \
-e MYSQL_SERVICE_HOST=192.168.65.1 \
-e MYSQL_SERVICE_DB_NAME=nacos_devtest \
-e MYSQL_SERVICE_PORT=3306 \
-e MYSQL_SERVICE_USER=nacos \
-e MYSQL_SERVICE_PASSWORD=nacos \
-e NACOS_SERVER_PORT=8848 \
-e JVM_XMS=256m -e JVM_XMX=256m  \
nacos/nacos-server

