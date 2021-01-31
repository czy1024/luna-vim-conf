#!/bin/bash
yum install redis

# redis密码配置
cp /etc/redis.conf /etc/redis.conf.bak
echo -n "please enter the password:"
read passwd
echo "your password is =>>>>> $passwd please remember"
sed -i 's/# requirepass foobared/requirepass '"$passwd"'/g' /etc/redis.conf
# 取消端口绑定
sed -i 's/bind 127.0.0.1/#bind 127.0.0.1/g' /etc/redis.conf
sed -i 's/protected-mode yes/protected-mode no/g' /etc/redis.conf
# redis 守护进程 在该模式下，redis会在后台运行，（即使在终端启动后再断开终端连接，也会切换到后台运行）并将进程pid号写入至redis.conf选项pidfile设置的文件中，此时redis将一直运行，除非手动kill该进程
sed -i 's/daemonize no/daemonize yes/g' /etc/redis.conf
