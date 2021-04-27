sudo apt install ufw

# 正常情况安装以后应该是默认禁止状态的，输入sudo ufw status verbose命令可以看到如下界面

# 启用

sudo ufw enable
sudo ufw default deny

sudo ufw allow | deny [service]

# 打开或关闭某个端口，例如：

sudo ufw allow 53 #允许外部访问53端口(tcp/udp)

sudo ufw allow 3690 #允许外部访问3690端口(svn)

sudo ufw allow from 192.168.1.111 #允许此IP访问所有的本机端口

sudo ufw allow proto tcp from 192.168.0.0/24 to any port 22  #允许指定的IP段访问特定端口

sudo ufw delete allow smtp #删除上面建立的某条规则，比如删除svn端口就是 sudo ufw delete allow 3690 

#开启/关闭防火墙
sudo ufw enable | disable


# 下面是ufw命令行的一些示例：

ufw enable/disable # ：打开/关闭ufw

ufw status #：查看已经定义的ufw规则

ufw default allow/deny #：外来访问默认允许/拒绝

ufw allow/deny 20 #：允许/拒绝访问20端口，20后可跟/tcp或/udp，表示tcp或udp封包。

sudo ufw allow proto tcp from 192.168.0.0/24 to any port 22 #：允许自192.168.0.0/24的tcp封包访问本机的22端口。

ufw delete allow/deny 20 #：删除以前定义的"允许/拒绝访问20端口"的规则