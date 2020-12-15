# 配置 Tomcat

## 关于Tomcat

目前有很多网站使用jsp的程序编写，所以解析jsp的程序就必须要有相关的软件来完成。Tomcat就是用来解析jsp程序的一个软件， Tomcat是Apache 软件基金会（Apache Software Foundation）的Jakarta 项目中的一个核心项目，由Apache、Sun 和其他一些公司及个人共同开发而成。因为Tomcat 技术先进、性能稳定，而且免费，因而深受Java 爱好者的喜爱并得到了部分软件开发商的认可，成为目前比较流行的Web 应用服务器。 Tomcat 是一个轻量级应用服务器，在中小型系统和并发访问用户不是很多的场合下被普遍使用，是开发和调试JSP 程序的首选。对于一个初学者来说，可以这样认为，当在一台机器上配置好Apache 服务器，可利用它响应对HTML 页面的访问请求。实际上Tomcat 部分是Apache 服务器的扩展，但它是独立运行的，所以当你运行tomcat 时，它实际上作为一个与Apache 独立的进程单独运行的。

## 安装Tomcat

Tomcat的安装分为两个步骤：安装JDK；安装Tomcat。

JDK(Java Development Kit)是Sun Microsystems针对Java开发员的产品。自从Java推出以来，JDK已经成为使用最广泛的Java SDK。JDK 是整个Java的核心，包括了Java运行环境，Java工具和Java基础的类库。所以要想运行jsp的程序必须要有JDK的支持，理所当然安装Tomcat的前提是安装好JDK。

1. 安装JDK

下载jdk-6u23-linux-i586.bin

cd /usr/local/src/

wget http://dl.dropbox.com/u/182853/jdk-6u23-linux-i586.bin

（如果该版本不合适请到下面的官方网站下载适合你的版本）：

```
https://cds.sun.com/is-bin/INTERSHOP.enfinity/WFS/CDS-CDS_Developer-Site/en_US/-/USD/ViewProductDetail-Start?ProductRef=jdk-6u23-oth-JPR@CDS-CDS_Developer
chmod a+x jdk-6u23-linux-i586.bin
sh jdk-6u23-linux-i586.bin
```

此时会出现JDK 安装授权协议。可以一路按Enter浏览，当出现Do you agree to the above license terms? [yes or no] 的字样,输入yes即可。

mv jdk1.6.0_23 /usr/local/

1. 设置环境变量

vim /etc/profile

在末尾输入以下内容

```
#set java environment
JAVA_HOME=/usr/local/jdk1.6.0_23/
JAVA_BIN=/usr/local/jdk1.6.0_23/bin
JRE_HOME=/usr/local/jdk1.6.0_23/jre
PATH=$PATH:/usr/local/jdk1.6.0_23/bin:/usr/local/jdk1.6.0_23/jre/bin
CLASSPATH=/usr/local/jdk1.6.0_23/jre/lib:/usr/local/jdk1.6.0_23/lib:/usr/local/jdk1.6.0_23/jre/lib/charsets.jar
export  JAVA_HOME  JAVA_BIN JRE_HOME  PATH  CLASSPATH
```

执行命令source /etc/profile，使配置立即生效

source /etc/profile

检测是否设置正确：

java –version

如果显示如下内容，则配置正确。

```
java version "1.4.2"
gij (GNU libgcj) version 4.1.2 20080704 (Red Hat 4.1.2-46)

Copyright (C) 2006 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```

3.安装Tomcat

cd /usr/local/src/

wget http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.14/bin/apache-tomcat-7.0.14.tar.gz

如果觉得这个版本不适合你，请到tomcat官方网站下载适合你的版本。

```
tar zxvf apache-tomcat-7.0.14.tar.gz
mv apache-tomcat-7.0.14 /usr/local/tomcat
cp -p /usr/local/tomcat/bin/catalina.sh /etc/init.d/tomcat
vim /etc/init.d/tomcat
```

在第二行加入以下内容：

```
# chkconfig: 2345 63 37
# description: tomcat server init script

JAVA_HOME=/usr/local/jdk1.6.0_23/
CATALINA_HOME=/usr/local/tomcat

chmod 755 /etc/init.d/tomcat
chkconfig --add tomcat
chkconfig tomcat on
```

启动tomcat：

service tomcat start

查看是否启动成功：

ps aux |grep tomcat

如果有进程的话，请在浏览器中输入http://IP:8080/ 你会看到tomcat的主界面。

## 配置tomcat

在配置tomcat前，先来看看tomcat的几个目录：

```
find /usr/local/tomcat/ -maxdepth 1 -type d （-maxdepth的作用指定目录级数，后边跟1代表只查找1级目录）
/usr/local/tomcat/
/usr/local/tomcat/lib       # tomcat的库文件目录
/usr/local/tomcat/temp           # 临时文件存放目录
/usr/local/tomcat/webapps             # web应用目录，也就是我们访问的web程序文件所在目录
/usr/local/tomcat/conf             # 配置文件目录
/usr/local/tomcat/logs             # 日志文件所在目录
/usr/local/tomcat/work            # 存放JSP编译后产生的class文件
/usr/local/tomcat/bin               # tomcat的脚本文件
Tomcat的主配置文件为/usr/local/tomcat/conf/server.xml
```

1. 配置tomcat服务的访问端口。

默认是8080，如果你想修改为80，则需要修改server.xml文件。

找到 <Connector port="8080" protocol="HTTP/1.1"

修改为：<Connector port="80" protocol="HTTP/1.1"

1. 配置新的虚拟主机

```
cd /usr/local/tomcat/conf/
vim server.xml
```

找到，下一行插入新的，内容如下：

```
      <Host name="www.example.cn" appBase="/data/tomcatweb"
            unpackWARs="false" autoDeploy="true"
            xmlValidation="false" xmlNamespaceAware="false">
      <Context path="" docBase="./" debug="0" reloadable="true" crossContext="true"/>
```

完成后，重启tomcat

service tomcat stop; service tomcat start

测试新建的虚拟主机，首先需要修改你电脑的hosts文件

vim /data/tomcatweb/test.jsp 加入以下内容：

```
<html><body><center>
Now time is: <%=new java.util.Date()%>
</center></body></html>
```

保存后，在你的浏览器里输入 `http://www.example.cn/test.jsp` 看是否访问到如下内容：

Now time is: Thu Jun 02 14:32:34 CST 2011