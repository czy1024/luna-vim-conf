#!/bin/bash

sudo ufw allow 2375

ufw status
# 配置许可
sed -i 's/ExecStart=\/usr\/bin\/dockerd/ExecStart=\/usr\/bin\/dockerd -H tcp:\/\/0.0.0.0:2375 ''/g' /usr/lib/systemd/system/docker.service

sudo systemctl daemon-reload
sudo systemctl restart docker
