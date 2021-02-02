#!/bin/bash
sudo cat  > /etc/systemd/system/frpc.service <<EOF
[Unit]
Description=A tcp server frpc service
After=network.target
StartLimitInterval=0
 
[Service]
ExecStart=/root/frp/frpc -c /root/frp/frpc.ini 
ExecStop=killall /root/frp/frpc    

[Install]
WantedBy=multi-user.target

EOF

# 开机自启动
sudo systemctl enable frpc
# 重新加载systemctl
sudo systemctl daemon-reload
sudo nohup  systemctl start frpc &
