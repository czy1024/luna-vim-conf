#!/bin/bash
sudo cp /root/frp/frpc /usr/bin/frpc
sudo chmod -R 777 /usr/bin/frpc
sudo mkdir /etc/frp
sudo cp /root/frp/frpc.ini /etc/frp/frpc.ini
sudo cat  > /lib/systemd/system/frpc.service <<EOF
[Unit]
Description=Frp Client Service
After=network.target

[Service]
Type=simple
User=nobody
Restart=on-failure
RestartSec=5s
ExecStart=/usr/bin/frpc -c /etc/frp/frpc.ini
ExecReload=/usr/bin/frpc reload -c /etc/frp/frpc.ini
ExecStop=killall /usr/bin/frpc

[Install]
WantedBy=multi-user.target
EOF

# 开机自启动
sudo systemctl enable frpc
# 重新加载systemctl
sudo systemctl daemon-reload
systemctl start frpc 
systemctl status frpc

