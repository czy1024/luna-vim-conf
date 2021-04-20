#!/bin/bash
echo "拉取镜像rabbitmq"
docker pull rabbitmq

# 创建内部网络 用用于结点间通讯
docker network create \
	--driver bridge \
	--subnet=172.20.3.0/24 \
	--gateway=172.20.3.1 rabbitmqnet

# 1.为什么要配置相同的erlang cookie？
# 因为RabbitMQ是用Erlang实现的，
# Erlang Cookie相当于不同节点之间相互通讯的秘钥，Erlang节点通过交换Erlang Cookie获得认证。
mkdir ~/rabbitmq
sudo cat > ~/rabbitmq/.erlang.cookie << EOF 
rabbitcookie
EOF

echo "rabbitmq-I"
docker run -d --net=rabbitmqnet \
 --hostname rabbitmq-node-I \
 --name rabbitmq-I \
 --ip 172.20.3.2 \
 -e TZ="Asia/Shanghai" \
 -e RABBITMQ_DEFAULT_USER=guest \
 -e RABBITMQ_DEFAULT_PASS=guest \
 -v ~/rabbitmq/.erlang.cookie:/var/lib/rabbitmq/.erlang.cookie \
 -p 15672:15672 \
 -p 5672:5672 \
 -p 25672:25672 rabbitmq 

echo "rabbitmq-II"
docker run -d --net=rabbitmqnet \
 --hostname rabbitmq-node-II \
 --name rabbitmq-II --link rabbitmq-I:rabbitmq-node-I \
 --ip 172.20.3.3 \
 -e TZ="Asia/Shanghai" \
 -e RABBITMQ_DEFAULT_USER=guest \
 -e RABBITMQ_DEFAULT_PASS=guest \
 -v ~/rabbitmq/.erlang.cookie:/var/lib/rabbitmq/.erlang.cookie \
 -p 15673:15672 \
 -p 5673:5672 \
 -p 25673:25672 rabbitmq 

echo "rabbitmq-III"
 docker run -d --net=rabbitmqnet \
 --hostname rabbitmq-node-III \
 --name rabbitmq-III  --link rabbitmq-I:rabbitmq-node-I  --link rabbitmq-II:rabbitmq-node-II \
 --ip 172.20.3.4 \
 -e TZ="Asia/Shanghai" \
 -e RABBITMQ_DEFAULT_USER=guest \
 -e RABBITMQ_DEFAULT_PASS=guest \
 -v ~/rabbitmq/.erlang.cookie:/var/lib/rabbitmq/.erlang.cookie \
 -p 15674:15672 \
 -p 5674:5672 \
 -p 25674:25672 rabbitmq 

# 开启web管理界面
docker exec -it rabbitmq-I rabbitmq-plugins enable rabbitmq_management
docker exec -it rabbitmq-I rabbitmqctl stop_app
docker exec -it rabbitmq-I rabbitmqctl reset
# 重启
docker exec -it rabbitmq-I rabbitmqctl start_app

docker exec -it rabbitmq-II rabbitmqctl stop_app
docker exec -it rabbitmq-II rabbitmqctl reset
# “--ram”表示设置为内存节点，忽略次参数默认为磁盘节点。
docker exec -it rabbitmq-II rabbitmqctl join_cluster rabbit@rabbitmq-node-I
# 重启
docker exec -it rabbitmq-II rabbitmqctl start_app


docker exec -it rabbitmq-III rabbitmqctl stop_app
docker exec -it rabbitmq-III rabbitmqctl reset
# “--ram”表示设置为内存节点，忽略次参数默认为磁盘节点。
docker exec -it rabbitmq-III rabbitmqctl join_cluster  rabbit@rabbitmq-node-I
# 重启
docker exec -it rabbitmq-III rabbitmqctl start_app


#docker stop rabbitmq-I rabbitmq-II rabbitmq-III
#docker rm rabbitmq-I rabbitmq-II rabbitmq-III

docker exec -it rabbitmq-I rabbitmqctl cluster_status

# 1.查看当前策略
docker exec -it rabbitmq-I  rabbitmqctl list_policies

# 2.添加策略
docker exec -it rabbitmq-I  rabbitmqctl set_policy ha-all '^luna' '{"ha-mode":"all","ha-sync-mode":"automatic"}' 
#说明:策略正则表达式为 “^” 表示所有匹配所有队列名称  ^luna:匹配luna开头队列

# 3.删除策略
# rabbitmqctl clear_policy ha-all