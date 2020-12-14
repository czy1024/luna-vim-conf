#! /bin/bash
# 安装vnc
sudo apt install tigervnc-standalone-server tigervnc-xorg-extension -y

# 安装桌面
 apt install ubuntu-gnome-desktop -y
 systemctl enable gdm
 systemctl start gdm

# 配置访问密码
vncpasswd

sudo cat >> ~/.vnc/xstartup <<EOF 
#!/bin/sh
# Uncomment the following two lines for normal desktop:
export XKL_XMODMAP_DISABLE=1
unset SESSION_MANAGER
# exec /etc/X11/xinit/xinitrc
unset DBUS_SESSION_BUS_ADDRESS
gnome-panel &
gnmoe-settings-daemon &
metacity &
nautilus &
gnome-terminal &
EOF

# 如果你使用的xfce桌面，就粘贴如下代码
'
sudo cat >> ~/.vnc/xstartup <<EOF 
#!/bin/sh 
unset SESSION_MANAGER 
unset DBUS_SESSION_BUS_ADDRESS 
startxfce4 & 
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup 
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources 
xsetroot -solid grey
EOF
'
# 启动
echo "5900"
# 防火墙
sudo ufw allow 5900

# 如果远程之后你发现是**灰屏而且鼠标指针是个十字**的话，表明需要安装gnome缺失组件：
sudo apt-get install --no-install-recommends ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal -y

echo "然后再安装dpi"
sudo apt-get install xfonts-100dpi
sudo apt-get install xfonts-75dpi

# 开启外网监听
vncserver -localhost no

