#!/bin/bash
echo "拉取镜像redis"
docker pull redis

sudo mkdir ~/redis

# 运行
echo "运行mysql 16379:6379 "
sudo docker run -p 16379:6379 \
   --name redis \
   --restart always \
   -v ~/redis/data:/data \
   -d redis \
   --appendonly yes \
   --requirepass "czy1024" 



    
   