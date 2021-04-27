#!/bin/bash
echo "拉取镜像redis:5"
docker pull redis:5

sudo mkdir ~/redis

docker stop redis

docker rm redis
# 运行
echo "运行redis 6379:6379 "
sudo docker run -p 6379:6379 \
   --name redis \
   --restart always \
   -v ~/redis/data:/data \
   -d redis:5 \
   --appendonly yes \
   --requirepass "czy1024" 



    
   