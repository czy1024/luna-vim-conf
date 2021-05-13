#!/bin/bash
docker pull percona/percona-xtradb-cluster:5.7.20

docker tag percona/percona-xtradb-cluster:5.7.20 pxc

# 创建网段
docker network create --subnet=172.18.0.0/24 mysql
# 查看网段
docker network inspect mysql
# 删除网段
# docker network rm mysql

# 创建5个数据卷
docker volume create --name v1
docker volume create --name v2
docker volume create --name v3
docker volume create --name v4
docker volume create --name v5

# 创建5个PXC容器构成集群
#创建第1个MySQL节点
docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -e CLUSTER_NAME=PXC -e XTRABACKUP_PASSWORD=root -v v1:/var/lib/mysql -v backup:/data --privileged --name=node1 --net=mysql --ip 172.18.0.2 pxc
# 在第一个节点启动后要等待一段时间，等候mysql启动完成。
docker run -d -p 3307:3306 -v v2:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -e CLUSTER_NAME=PXC -e XTRABACKUP_PASSWORD=root -e CLUSTER_JOIN=node1 --privileged --name=node2 --net=mysql --ip 172.18.0.3 pxc

docker run -d -p 3308:3306 -v v3:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -e CLUSTER_NAME=PXC -e XTRABACKUP_PASSWORD=root -e CLUSTER_JOIN=node1 --privileged --name=node3 --net=mysql --ip 172.18.0.4 pxc

docker run -d -p 3309:3306 -v v4:/var/lib/mysql -e MYSQL_ROOT_PASSROWD=root -e CLUSTER_NAME=PXC -e XTRABACKUP_PASSWORD=root -e CLUSTER_JOIN=node1 --privileged --name=node4 --net=mysql --ip 172.18.0.5 pxc

docker run -d -p 3310:3306 -v v5:/var/lib/mysql -e MYSQL_ROOT_PASSROWD=root -e CLUSTER_NAME=PXC -e XTRABACKUP_PASSWORD=root -e CLUSTER_JOIN=node1 --privileged --name=node5 --net=mysql --ip 172.18.0.6 pxc

docker restart node2 node3 node4 node5 
docker stop node1 node2 node3 node4 node5 
docker rm node1 node2 node3 node4 node5 


docker volume rm v1 v2 v3 v4 v5