#!/bin/bash
echo "拉取镜像rabbitmq:3.7.15"
docker pull rabbitmq:3.7.15

docker run -d  \
 --hostname rabbitmq \
 --name rabbitmq \
 -e TZ="Asia/Shanghai" \
 -e RABBITMQ_DEFAULT_USER=guest \
 -e RABBITMQ_DEFAULT_PASS=guest \
 -p 15672:15672 \
 -p 5672:5672 \
 -p 25672:25672 rabbitmq:3.7.15 

sudo mkdir -p ~/rabbitmq/conf
sudo docker cp rabbitmq:/var/lib/rabbitmq/mnesia  ~/rabbitmq
docker stop rabbitmq
docker rm rabbitmq

#--hostname  主机名（RabbitMQ的一个重要注意事项是它根据所谓的 “节点名称” 存储数据，默认为主机名）；
#-e 指定环境变量；（RABBITMQ_DEFAULT_VHOST：默认虚拟机名；RABBITMQ_DEFAULT_USER：默认的用户名；RABBITMQ_DEFAULT_PASS：默认用户名的密码）
# 运行
echo " 15672:15672  5672:5672  25672:25672  "
docker run -d \
 --hostname rabbitmq \
 --name rabbitmq \
 --restart=always \
 -e RABBITMQ_DEFAULT_USER=mall \
 -e RABBITMQ_DEFAULT_PASS=mall \
 -e RABBITMQ_DEFAULT_VHOST=ems \
 -v ~/rabbitmq/mnesia:/var/lib/rabbitmq/mnesia \
 -p 15672:15672 \
 -p 5672:5672 \
 -p 25672:25672 \
 rabbitmq:3.7.15 

# 开启web页面管理
docker exec -it rabbitmq rabbitmq-plugins enable rabbitmq_management
