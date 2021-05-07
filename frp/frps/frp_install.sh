#!/bin/bash
# 下载
sudo curl -LJO https://github.com/fatedier/frp/releases/download/v0.36.2/frp_0.36.2_linux_amd64.tar.gz

# 解压
tar -zxvf ~/frp/frp_0.36.2_linux_amd64.tar.gz
mv ~/frp_0.36.2_linux_amd64 ~/frp

cd frp

sudo cat  > ~/frp/frps.ini <<EOF
[common]
server_addr = 0.0.0.0
bind_port = 7000
dashboard_port = 7500
vhost_http_port = 80
auth_token = qwe123!!!
dashboard_user = admin
dashboard_pwd = qwe123!!!

# 端口限制
allow_ports = 2000-3000,30000-50000

# 最大线程
max_pool_count = 100

EOF