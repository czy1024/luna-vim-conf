#!/bin/bash
# 拉取镜像
docker pull riveryang/dubbo-admin
echo "9600>8080"
 # dubbo-admin管理中心
docker run -d \
	--name dubbo-admin \
	-v ~/dubbo/admin/data:/data \
	-p 9600:8080 \
	-e DUBBO_REGISTRY="zookeeper:\/\/106.14.30.12:2181" \
	-e DUBBO_ROOT_PASSWORD=root \
	-e DUBBO_GUEST_PASSWORD=root \
	--restart=always \
	riveryang/dubbo-admin


docker pull jeromefromcn/dubbo-monitor
# dubbo-monitor监控中心
docker run -d \
	--name dubbo-monitor \
	-v ~/dubbo/monitor/data:/dubbo-monitor/data \
	-e DUBBO_IP_TO_REGISTRY=106.14.30.12 \
	-e DUBBO_PORT_TO_REGISTRY=9700 \
	-p 9700:9700 \
	-p 9601:9601 \
	--restart=always \
	jeromefromcn/dubbo-monitor
