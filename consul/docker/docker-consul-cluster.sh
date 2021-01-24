#!/bin/bash

echo "拉取镜像consul"
docker pull consul

# 创建目录
mkdir ~/consul
mkdir ~/consul/nodeI/
mkdir ~/consul/nodeII/
mkdir ~/consul/nodeIII/

echo "
8500 : http 端口，用于 http 接口和 web ui访问；
8300 : server rpc 端口，同一数据中心 consul server 之间通过该端口通信；
8301 : serf lan 端口，同一数据中心 consul client 通过该端口通信; 用于处理当前datacenter中LAN的gossip通信；
8302 : serf wan 端口，不同数据中心 consul server 通过该端口通信; agent Server使用，处理与其他datacenter的gossip通信；
8600 : dns 端口，用于已注册的服务发现；"

# 创建内部网络 用用于结点间通讯
docker network create \
	--driver bridge \
	--subnet=172.20.0.0/24 \
	--gateway=172.20.0.1 consulnet
	
echo "consul-server-node-I 172.20.0.2"
docker run -d --name=consul-server-node-I --net=consulnet\
			 -p 8300:8300 \
             -p 8301:8301 \
             -p 8301:8301/udp \
             -p 8302:8302/udp \
             -p 8302:8302 \
             -p 8400:8400 \
             -p 8500:8500 \
             -p 8600:8600 \
	-v ~/consul/nodeI/data:/consul/data \
	-v ~/consul/nodeI/logs:/consul/logs \
	-v ~/consul/nodeI/config:/consul/config \
	--privileged=true --restart always \
	consul agent -server \
	-client=0.0.0.0 -bind=172.20.0.2 -node=consul-server-node-I \
	-data-dir=/consul/data -log-file=/consul/logs -config-dir=/consul/config\
	-bootstrap-expect=1 -ui 
			 
echo "consul-server-node-II 172.20.0.3"
docker run -d --name=consul-server-node-II  --net=consulnet\
			 -p 8310:8300 \
             -p 8311:8301 \
             -p 8311:8301/udp \
             -p 8312:8302/udp \
             -p 8312:8302 \
             -p 8410:8400 \
             -p 8510:8500 \
             -p 8610:8600 \
	-v ~/consul/nodeII/data:/consul/data \
	-v ~/consul/nodeII/logs:/consul/logs \
	-v ~/consul/nodeII/config:/consul/config \
	--privileged=true --restart always \
	consul agent -server \
	-client=0.0.0.0 -bind=172.20.0.3 -retry-join=172.20.0.2 -node=consul-server-node-II \
	-data-dir=/consul/data -log-file=/consul/logs -config-dir=/consul/config\
	-bootstrap-expect=2 -ui 
			 
echo "consul-server-node-III 172.20.0.4"
docker run -d --name=consul-server-node-III --net=consulnet\
			 -p 8320:8300 \
             -p 8321:8301 \
             -p 8321:8301/udp \
             -p 8322:8302/udp \
             -p 8322:8302 \
             -p 8420:8400 \
             -p 8520:8500 \
             -p 8620:8600 \
	-v ~/consul/nodeIII/data:/consul/data \
	-v ~/consul/nodeIII/logs:/consul/logs \
	-v ~/consul/nodeIII/config:/consul/config \
	--privileged=true --restart always \
	consul agent -server \
	-client=0.0.0.0 -bind=172.20.0.4 -retry-join=172.20.0.2 -node=consul-server-node-III \
	-data-dir=/consul/data -log-file=/consul/logs -config-dir=/consul/config\
	-bootstrap-expect=3 -ui 
			  
#查看consul节点情况：
docker exec -t consul-server-node-I consul members