#!/bin/bash
#sh -c "$(curl  -fsSL https://raw.githubusercontent.com/czy1024/luna-linux-conf/master/mysql/docker-mysql.sh)"
echo "拉取镜像mysql5.7"
docker pull mysql:5.7
# 启动工作目录
echo "启动工作目录"
docker run -p 3306:3306 --name mysql \
 	-e MYSQL_ROOT_PASSWORD=luna \
	-d mysql:5.7
# 拷贝工作目录	
echo "拷贝工作目录"
sudo mkdir ~/mysql
sudo docker cp mysql:/etc/mysql/     ~/mysql/conf/
# 停止
docker stop mysql
# 移除
docker rm mysql
# 运行
echo "运行mysql 端口3306 密码root"
sudo docker run -d -p 3306:3306 \
 --name mysql \
 --restart always \
 --privileged=true \
 -e MYSQL_ROOT_PASSWORD=root \
 -v ~/mysql/log:/var/log/mysql \
 -v ~/mysql/data/mysql:/var/lib/mysql \
 -v ~/mysql/conf:/etc/mysql \
 mysql:5.7 \
 --default-authentication-plugin mysql_native_password \
 --character-set-server utf8 \
 --collation-server utf8_general_ci 

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
CREATE USER 'lunasaw'@'%' IDENTIFIED BY 'czy1024';
GRANT ALL PRIVILEGES ON *.* TO 'lunasaw'@'%' IDENTIFIED BY 'czy1024' WITH GRANT OPTION;
GRANT ALL ON *.* TO 'lunasaw'@'%';
flush privileges;
