#!/bin/bash
echo "拉取镜像redis"
docker pull redis

# 创建内部网络 用用于结点间通讯
docker network create \
	--driver bridge \
	--subnet=172.20.2.0/24 \
	--gateway=172.20.2.1 redisnet

# 创建目录
sudo mkdir ~/redis
sudo mkdir ~/redis/redis-master
sudo mkdir ~/redis/redis-slave-I
sudo mkdir ~/redis/redis-slave-II

sudo mkdir ~/redis/redis-sentinel-master
sudo mkdir ~/redis/redis-sentinel-I
sudo mkdir ~/redis/redis-sentinel-II

sudo cat > ~/redis/redis-master/redis_master.conf  <<EOF 
# 绑定
bind 0.0.0.0
#后台模式关闭，因为redis-server的运行后台和docker的后台模式冲突
daemonize no
# 连接保护模式关闭
protected-mode no
# 端口
port 6379
# 守护进程关闭
supervised no
# 数据库数量
databases 16
# rdb快照规则
# 在900秒（15分钟）后，如果至少更改了1个键
save 900 1
save 300 10
save 60 10000
# rdb快照文件名称
dbfilename dump.rdb
# 客户端连接数量设置
maxclients 10000
# AOF模式开启，默认关闭
appendonly yes
# 文件名
appendfilename "appendonly.aof"
# AOF同步机制 
# 每秒同步
appendfsync everysec
# 文件大小切割
auto-aof-rewrite-percentage 100
auto-aof-rewrite-min-size 64mb
# 淘汰机制设置
maxmemory-policy noeviction

#密码设置
requirepass czy1024
# 连接主机密码
masterauth czy1024

EOF
# 复制配置文件
cp ~/redis/redis-master/redis_master.conf ~/redis/redis-slave-I/redis_slave.conf 
# 追加配置
sudo cat >> ~/redis/redis-slave-I/redis_slave.conf  <<EOF 
replicaof 172.20.2.2 6379
masterauth czy1024
EOF

# 复制结点II
cp ~/redis/redis-slave-I/redis_slave.conf ~/redis/redis-slave-II/redis_slave.conf 

sudo cat > ~/redis/redis-sentinel-master/sentinel.conf <<EOF 
bind 0.0.0.0
# 端口号
port 26379
# 关闭保护模式
protected-mode no
# 开启后台运行
daemonize yes
#日志
logfile "/data/sentinel.log"

# 配置监听的主服务器，sentinel monitor代表监控，mymaster代表服务器名称（自己定义），172.20.2.2代表监控的主服务器，6379代表端口，2代表只有两个或者两个以上的哨兵认为主服务器不可以用的时候，才会进行failover操作
sentinel monitor mymaster 172.20.2.2 6379 1
# sentinel auth-pass定义服务的密码，mymaster是服务名称，czy1024是密码
sentinel auth-pass mymaster czy1024
# 设置主机多少秒无应答，就认为下线
sentinel down-after-milliseconds mymaster 30000
# 主备切换时，最多有几个slave同时对新的master进行同步，默认是1
sentinel parallel-syncs mymaster 1
# 故障转移
sentinel failover-timeout mymaster 180000

EOF

# 复制文件
cp  ~/redis/redis-sentinel-master/sentinel.conf  ~/redis/redis-sentinel-I/sentinel.conf

cp  ~/redis/redis-sentinel-master/sentinel.conf  ~/redis/redis-sentinel-II/sentinel.conf

# 运行
echo "运行redis-master 172.20.2.2 26379:26379 6379:6379 "
sudo docker run -p 6379:6379  -p 26379:26379 --net=redisnet \
   --name redis-master \
   --restart always \
   --ip 172.20.2.2 \
   -e TZ="Asia/Shanghai" \
   -v ~/redis/redis-master/data:/data \
   -v  ~/redis/redis-master/redis_master.conf:/etc/redis/redis_slave.conf \
   -v ~/redis/redis-sentinel-master/sentinel.conf:/etc/redis/sentinel.conf \
   -d redis sh -c "redis-sentinel /etc/redis/sentinel.conf && redis-server /etc/redis/redis_slave.conf" \

  
echo "运行redis-slave-I 172.20.2.3 26380:26379 6381:6379 "
sudo docker run -p 6380:6379 -p 26380:26379 --net=redisnet \
   --name redis-slave-I \
   --restart always \
   --ip 172.20.2.3 \
   -e TZ="Asia/Shanghai" \
   -v ~/redis/redis-slave-I/data:/data \
   -v  ~/redis/redis-slave-I/redis_slave.conf:/etc/redis/redis_slave.conf \
   -v ~/redis/redis-sentinel-I/sentinel.conf:/etc/redis/sentinel.conf \
   -d redis sh -c "redis-sentinel /etc/redis/sentinel.conf && redis-server /etc/redis/redis_slave.conf" \


echo "运行redis-slave-II 172.20.2.4 26381:26379  6381:6379 "
sudo docker run -p 6381:6379 -p 26381:26379 --net=redisnet \
   --name redis-slave-II \
   --restart always \
   --ip 172.20.2.4 \
   -e TZ="Asia/Shanghai" \
   -v ~/redis/redis-slave-II/data:/data \
   -v  ~/redis/redis-slave-II/redis_slave.conf:/etc/redis/redis_slave.conf \
   -v ~/redis/redis-sentinel-II/sentinel.conf:/etc/redis/sentinel.conf \
   -d redis sh -c "redis-sentinel /etc/redis/sentinel.conf && redis-server /etc/redis/redis_slave.conf" \


# docker exec -it redis-master bash -c "redis-cli -p 6379 -a czy1024"
# docker exec -it redis-slave-I bash -c "redis-cli -p 6379 -a czy1024"
# docker exec -it redis-slave-II bash -c "redis-cli -p 6379 -a czy1024"

# docker stop redis-master redis-slave-I redis-slave-II
# docker rm redis-master redis-slave-I redis-slave-II