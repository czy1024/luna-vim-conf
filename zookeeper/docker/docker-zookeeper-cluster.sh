#!/bin/bash
# 拉取镜像
docker pull zookeeper

# 创建目录
mkdir ~/zookeeper
mkdir ~/zookeeper/nodeI/
mkdir ~/zookeeper/nodeII/
mkdir ~/zookeeper/nodeIII/

# 创建内部网络 用用于结点间通讯
docker network create \
	--driver bridge \
	--subnet=172.18.0.0/16 \
	--gateway=172.18.0.1 zoonet

# 查看网络
docker network ls
# 启动zookeeper容器
echo "2181->2181 ip:172.18.0.2"
docker run -d -p 2181:2181 --name zookeeper_nodeI --privileged=true --restart always --network zoonet --ip 172.18.0.2 \
-v ~/zookeeper/nodeI/volumes/data:/data \
-v ~/zookeeper/nodeI/volumes/datalog:/datalog \
-v ~/zookeeper/nodeI/volumes/logs:/logs \
-e ZOO_MY_ID=1 \
-e "ZOO_SERVERS=server.1=172.18.0.2:2888:3888;2181 server.2=172.18.0.3:2888:3888;2181 server.3=172.18.0.4:2888:3888;2181" zookeeper

echo "2181->2181 ip:172.18.0.3"
docker run -d -p 2182:2181 --name zookeeper_nodeII --privileged=true --restart always --network zoonet --ip 172.18.0.3 \
-v ~/zookeeper/nodeII/volumes/data:/data \
-v ~/zookeeper/nodeII/volumes/datalog:/datalog \
-v ~/zookeeper/nodeII/volumes/logs:/logs \
-e ZOO_MY_ID=2 \
-e "ZOO_SERVERS=server.1=172.18.0.2:2888:3888;2181 server.2=172.18.0.3:2888:3888;2181 server.3=172.18.0.4:2888:3888;2181" zookeeper

echo "2181->2181 ip:172.18.0.4"
docker run -d -p 2183:2181 --name zookeeper_nodeIII --privileged=true --restart always --network zoonet --ip 172.18.0.4 \
-v ~/zookeeper/nodeIII/volumes/data:/data \
-v ~/zookeeper/nodeIII/volumes/datalog:/datalog \
-v ~/zookeeper/nodeIII/volumes/logs:/logs \
-e ZOO_MY_ID=3 \
-e "ZOO_SERVERS=server.1=172.18.0.2:2888:3888;2181 server.2=172.18.0.3:2888:3888;2181 server.3=172.18.0.4:2888:3888;2181" zookeeper