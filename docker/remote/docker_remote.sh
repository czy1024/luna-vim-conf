#!/bin/bash
# 配置许可
sed -i 's/ExecStart=\/usr\/bin\/dockerd/ExecStart=\/usr\/bin\/dockerd -H tcp:\/\/0.0.0.0:2375 ''/g' /usr/lib/systemd/system/docker.service

sed -i 's/bind 127.0.0.1 ::1/#bind 127.0.0.1 ::1/g' /etc/redis/redis.conf