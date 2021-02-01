#!/bin/bash
sudo apt-get install redis
# redis密码配置
echo -n "please enter the password:"
read passwd
echo "your password is =>>>>> $passwd please remember"
sed -i 's/# requirepass foobared/requirepass '"$passwd"'/g' /etc/redis/redis.conf
# 取消端口绑定
sed -i 's/bind 127.0.0.1 ::1/#bind 127.0.0.1 ::1/g' /etc/redis/redis.conf



    
   