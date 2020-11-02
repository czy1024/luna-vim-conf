#!/bin/bash
apt install redis

sudo cp redis.conf /ete/redis/redis.conf
echo "密码 czy1024"
sudo service redis restart



    
   