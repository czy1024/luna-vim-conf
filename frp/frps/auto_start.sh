#!/bin/bash
rm -rf /usr/bin/frps
rm -rf /etc/frps
sudo cp /root/frp/frps /usr/bin/frps
sudo chmod -R 777 /usr/bin/frps
sudo mkdir /etc/frp
sudo cp /root/frp/frps.ini /etc/frp/frps.ini
sudo cat  > /lib/systemd/system/frps.service <<EOF
[Unit]
Description=The nginx HTTP and reverse proxy server
After=network.target remote-fs.target nss-lookup.target

[Service]
Type=simple
ExecStart=/usr/bin/frps -c /etc/frp/frps.ini
KillSignal=SIGQUIT
TimeoutStopSec=5
KillMode=process
PrivateTmp=true
StandardOutput=syslog
StandardError=inherit

[Install]
WantedBy=multi-user.target

EOF
systemctl daemon-reload
# 开机自启动
sudo systemctl enable frps
# 重新加载systemctl
sudo systemctl daemon-reload
systemctl start frps 
systemctl status frps

