#!/bin/bash

mkdir ~/redis/redis-sentinel-I
mkdir ~/redis/redis-sentinel-II
mkdir ~/redis/redis-sentinel-III

sudo cat > ~/redis/redis-sentinel-I/sentinel.conf <<EOF 
port 26379
dir /tmp
# 自定义集群名，其中 172.20.2.2 为 redis-master 的 ip，6379 为 redis-master 的端口，2 为最小投票数（因为有 3 台 Sentinel 所以可以设置成 2）
sentinel monitor mymaster 172.20.2.2 6379 1
sentinel down-after-milliseconds mymaster 30000
sentinel parallel-syncs mymaster 1
sentinel auth-pass mymaster czy1024
sentinel failover-timeout mymaster 180000
sentinel deny-scripts-reconfig yes
EOF

echo "运行redis-sentinel-I 172.20.2.11 26379:26379 "
sudo docker run -p 26379:26379 --net=redisnet \
   --name redis-sentinel-I  \
   --restart always \
   --ip 172.20.2.11 \
   -v ~/redis/redis-sentinel-I/sentinel.conf:/usr/local/etc/redis/sentinel.conf\
   -d redis \
   --redis-sentinel /usr/local/etc/redis/sentinel.conf 
