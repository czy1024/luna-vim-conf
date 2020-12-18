#!/bin/bash
sudo cat  > /etc/systemd/system/ding.service <<EOF
[Unit]
Description=A tcp server ding service
After=network.target
StartLimitInterval=0
 
[Service]
ExecStart=sh /home/luna/Desktop/dinghttp/ding.sh
ExecStop=killall /home/luna/Desktop/frpc/ding    

[Install]
WantedBy=multi-user.target

EOF

# 开机自启动
sudo systemctl enable ding
# 重新加载systemctl
sudo systemctl daemon-reload
sudo nohup  systemctl start ding &
