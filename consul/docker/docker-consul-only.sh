#!/bin/bash

echo "拉取镜像consul"
docker pull consul

echo "
8500 : http 端口，用于 http 接口和 web ui访问；
8300 : server rpc 端口，同一数据中心 consul server 之间通过该端口通信；
8301 : serf lan 端口，同一数据中心 consul client 通过该端口通信; 用于处理当前datacenter中LAN的gossip通信；
8302 : serf wan 端口，不同数据中心 consul server 通过该端口通信; agent Server使用，处理与其他datacenter的gossip通信；
8600 : dns 端口，用于已注册的服务发现；"

echo "8300>8300 8301>8301 8302>8302 8400>8400 8500>8600 8600>8600 "
docker run -d --name=consul --restart always\
			 -p 8300:8300 \
             -p 8301:8301 \
             -p 8301:8301/udp \
             -p 8302:8302/udp \
             -p 8302:8302 \
             -p 8400:8400 \
             -p 8500:8500 \
             -p 8600:8600 \
	-v ~/consul/data:/consul/data \
	-v ~/consul/config:/consul/config \
	-v ~/consul/logs:/consul/logs \
	--privileged=true --restart always \
	consul agent -server \
	-client=0.0.0.0 -node=consul-serverI \
	-data-dir=/consul/data -log-file=/consul/logs -config-dir=/consul/config\
	-bootstrap-expect=1 -ui 
	 

