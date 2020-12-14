#! /bin/bash
# 桌面环境
sudo apt-get install xfce4 xfce4-goodies -y
#安装vncserver
apt install tightvncserver
#启动vncserver
vncserver

#关闭vncserver ：1窗口
vncserver -kill :1
#备份原来的配置文件
mv ~/.vnc/xstartup ~/.vnc/xstartup.bak
#编辑新的配置文件
sudo cat > ~/.vnc/xstartup <<EOF 
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
EOF
sudo chmod +x ~/.vnc/xstartup

# 创建服务
sudo cat  > /etc/systemd/system/vncserver.service <<EOF
[Unit]
Description=A tcp server vncserver service
After=network.target
StartLimitInterval=0
 
[Service]
ExecStart=su luna -c '/usr/bin/tightvncserver :1'
ExecStop=pkill Xtightvnc

[Install]
WantedBy=multi-user.target
EOF

# 防火墙
sudo ufw allow 5900
# 开机自启动
sudo systemctl enable vncserver
# 重新加载systemctl
sudo systemctl daemon-reload
sudo systemctl  start vncserver

# netstat -ntupl|grep vnc