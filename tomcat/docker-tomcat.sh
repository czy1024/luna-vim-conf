#!/bin/bash

echo "拉取镜像tomcat"
docker pull tomcat
# 启动工作目录
echo "启动工作目录"
docker run -p 8088:8080 \
   --name tomcat \
	-d tomcat
# 拷贝工作目录	
echo "拷贝工作目录"
sudo mkdir ~/tomcat
sudo docker cp tomcat:/usr/local/tomcat/conf  ~/tomcat
# 停止
docker stop tomcat
# 移除
docker rm tomcat
# 运行
echo "运行mysql 8088:8080 "
sudo docker run -d \
   -v ~/tomcat/logs:/mnt/applog \
   -v ~/tomcat/webapps:/usr/local/tomcat/webapps \
   -v ~/tomcat/conf:/usr/local/tomcat/conf \
   -v ~/ssl:/usr/local/tomcat/ssl \
   -e TZ="Asia/Shanghai" \
   --restart=always \
   --privileged=true \
   --name tomcat \
   -p 8088:8080 \
   -p 8443:8443 \
   tomcat
