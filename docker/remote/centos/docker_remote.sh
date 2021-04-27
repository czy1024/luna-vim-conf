#!/bin/bash

sudo firewall-cmd  --zone=public --add-port=2375/tcp --permanent   
# 配置许可
sed -i 's/ExecStart=\/usr\/bin\/dockerd/ExecStart=\/usr\/bin\/dockerd -H tcp:\/\/0.0.0.0:2375 ''/g' /usr/lib/systemd/system/docker.service

sudo systemctl daemon-reload
sudo systemctl restart docker