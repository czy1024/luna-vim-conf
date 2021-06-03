#!/bin/bash
# 拉取镜像
docker pull zookeeper

# 启动单机容器
mkdir ~/zookeeper

echo "2181->2181 2888>2888 3888>3888"
docker run -d -p 2181:2181 -p 2888:2888 -p 3888:3888 --name zookeeper --privileged 	--restart always \
	-v ~/zookeeper/volumes/data:/data \
	-v ~/zookeeper/volumes/datalog:/datalog \
	-v ~/zookeeper/volumes/logs:/logs \
	zookeeper
