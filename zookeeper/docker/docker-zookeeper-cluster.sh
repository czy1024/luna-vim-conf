#!/bin/bash
# 拉取镜像
docker pull zookeeper

mkdir /roor/zookeeper
mkdir /roor/zookeeper/node1/
mkdir /roor/zookeeper/node2/
mkdir /roor/zookeeper/node3/

# 创建内部网络 用用于结点间通讯
docker network create \
	--driver bridge \
	--subnet=172.18.0.0/16 \
	--gateway=172.18.0.1 zoonet

# 查看网络
docker network ls
# 启动zookeeper容器
echo "2181->2181 ip:172.18.0.2"
docker run -d -p 2181:2181 --name zookeeper_node1 --privileged --restart always --network zoonet --ip 172.18.0.2 \
-v /roor/zookeeper/node1/volumes/data:/data \
-v /roor/zookeeper/node1/volumes/datalog:/datalog \
-v /roor/zookeeper/node1/volumes/logs:/logs \
-e ZOO_MY_ID=1 \
-e "ZOO_SERVERS=server.1=172.18.0.2:2888:3888;2181 server.2=172.18.0.3:2888:3888;2181 server.3=172.18.0.4:2888:3888;2181" zookeeper

echo "2181->2181 ip:172.18.0.3"
docker run -d -p 2182:2181 --name zookeeper_node2 --privileged --restart always --network zoonet --ip 172.18.0.3 \
-v /roor/zookeeper/node2/volumes/data:/data \
-v /roor/zookeeper/node2/volumes/datalog:/datalog \
-v /roor/zookeeper/node2/volumes/logs:/logs \
-e ZOO_MY_ID=2 \
-e "ZOO_SERVERS=server.1=172.18.0.2:2888:3888;2181 server.2=172.18.0.3:2888:3888;2181 server.3=172.18.0.4:2888:3888;2181" zookeeper

echo "2181->2181 ip:172.18.0.4"
docker run -d -p 2183:2181 --name zookeeper_node3 --privileged --restart always --network zoonet --ip 172.18.0.4 \
-v /roor/zookeeper/node3/volumes/data:/data \
-v /roor/zookeeper/node3/volumes/datalog:/datalog \
-v /roor/zookeeper/node3/volumes/logs:/logs \
-e ZOO_MY_ID=3 \
-e "ZOO_SERVERS=server.1=172.18.0.2:2888:3888;2181 server.2=172.18.0.3:2888:3888;2181 server.3=172.18.0.4:2888:3888;2181" zookeeper