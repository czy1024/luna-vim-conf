sudo cat  >> /etc/systemd/system/frpc.service <<EOF
[Unit]
Description=A tcp server frpc service
After=network.target
StartLimitInterval=0
 
[Service]
Type=notify
Restart=always
TimeoutStartSec=0
ExecStart=nohup /home/luna/Desktop/frp/frpc -c /home/luna/Desktop/frp/frpc.ini &
ExecStop=killall /home/luna/Desktop/frp/frpc

[Install]
WantedBy=multi-user.target

EOF

# 防火墙
sudo ufw allow 5900
# 开机自启动
sudo systemctl enable frpc
# 重新加载systemctl
sudo systemctl daemon-reload
sudo nohup  systemctl start frpc &
