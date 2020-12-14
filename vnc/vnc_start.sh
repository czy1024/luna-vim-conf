# 安装 x11vnc
sudo apt install x11vnc -y
# 配置访问密码
 x11vnc -storepasswd /etc/x11vnc.pass

# 创建服务
sudo cat  >> /etc/systemd/system/x11vnc.service <<EOF
[Unit]
Description=Start x11vnc at startup.
After=multi-user.target
[Service]
Type=simple
ExecStart=/usr/bin/x11vnc -auth /run/user/1000/gdm/Xauthority -forever -loop -noxdamage -repeat -rfbauth /etc/x11vnc.pass -rfbport 5900 -shared
[Install]
WantedBy=multi-user.target
EOF


# 防火墙
sudo ufw allow 5900
# 开机自启动
 systemctl enable x11vnc
# 重新加载systemctl
 systemctl daemon-reload
 service x11vnc start

# 显示配置 此时程序会生成 /root/xorg.conf.new文件
 Xorg :1 -configure
cp /root/xorg.conf.new /usr/share/X11/xorg.conf.d/xorg.conf

# 将此文件复制至 /usr/share/X11/xorg.conf.d/xorg.conf 
# 这个文件保证在主机上插有显示器的时候，系统界面能在显示器上正常显示。下面我们再给系统添加一个虚拟显示器，当主机没有显示器的时候系统就使用这个虚拟显示器。

# 安装虚拟显卡驱动
 apt install xserver-xorg-video-dummy

sudo  cat >> /usr/share/X11/xorg.conf.d/xorg.conf <<EOF
Section "Monitor"
  Identifier "Monitor1"
  HorizSync   1.0 - 2000.0
  VertRefresh 1.0 - 200.0
  # Add 16:9 modes, others are automatically detected.
  Modeline "1280x720" 74.48 1280 1336 1472 1664 720 721 724 746
  Modeline "1920x1080" 172.80 1920 2040 2248 2576 1080 1081 1084 1118
EndSection


Section "Device"
  Identifier "Card1"
  Driver "dummy"
  VideoRam 256000
EndSection

Section "Screen"
  DefaultDepth 24
  Identifier "Screen1"
  Device "Card1"
  Monitor "Monitor1"
  SubSection "Display"
    Depth 24
    Modes "1920x1080"
  EndSubSection
EndSection
EOF

# 更换配置
sed -i 's/InputDevice    "Mouse0" "CorePointer"/Screen      1  "Screen1" 0 0/g' /root/xorg.conf.new
sed -i 's/InputDevice    "Keyboard0" "CoreKeyboard"//g' /root/xorg.conf.new


# 安装图形窗口管理器 多窗口连接
sudo apt install slick-greeter -y
sudo apt install ubuntu-unity-desktop -y