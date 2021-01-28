#!/bin/bash
echo "拉取镜像rabbitmq"
docker pull rabbitmq

docker run -d \
 --hostname rabbitmq \
 --name rabbitmq \
 -e RABBITMQ_DEFAULT_USER=admin \
 -e RABBITMQ_DEFAULT_PASS=admin \
 -p 15672:15672 \
 -p 5672:5672 \
 -p 25672:25672 \
 -p 61613:61613 \
 -p 1883:1883 rabbitmq

sudo mkdir ~/rabbitmq

sudo docker cp rabbitmq:/var/lib/rabbitmq/mnesia  ~/rabbitmq

docker stop rabbitmq

docker rm rabbitmq

# 说明：

#-d 后台运行容器；

#--name 指定容器名；

#-p 指定服务运行的端口（5672：应用访问端口；15672：控制台Web端口号）；

#-v 映射目录或文件；

#--hostname  主机名（RabbitMQ的一个重要注意事项是它根据所谓的 “节点名称” 存储数据，默认为主机名）；

#-e 指定环境变量；（RABBITMQ_DEFAULT_VHOST：默认虚拟机名；RABBITMQ_DEFAULT_USER：默认的用户名；RABBITMQ_DEFAULT_PASS：默认用户名的密码）
# 运行
echo " 15672:15672  5672:5672  25672:25672  61613:61613 "
docker run -d \
 --hostname rabbitmq \
 --name rabbitmq \
 --restart=always \
 -e RABBITMQ_DEFAULT_USER=luna \
 -e RABBITMQ_DEFAULT_PASS=czy1024 \
 -v ~/rabbitmq/mnesia:/var/lib/rabbitmq/mnesia \
 -p 15672:15672 \
 -p 5672:5672 \
 -p 25672:25672 \
 -p 61613:61613 \
 -p 1883:1883 rabbitmq

  docker exec -it rabbitmq rabbitmq-plugins enable rabbitmq_management