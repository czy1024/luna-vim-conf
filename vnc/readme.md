### 安装

VNC Client就不用说了，单文件版，双击就能运行。

VNC Server安装如下：

1. **ssh到你的server，然后输入以下命令安装tiger vnc**：

```shell
sudo apt install tigervnc-standalone-server tigervnc-xorg-extension tigervnc-viewer

```

1. **如果你没有任何桌面的话，可以输入以下命令安装过gnome桌面**：

```shell
sudo apt install ubuntu-gnome-desktop
sudo systemctl enable gdm
sudo systemctl start gdm

```

1. **配置vnc的登陆密码，直接输入以下命令，输入两次密码即可（最多只能输入8位）**：

```shell
vncpasswd

```

1. **配置vnc使用gnome桌面**：

```shell
nano ~/.vnc/xstartup

```

然后将以下内容粘贴进去，并保存：

```shell
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


```

如果你使用的xfce桌面，就粘贴如下代码：

```shell
#!/bin/sh 
unset SESSION_MANAGER 
unset DBUS_SESSION_BUS_ADDRESS 
startxfce4 & 
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup 
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources 
xsetroot -solid grey

```

1. **启动TigerVNC，直接输入**`vncserver`**看到如下结果就成功了**
   ![在这里插入图片描述](https://img-blog.csdnimg.cn/20191121141703662.jpg)
   但是别着急连,因为还不能用. 输入`netstat -ntupl|grep vnc`查看tiger vnc的端口监听状况:
   ![在这里插入图片描述](https://img-blog.csdnimg.cn/20191121141940642.jpg)
   发现它只是监听了127.0.0.1本地地址，没有监听外网地址。输入`vncserver -kill :*`关闭vncserver（实际上是关闭了所有vnc开启的桌面，更多命令参考请输入`vncserver --help`），然后再输入`vncserver -localhost no`，开启外网的监听。
   ![在这里插入图片描述](https://img-blog.csdnimg.cn/20191121142528917.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9jYXRzaGl0b25lLmJsb2cuY3Nkbi5uZXQ=,size_16,color_FFFFFF,t_70)
   可以看到已经监听0.0.0.0了，端口5901。
   如果你使用ECS或者有防火墙的话，可能会有一些安全策略上的配置需要你放行该端口。
   至此，你可以开启VNC Viewer进行远程了。
   ![在这里插入图片描述](https://img-blog.csdnimg.cn/20191121145230255.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9jYXRzaGl0b25lLmJsb2cuY3Nkbi5uZXQ=,size_16,color_FFFFFF,t_70)

### 注意

(1) VNC server输入IP和端口的方式（中间用两个冒号分隔）。

(2) 如果远程之后你发现是**灰屏而且鼠标指针是个十字**的话，表明需要安装gnome缺失组件：

```shell
apt-get install --no-install-recommends ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal -y
1
```

然后再安装dpi

```shell
sudo apt-get install xfonts-100dpi
sudo apt-get install xfonts-75dpi
12
```

### 图赏

![在这里插入图片描述](https://img-blog.csdnimg.cn/20191121144358233.jpg?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9jYXRzaGl0b25lLmJsb2cuY3Nkbi5uZXQ=,size_16,color_FFFFFF,t_70)

------

> Inspired by
> [1.Install and Configure TigerVNC server on Ubuntu 18.04](https://www.cyberciti.biz/faq/install-and-configure-tigervnc-server-on-ubuntu-18-04/)
> [2.VNC连接Ubuntu 16.04桌面灰色的问题解决](https://blog.csdn.net/ypbsyy/article/details/80096757)