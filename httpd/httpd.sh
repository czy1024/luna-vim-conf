#!/bin/bash
sudo apt install apache2

#基本的操作方法：
#本文假设你的apahce安装目录为
/usr/local/apache2，这些方法适合任何情况

#apahce启动命令：
#推荐
/usr/local/apache2/bin/apachectl start apaceh 启动

#apache停止命令：
/usr/local/apache2/bin/apachectl stop 停止

#apache重启命令：
/usr/local/apache2/bin/apachectl restart 重启

#要在重启 Apache 服务器时不中断当前的连接，则应运行：
/usr/local/sbin/apachectl graceful

#如果apache安装成为linux的服务的话，可以用以下命令操作：
service httpd start 启动
service httpd restart 重新启动
service httpd stop 停止服务

#Linux系统为Ubuntu
#一、Start Apache 2 Server /启动apache服务
 /etc/init.d/apache2 start
#or

 sudo /etc/init.d/apache2 start

#二、 Restart Apache 2 Server /重启apache服务
 /etc/init.d/apache2 restart
#or

 sudo /etc/init.d/apache2 restart

#三、Stop Apache 2 Server /停止apache服务
 /etc/init.d/apache2 stop
#or

 sudo /etc/init.d/apache2 stop

# 关闭开机启动
sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist
# 开启开机启动
sudo launchctl load -w /System/Library/LaunchDaemons/org.apache.httpd.plist



 #brew services  安装
 brew install httpd

 # 后台启动 默认开机启动
 brew services start httpd 

 # 注意 确保DavLock 处于可写入状态
    # brew 安装的日志目录为 /usr/local/var/log/httpd
    # mac 自带日志目录为 /private/var/log/apache2
    # 其他可自行查看 config 配置