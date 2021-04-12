#!/bin/bash
echo "拉取镜像redis"
docker pull redis

sudo mkdir ~/redis/redis-master
sudo mkdir ~/redis/redis-solve-I
sudo mkdir ~/redis/redis-solve-II

echo "6379 redis"


# 创建内部网络 用用于结点间通讯
docker network create \
	--driver bridge \
	--subnet=172.20.2.0/24 \
	--gateway=172.20.2.1 redisnet

# 运行
echo "运行redis-master 172.20.2.2 6379:6379 "
sudo docker run -p 6379:6379 --net=redisnet \
   --name redis-master \
   --restart always \
   --ip 172.20.2.2 \
   -v ~/redis/redis-master/data:/data \
   -d redis \
   --bind 0.0.0.0  \
   --requirepass "czy1024" 
  
echo "运行redis-solve-I 172.20.2.3 6381:6379 "
sudo docker run -p 6380:6379 --net=redisnet \
   --name redis-solve-I \
   --restart always \
   --ip 172.20.2.3 \
   -v ~/redis/redis-solve-I/data:/data \
   -d redis \
   --slaveof 172.20.2.2 6379\
   --bind 0.0.0.0  \
   --masterauth czy1024 \
   --port 6379 \
   --requirepass "czy1024" 

echo "运行redis-solve-II 172.20.2.4 6381:6379 "
sudo docker run -p 6381:6379 --net=redisnet \
   --name redis-solve-II \
   --restart always \
   --ip 172.20.2.4 \
   -v ~/redis/redis-solve-II/data:/data \
   -d redis \
   --slaveof 172.20.2.2 6379\
   --bind 0.0.0.0  \
   --masterauth czy1024 \
   --port 6379 \
   --requirepass "czy1024" 