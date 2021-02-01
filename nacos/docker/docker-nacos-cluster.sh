#!/bin/bash
echo "拉取镜像nacos/nacos-server"
docker pull nacos/nacos-server #拉取nacos镜像

docker network create \
	--driver bridge \
	--subnet=172.16.30.0/24 \
	--gateway=172.16.30.1 nacosnet

echo "拉取镜像nacos/nacos-mysql:5.7"
docker pull nacos/nacos-mysql:5.7
# 启动工作目录
echo "启动工作目录"
docker run -p 3307:3306 --name nacos-mysql \
 	-e MYSQL_ROOT_PASSWORD=czy1024 \
	-d nacos/nacos-mysql:5.7
# 拷贝工作目录	
echo "拷贝工作目录"
sudo mkdir -p /root/nacos/mysql
sudo docker cp mysql:/etc/mysql/     /root/nacos/mysql/luna-conf/
# 停止
docker stop nacos-mysql
# 移除
docker rm nacos-mysql
# 运行
echo "运行mysql 端口3307 密码czy1024"

 sudo docker run -d -p 3307:3306 --network nacosnet --ip 172.16.30.9 \
    --name nacos-mysql \
    --restart always \
    --privileged=true \
 	  -e MYSQL_ROOT_PASSWORD=czy1024 \
    -v /root/nacos/mysql/log:/var/log/mysql \
	  -v /root/nacos/mysql/data/mysql:/var/lib/mysql \
	  -v /root/nacos/mysql/luna-conf:/etc/mysql \
 nacos/nacos-mysql:5.7 \
 --default-authentication-plugin mysql_native_password \
 --character-set-server utf8 \
 --collation-server utf8_general_ci 

#创建挂载文件路径
mkdir -p /root/nacos/nacos-node-I /root/nacos/nacos-node-II /root/nacos/nacos-node-III

echo "
#spring.security.enabled=false
#management.security=false
#security.basic.enabled=false
#nacos.security.ignore.urls=/**
#management.metrics.export.elastic.host=http://localhost:9200
# metrics for prometheus
management.endpoints.web.exposure.include=*

# metrics for elastic search
#management.metrics.export.elastic.enabled=false
#management.metrics.export.elastic.host=http://localhost:9200

# metrics for influx
#management.metrics.export.influx.enabled=false
#management.metrics.export.influx.db=springboot
#management.metrics.export.influx.uri=http://localhost:8086
#management.metrics.export.influx.auto-create-db=true
#management.metrics.export.influx.consistency=one
#management.metrics.export.influx.compressed=true
" > /root/nacos/custom.properties 

docker pull nacos/nacos-server 

echo"nacos1 server 7848"
docker run -d --network nacosnet --ip 172.16.30.11 --name nacos-node-I \
  -p 7848:8848 \
  -e NACOS_SERVER_PORT=8848 \
  -e NACOS_SERVERS="172.16.30.11:8848 172.16.30.12:8848 172.16.30.13:8848" \
  -e MODE=cluster \
  -e PREFER_HOST_MODE=hostname \
  -e MYSQL_SERVICE_HOST=172.16.30.9 \
  -e MYSQL_SERVICE_DB_NAME=nacos \
  -e MYSQL_SERVICE_PORT=3306 \
  -e MYSQL_SERVICE_USER=root \
  -e MYSQL_SERVICE_PASSWORD=czy1024 \
  -e NACOS_SERVER_PORT=8848 \
  -e NACOS_SERVER_IP=172.16.30.11 \
  -e JVM_XMS=256m \
  -e JVM_XMX=256m  \
  -e JVM_XMN=256m  \
  -v /root/nacos/nacos-node-I/logs:/home/nacos/logs \
  -v /root/nacos/custom.properties:/home/nacos/init.d/custom.properties \
nacos/nacos-server

echo"nacos1 server 7849"
docker run -d  --network nacosnet --ip 172.16.30.12 --name nacos-node-II \
  -p 7849:8848 \
  -e NACOS_SERVER_PORT=8848 \
  -e NACOS_SERVERS="172.16.30.11:8848 172.16.30.12:8848 172.16.30.13:8848" \
  -e MODE=cluster \
  -e PREFER_HOST_MODE=hostname \
  -e MYSQL_SERVICE_HOST=172.16.30.9 \
  -e MYSQL_SERVICE_DB_NAME=nacos \
  -e MYSQL_SERVICE_PORT=3306 \
  -e MYSQL_SERVICE_USER=root \
  -e MYSQL_SERVICE_PASSWORD=czy1024 \
  -e NACOS_SERVER_PORT=8848 \
  -e NACOS_SERVER_IP=172.16.30.12 \
  -e JVM_XMS=256m \
  -e JVM_XMX=256m  \
  -e JVM_XMN=256m  \
  -v /root/nacos/nacos-node-III/logs:/home/nacos/logs \
  -v /root/nacos/custom.properties:/home/nacos/init.d/custom.properties \
nacos/nacos-server

echo"nacos3 server 7850"
docker run -d  --network nacosnet --ip 172.16.30.13 --name nacos-node-III \
  -p 7850:8848 \
  -e NACOS_SERVER_PORT=8848 \
  -e NACOS_SERVERS="172.16.30.11:8848 172.16.30.12:8848 172.16.30.13:8848" \
  -e MODE=cluster \
  -e PREFER_HOST_MODE=hostname \
  -e MYSQL_SERVICE_HOST=172.16.30.9 \
  -e MYSQL_SERVICE_DB_NAME=nacos \
  -e MYSQL_SERVICE_PORT=3306 \
  -e MYSQL_SERVICE_USER=root \
  -e MYSQL_SERVICE_PASSWORD=czy1024 \
  -e NACOS_SERVER_PORT=8848 \
  -e NACOS_SERVER_IP=172.16.30.13 \
  -e JVM_XMS=256m \
  -e JVM_XMX=256m  \
  -e JVM_XMN=256m  \
  -v /root/nacos/nacos-node-III/logs:/home/nacos/logs \
  -v /root/nacos/custom.properties:/home/nacos/init.d/custom.properties \
nacos/nacos-server