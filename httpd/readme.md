# Apache

本章Apache具体指的是 Apache HTTP Server （[官方文档 (opens new window)](http://httpd.apache.org/docs/2.4/zh-cn/)）。Apache HTTP Server项目是为现代操作系统（包括UNIX和Windows）开发和维护开源HTTP服务器的一项工作。该项目的目标是提供一个安全，高效且可扩展的服务器，该服务器提供与当前HTTP标准同步的HTTP服务。

![img](https://i.loli.net/2021/01/29/8ZeEGYJ7HLichs9.gif)

## 安装

这里我们只介绍比较简单的在线安装方式：

```text
# Installing on Fedora/CentOS/Red Hat Enterprise Linux
sudo yum install httpd
sudo systemctl enable httpd
sudo systemctl start httpd

# Installing on Ubuntu/Debian
sudo apt install apache2
sudo service apache2 start
```

> 安装Apache的时候默认会安装核心特性与多处理模块(MPM)，其他的扩展模块可以后续自行安装。

## 模块

安装模块之前，先查看当前已安装的所有模块，然后再决定是否安装，最后将已安装模块启用或停止。

### 查看

通过 `apachectl -M` 命令可以查看已经安装的所有Apache模块。

### 安装

安装模块有yum/apt在线安装和源码编译安装两种方式，其中在线安装非常简单：

#### 在线安装

例如：准备在CentOS上安装 `mod_ssl` 模块:

1. 搜索 mod_ssl 是否存在

   ```text
   sudo yum search mod_ssl
   ============================= N/S matched: mod_ssl =============================
   mod_ssl.x86_64 : SSL/TLS module for the Apache HTTP Server
   ```

2. 搜索结果提示有一个 mod_ssl.x86_64 可用，接下来运行安装命令

   ```text
   sudo yum install mod_ssl
   ```

3. 等待自动安装，直至安装完成

#### 源码编译安装

如果在线搜索找不到所需的 Module, 就需要通过源码编译安装的方式安装新的模块。主要步骤如下：

1. 安装 apxs 这个Apache模块管理工具以及配套工具

   ```text
   yum install httpd-devel
   yum groupinstall 'Development tools'
   ```

2. 下载 Apache 源码到 /opt 目录，并解压之

   ```text
   cd /opt
   wget http://mirror.bit.edu.cn/apache//httpd/httpd-2.4.41.tar.gz
   tar xvf httpd-2.4.41.tar.gz
   ```

3. 以安装 mod_auth_form 模块为例，我们找到其所在的目录，然后运行编译命令

   ```text
   cd /opt/httpd-2.4.41/modules/aaa
   mod_auth_form.c
   ```

4. 编译成功，会增加一个模块配置文件：/usr/lib64/httpd/modules/mod_auth_form.so

> 以上的源码编译安装方案来源于[此处(opens new window)](https://www.hugeserver.com/kb/install-enable-mod_evasive-apache-module-centos7/)

### 启停

需要注意的是，安装过的所有模块并不会全部被启用，即安装模块与启用是有区别的，只有安装之后才能被启用，被启用的模块也可以让它停止运行。接下来，我们讲解如何启停模块。

下面先介绍通过修改模块配置文件实现模块启用的方案：

以CentOS为例，我们打开Apache模块配置文件：*/etc/httpd/conf.modules.d/00-base.conf*

```text
...
LoadModule version_module modules/mod_version.so
LoadModule vhost_alias_module modules/mod_vhost_alias.so
#LoadModule buffer_module modules/mod_buffer.so
#LoadModule watchdog_module modules/mod_watchdog.so
...
```

其中带“#”号的模块是没有启用的，如果需要启用，去掉“#”号，然后重启 Apache HTTP 服务即可。

修改Apache配置文件显得繁琐，可以安装通过`a2enmod`这个模块来管理Apache扩展模块的启停

## 路径

不同的Linux发行版，对应的安装路径有一定的差异：

### CentOS

Apache 安装目录：*/etc/httpd*
Apache 虚拟主机配置文件：*/etc/httpd/conf.d/vhost.conf*
Apache 主配置文件： */etc/httpd/conf/httpd.conf*
Apache 日志文件： */var/log/httpd*
Apache 模块配置文件： */etc/httpd/conf.modules.d/00-base.conf*

### Ubuntu

Apache 安装目录：*/etc/apache2*
Apache 虚拟主机配置文件：*/etc/apache2/sites-available/000-default.conf*
Apache 主配置文件： */etc/apache2/apache2.conf*
Apache 日志文件： */var/log/apache2*
Apache 模块目录： */etc/apache2/mods-available*

## 多处理模块

Apache HTTP 服务器被设计为一个功能强大，并且灵活的 web 服务器， 可以在很多平台与环境中工作。不同平台和不同的环境往往需要不同的特性，或可能以不同的方式实现相同的特性最有效率。

Apache httpd 通过模块化的设计来适应各种环境。这种设计允许网站管理员通过在编译时或运行时，选择哪些模块将会加载在服务器中，来选择服务器特性。

Apache提供一个名称为多处理模块(MPM)，用来接受请求， 以及调度子进程处理请求。

下表列出了不同系统的默认 MPM。如果你不在编译时选择，那么它就是你将要使用的 MPM。

| 操作系统 | MPM名称                                        |
| -------- | ---------------------------------------------- |
| Netware  | `mpm_netware`                                  |
| OS/2     | `mpmt_os2`                                     |
| Unix     | `prefork`，`worker` 或 `event`，取决于平台特性 |
| Windows  | `mpm_winnt`                                    |

###查看

以CentOS为例，查看当前系统的MPM模式，只需运行 `httpd -V` 命令即可查看：

```text
[root@lamp7 ~]# httpd -V
Server version: Apache/2.4.6 (CentOS)
Server built:   Aug  8 2019 11:41:18
Server's Module Magic Number: 20120211:24
Server loaded:  APR 1.4.8, APR-UTIL 1.5.2
Compiled using: APR 1.4.8, APR-UTIL 1.5.2
Architecture:   64-bit
Server MPM:     prefork
  threaded:     no
    forked:     yes (variable process count)
```

另外，在Apache主配置文件：*/etc/httpd/conf/httpd.conf* 中，可以设置 prefork 的工作参数：

```text
<IfModule prefork.c>
   StartServers        5
   MinSpareServers     5
   MaxSpareServers     10
   MaxClients          256
   MaxRequestsPerChild 3000
</IfModule>
```

### 切换

以CentOS为例，切换当前系统的MPM模式，编辑：*/etc/httpd/conf.modules.d/00-mpm.conf* 文件

```text
LoadModule mpm_prefork_module modules/mod_mpm_prefork.so
#LoadModule mpm_worker_module modules/mod_mpm_worker.so
#LoadModule mpm_event_module modules/mod_mpm_event.so
```

通过去掉或增加“#”号的方式，选择一种MPM模式，重启Apache后生效

###比较

![prefork](https://i.loli.net/2021/01/29/4LbYAlZ7ay2fQev.png)
图1：Prefork，每个子进程只有一个线程，在一个时间点内只能处理一个请求

![worker](https://i.loli.net/2021/01/29/vCxpRTG1hKIYlcN.png)
图2：work，多进程和多线程的混合模式

![event](https://i.loli.net/2021/01/29/gYUQqZOrtVPpSac.png)
图1：event，与worker类似，但是event解决了worker下长连接线程的阻塞问题

三种MPM模式之间的比较请参考：

- [《Apache 工作的三种模式：Prefork、Worker、Events》(opens new window)](https://www.jianshu.com/p/2de515e958d6)
- [《青蛙学Linux—Apache的MPM模式和httpd-mpm.conf》(opens new window)](https://www.cnblogs.com/yu2006070-01/p/10303808.html)

## 可执行程序

可执行程序以服务的形式存在于Linux系统中：

### 所有程序

Apache HTTP 服务器包含的所有可执行程序如下：

| 命令              | 说明                                           |
| ----------------- | ---------------------------------------------- |
| httpd             | Apache 服务器                                  |
| apachectl         | Apache HTTP 服务器控制工具。                   |
| ab                | Apache HTTP 服务器性能基准工具。               |
| apxs              | Apache 扩展工具。                              |
| configure         | 配置源代码。                                   |
| dbmmanage         | 为基本认证创建和更新 DBM 格式的用户认证文件。  |
| fcgistarter       | 启动 FastCGI 程序。                            |
| htcacheclean      | 清理磁盘缓存。                                 |
| htdigest          | 为摘要认证创建和更新用户认证文件。             |
| htdbm             | 操作 DBM 密码数据库。                          |
| htpasswd          | 为基本认证创建和更新用户认证文件。             |
| httxt2dbm         | 为 RewriteMap 创建 dbm 文件。                  |
| logresolve        | 将 Apache 日志文件中的 IP 地址解析到主机名称。 |
| log_server_status | 周期性的记录服务器状态。                       |
| rotatelogs        | 不关闭 Apache 而切换日志文件。                 |
| split-logfile     | 将多个虚拟主机的日志文件按照主机拆分。         |
| suexec            | 执行外部程序前切换用户。                       |

### 服务启停

以 httpd 服务为例，在不同的操作系统启用如下：

```text
#CentOS or Redhat
systemctl start httpd
systemctl stop httpd
systemctl restart httpd
systemctl status httpd

# Ubutnu
systemctl start apache2
systemctl stop apache2
systemctl restart apache2
systemctl status apache2
```

## 配置

Apache HTTP Sever 提供了灵活的配置项，以帮助用户适用各种业务场景。

### 配置文件

- 主配置文件：*/etc/httpd/conf/httpd.conf*
- 扩展配置文件：*/etc/httpd/conf.d/*.conf*

当Apache启动时，会加载/etc/httpd/conf.d/目录中的所有以.conf结尾的文件，做为配置文件来使用，所以管理员可以将配置推荐写在.conf中，如果将配置项写入主配置文件，系统升级时，配置项还要重新修改一遍，如果写在扩展配置项，则不存在此问题，同时也可以从繁杂的主配置文件中脱离出来。

### 配置说明

| 配置项                                   | 说明                                                         |
| ---------------------------------------- | ------------------------------------------------------------ |
| ServerTokens OS                          | 系统信息,在访问出错时出现;把OS改为Minor,就不显示系统信息     |
| ServerSignature On                       | 把On改为Off就连普通的系统都给隐藏起来;改为Email就会显示管理员的邮箱(邮箱需要另外配置 ServerAdmin ) |
| ServerAdmin root@localhost               | 管理员邮箱                                                   |
| ServerName localhost                     | 服务器的主机名,一般是用虚拟机来设置,通常这个值是自动指定的，推荐显式的指定它以防止启动时出错 |
| UseCanonicalName Off                     | 设置为"On",Apache会使用ServerName指令的值 设置为 "Off"时,Apache会使用用户端提供的主机名和端口号。 如果有虚拟主机，必须设置为Off |
| ServerRoot "/etc/httpd"                  | 配置项的根目录，类似html里面的base;默认到这个路径里面找;     |
| PidFile run/httpd.pid                    | 进程PID,位置在 /etc/httpd/run/httpd.pid,主进程决定着子进程   |
| Timeout 60                               | 若60秒后没有收到或送出任何数据就切断该连接                   |
| KeepAlive Off                            | 是否开启持久化链接,访问网站时要对网站的很多资源,如css,js,image等等创建不同的链接;事实上我们可以建立一个持久化链接来应对多个请求; |
| MaxKeepAliveRequests 100                 | 一个持久化链接最多能应对多少个请求                           |
| KeepAliveTimeout 15                      | 15秒不链接就断开                                             |
| Listen 80                                | 监听端口,默认是80，如果这里要更改为其他端口比如88的话,下面的ServerName localhost:88也得更改 |
| KeepAliveTimeout 15                      | 15秒不链接就断开                                             |
| Include conf.d/*.conf                    | 扩展配置文件                                                 |
| User apache                              | Apache子进程所有者                                           |
| Group apache                             | Apache子进程所属组                                           |
| DirectoryIndex index.html index.html.var | 默认主文件                                                   |
| DocumentRoot "/var/www/html"             | 网站数据根目录                                               |
| ErrorDocument 404 /404.html              | 404可以通过PHP程序来处理(在框架中),可以通过rewrite来处理,但是最理想的模式是让Apache来处理 |
| Directory                                | 定位目录 /(也就是Apache网站根目录)                           |
| Indexes                                  | 如果访问的文件不存在，显示目录文件列表；要禁止的话前面加上一个 - （-indexes） |
| FollowSymLinks                           | 软链接                                                       |
| AllowOverride                            | 是否允许目录配置文件.htaccess有效ALL有效，None无效           |
| IfModule                                 | 如果存在模块mod_userdir.c...                                 |

配置注意事项：

1. Apache对文件的操作就会用系统给的一个临时账号Apache作为第三方other来运行
2. Apache的配置规则是 **后出现,先应用** 后面的出现的配置会覆盖前面的。
3. 以上配置都应该在扩展配置里面覆盖更改或增加;

### 常见问题

#### 关闭Apache Test Page

使用 # 号将: /etc/httpd/conf.d/welcome.conf 中的所有内容全部注释掉，然后重启 Apache 服务

#### 关闭缺省情况目录列表可查看

Apache httpd服务器在缺省的情况下，开启了基于目录列表的访问，这是一个存在安全隐患的问题，因此可以关闭这个功能。

## 伪静态

使用伪静态有三个步骤：

1. 确保Rewrite模块（apache模块配置文件：/etc/httpd/conf.modules.d/00-base.conf）已经被加载（去掉LoadModule rewrite_module modules/mod_rewrite.so前面的#）。
2. 虚拟主机配置文件中增加AllowOverride All
3. 网站根目录中增加.htaccess文件，并配置伪静态规则

### 场景：重定向

1. 开启Apache的rewrite模块
2. 在网站根目录中增加.htaccess文件

```shell
<IfModule mod_rewrite.c>
RewriteEngine On
Redirect 301 "/empirecmsall-image-guide" "/xdocs/empirecms-image-guide"
Redirect 301 "/wordpress-image-guide" "/xdocs/wordpressold-image-guide"

</IfModule>
```

### 场景：隐藏后缀名

```text
<IfModule mod_rewrite.c>
RewriteRule ^test$ test.php
ErrorDocument 404 /404.txt

</IfModule>
```

## 虚拟主机

Apache中的虚拟主机是通过VirtualHost进行配置的。

VirtualHost 改动务必准确无误，任何错误的修改都会导致服务器上所有的网站不可访问

| VirtualHost 项 | 作用说明                                           | 必要性         |
| -------------- | -------------------------------------------------- | -------------- |
| ServerName     | 主域名                                             | 必须填写       |
| ServerAlias    | 辅域名                                             | 可以不填或删除 |
| DocumentRoot   | 网站存放目录，同下                                 | 务必准确无误   |
| Directory      | 网站存放目录，同上                                 | 务必准确无误   |
| ErrorLog       | 错误日志路径，系统会根据定义的路径产生相关日志文件 | 可以不填或删除 |
| CustomLog      | 访问日志路径，系统会根据定义的路径产生相关日志文件 | 可以不填或删除 |

### HTTP VirtualHost template

```text
<VirtualHost *:80>
ServerName www.mydomain.com
ServerAlias other.mydomain.com
DocumentRoot "/data/wwwroot/zdoo"
ErrorLog "/var/log/httpd/www.mydomain.com_error_apache.log"
CustomLog "/var/log/httpd/www.mydomain.com_apache.log" common
<Directory "/data/wwwroot/zdoo">
Options Indexes FollowSymlinks
AllowOverride All
Require all granted
</Directory>
</VirtualHost>
```

### Apache Alias template

```text
Alias /path /data/wwwroot/zdoo
<Directory "/data/wwwroot/zdoo">
Options Indexes FollowSymlinks
AllowOverride All
Require all granted
</Directory>
```

### Apache HTTPS VirtualHost template

```text
<VirtualHost *:443>
ServerName  www.mydomain.com
DocumentRoot "/data/wwwroot/zdoo"
#ErrorLog "logs/www.mydomain.com-error_log"
#CustomLog "logs/www.mydomain.com-access_log" common
<Directory "/data/wwwroot/zdoo">
Options Indexes FollowSymlinks
AllowOverride All
Require all granted
</Directory>
SSLEngine on
SSLCertificateFile  /data/cert/www.mydomain.com.crt
SSLCertificateKeyFile  /data/cert/www.mydomain.com.key
SSLCertificateChainFile  /data/cert/root_bundle.crt
</VirtualHost>
```

### HTTP跳转HTTPS

#### 方案一：修改.htaccess文件

.htaccess文件提供了一种目录级别的修改配置的方式。

```text
#任何情况下均强制跳转
RewriteCond %{HTTPS} off
RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]


#指定域名下的自动跳转
RewriteEngine On 
RewriteCond %{HTTP_HOST} ^yourdomain\.com [NC]
RewriteCond %{SERVER_PORT} 80 
RewriteRule ^(.*)$ https://www.yourdomain.com/$1 [R,L]

#指定文件夹的自动跳转
RewriteEngine On 
RewriteCond %{SERVER_PORT} 80 
RewriteCond %{REQUEST_URI} folder 
RewriteRule ^(.*)$ https://www.yourdomain.com/folder/$1 [R,L]
```

#### 方案二：修改vhost文件

要想开启自动跳转功能，请确保 Apache 的 Rewirte 模块加载，然后按照以下方案进行设置：

1. 整站跳转 如果需要整站跳转，则在网站的配置文件（/etc/http/vhost/vhost.conf）的 <Directory> 标签内添加：

   ```
    RewriteEngine on
    RewriteCond %{SERVER_PORT} !^443$
    RewriteRule ^(.*)?$ https://%{SERVER_NAME}/$1 [L,R=301]
   ```

2. 只对某个目录的页面进行自动跳转，请将 **yourfolder** 改成自己的目录名

   ```
    RewriteEngine on
    RewriteBase /yourfolder
    RewriteCond %{SERVER_PORT} !^443$
    #RewriteRule ^(.*)?$ https://%{SERVER_NAME}/$1 [L,R]
    RewriteRule ^.*$ https://%{SERVER_NAME}%{REQUEST_URI} [L,R=301]
   ```

3. 只将带 www 的 URL 跳转至 HTTPS，请将 **www.yourdomain.com** 改成自己想要设置跳转的域名

   ```
    RewriteEngine On 
    RewriteRule ^/(.*)$ www.yourdomain.com/$1 [R=301]
   ```

4. 对除了某一个页面的其他所有页面进行 HTTPS 跳转

   ```
    RewriteEngine on 
    RewriteCond %{SERVER_PORT} !^443$ 
    RewriteCond %{REQUEST_URI} !^/tz.php 
    RewriteRule (.*) https://%{SERVER_NAME}/$1 [R]
   ```

   这段配置的作用是指除了 /tz.php 页面用 http 访问，其他页面均为 https 访问，/tz.php 可改为自己实际要 http 访问的后缀。

### 默认首页

默认访问目录之时，系统会自动根据顺序寻找列出的页面，并显示其中一个。

```text
<VirtualHost *:80>
ServerName win.websoft9.com
<IfModule dir_module>
  DirectoryIndex index.hmtl defalut.html README.html readme.html about.html
</IfModule>
DocumentRoot "/data/wwwroot/default/site"
...
```

### 禁用IP访问,防止恶意解析

------

1. 给指定网站程序设置域名

2. 将一下内容加入

    

   ```
   /etc/httpd/conf/httpd.conf
   ```

    

   的末尾或者在

    

   ```
   /etc/httpd/conf.d/
   ```

    

   目录下新建一个

    

   ```
   deny-ip.conf
   ```

   的文件将内容写入

   ```text
   <VirtualHost *:80>
     ServerName 服务器IP地址
     <Location />
          Order Allow,Deny
          Deny from all
     </Location>
   </VirtualHost>
   
   <VirtualHost *:443>
      ServerName 服务器IP地址
      SSLEngine on
      SSLCertificateFile /etc/pki/tls/certs/localhost.crt
      SSLCertificateKeyFile /etc/pki/tls/private/localhost.key
      <Location />
        Order Allow,Deny
        Deny from all
      </Location>
   </VirtualHost>
   ```

3. 重启 apache

   ```text
   systemctl restart httpd
   ```

## 代理

Apache中的代理即 mod_proxy 模块，它用于 URL的转发，即具有代理的功能。应用此功能，可以很方便的实现同 Tomcat 等应用服务器的整合，甚至可以很方便的实现 Web 集群的功能。

Apache 代理相关的模块包括：

```text
mod_proxy
proxy_ajp_module (shared)
proxy_balancer_module (shared)
proxy_connect_module (shared)
proxy_express_module (shared)
proxy_fcgi_module (shared)
proxy_fdpass_module (shared)
proxy_ftp_module (shared)
proxy_http_module (shared)
proxy_scgi_module (shared)
proxy_wstunnel_module (shared)
```

下面是一个包含了 Proxy 的虚拟主机配置文件，其中应用程序运行在8069端口，通过转发配置域名访问。

```text
<VirtualHost *:80>
ServerAdmin webmaster@dummy-host2.localhost
ServerName youdomain.com
ProxyRequests off
<Proxy *>
Order deny,allow
Allow from all
</Proxy>
ProxyPass / http://172.21.172.27:8069/
ProxyPassReverse / http://172.21.172.27:8069/
</VirtualHost>
```

Apache代理使用详情参考：[《Apache模块mod_proxy》(opens new window)](http://httpd.apache.org/docs/2.4/mod/mod_proxy.html)

## 日志

为了有效地管理Web服务器，有必要获取有关服务器的活动和性能以及可能发生的任何问题的反馈。Apache HTTP Server提供了非常全面和灵活的日志记录功能。

Apache标准日志包括：访问日志和错误日志两种

### 模块

与日志相关的模块包括：

```text
mod_log_config
mod_log_forensic
mod_logio
mod_cgi
```

### 访问日志

Apache 访问日志在实际工作中非常有用，比较典型的例子是进行网站流量统计，查看用户访问时间、地理位置分布、页面点击率等。Apache 的访问日志具有如下4个方面的作用：

- 记录访问服务器的远程主机IP 地址，从而可以得知浏览者来自何处；
- 记录浏览者访问的Web资源，可以了解网站中的哪些部分最受欢迎；
- 记录浏览者使用的浏览器，可以根据大多数浏览者使用的浏览器对站点进行优化；
- 记录浏览者的访问时间；

### 错误日志

服务器错误日志（由ErrorLog伪指令设置名称和位置）是最重要的日志文件。Apache httpd将在此处发送诊断信息并记录其在处理请求时遇到的任何错误。当启动服务器或服务器操作出现问题时，它是第一个查看的地方，因为它通常包含发生问题的原因以及如何解决的详细信息。

错误日志的格式由ErrorLogFormat指令定义，您可以使用该指令自定义要记录的值。如果未指定格式，则默认为格式定义。典型的日志消息如下：

```text
[Fri Sep 09 10:42:29.902022 2011] [core:error] [pid 35708:tid 4328636416] [client 72.15.99.187] File does not exist: /usr/local/apache2/htdocs/favicon.ico
```

日志条目中的第一项是消息的日期和时间。接下来是产生消息的模块（在这种情况下为核心）和消息的严重性级别。紧随其后的是遇到该条件的进程的进程ID，如果合适，还包括线程ID。接下来，我们有发出请求的客户地址。最后是详细的错误消息，在这种情况下，该错误消息表示请求的文件不存在。

## 缓存

Apache HTTP服务器提供了一系列缓存功能，这些缓存功能旨在以各种方式提高服务器的性能。

详情参考官方文档：[缓存指南(opens new window)](http://httpd.apache.org/docs/2.4/caching.html)

## 安全

大多数情况下，Web服务器受到威胁，并不是因为HTTP Server代码中的问题。而是来自附加代码，CGI脚本或基础操作系统的问题。因此，您必须始终注意系统上所有软件的问题和更新。

### 更新

Apache HTTP Server在安全性方面有良好记录，并且开发人员社区高度关注安全性问题。但是，不可避免的是，某些问题（无论大小）都会在发布后在软件中发现。因此，保持对软件更新的了解至关重要。如果您直接从Apache获得HTTP Server的版本，我们强烈建议您订阅[Apache HTTP Server (opens new window)](http://httpd.apache.org/lists.html#http-announce)公告列表，在其中可以随时了解新版本和安全更新。

### DoS攻击

最有效的反DoS工具通常是防火墙或其他操作系统配置。例如，大多数防火墙可以配置为限制来自任何单个IP地址或网络的同时连接数，从而防止一系列简单的攻击。当然，这对分布式拒绝服务攻击（DDoS）没有帮助。

但Apache HTTP Server配置设置可以帮助缓解问题：

- RequestReadTimeout
- TimeOut
- KeepAliveTimeout
- MaxRequestWorkers

### Apache SSL/TLS 加密

Apache的mod_ssl模块基于OpenSSL，它使用安全套接字层和传输层安全协议提供了强加密。

#### 原理

下图是典型的使用 SSL 加密的网页认证连接流程：

![ssl认证](https://i.loli.net/2021/01/29/tFyCfS25oEWXi8m.png)

#### 配置

下面配置段是典型的HTTPS设置项

```text
LoadModule ssl_module modules/mod_ssl.so
Listen 443
<VirtualHost *:443>
    ServerName www.example.com
    SSLEngine on
    SSLCertificateFile "/path/to/www.example.com.cert"
    SSLCertificateKeyFile "/path/to/www.example.com.key"
</VirtualHost>
```

##运行环境

Apache可以作为常见的开发语言的 Web 服务器，集成数据库、应用容器，最后形成一个完整的应用运行环境，例如：Apache+PHP，Apache+Tomcat+Java等

下面我们以常见的开发语言为例，分别介绍它们是如何与Apache一起工作的。

### PHP

Apache被广泛用于PHP环境，Apache有两种PHP处理机制：

- php-fpm：PHP内核中用来处理PHP文件的解释器和进程管理器
- mod_php：Apache的PHP处理模块

mod_php 作为Apache的模块，没有独立的进程，无需额外设置和处理，使用起来非常简单。

PHP-FPM(PHP FastCGI Process Manager)意：PHP FastCGI 进程管理器，用于管理PHP 进程池的软件，用于接受Apache HTTP Server等Web服务器的请求。PHP-FPM提供了更好的PHP进程管理方式，可以有效控制内存和进程、可以平滑重载PHP配置。

下面是Apache+PHP-FPM共同工作的系统架构图，其中mod_proxy_fcgi用于Apache连接php-fpm

![img](https://i.loli.net/2021/01/29/tFyCfS25oEWXi8m.png)

### Java

Apache HTTP Server 无法直接运行Java程序，而是与Tomcat一起组合去部署Java程序。

这种组合下，Apache处理静态资源，JSP等动态程序需转发给Tomcat处理，然后返回给用户。

Apache HTTP Server 与 Tomcat 最常见的连接方式是http_proxy，即利用 Apache 自带的 mod_proxy 模块使用代理技术来连接 Tomcat。

http_proxy 模式是基于 HTTP 协议的代理，因此它要求 Tomcat 必须提供 HTTP 服务，也就是说必须启用 Tomcat 的 HTTP Connector。一个最简单的配置如下：

```text
ProxyPass /images !
ProxyPass /css !
ProxyPass /js !
ProxyPass / http://localhost:8080/
```

更多请参考：[《Apache HTTP Server 与 Tomcat 的三种连接方式介绍》(opens new window)](https://www.ibm.com/developerworks/cn/opensource/os-lo-apache-tomcat/)

### Python

Apache HTTP Server 也可以用于Python环境，通过扩展模块mod_proxy_uwsgi，连接Python的uWSGI服务器或Gunicorn服务器，便可以解析Python程序。

这种组合的的基本配置方法如下：

1. 配置为uwsgi.ini

   ```text
   [uwsgi]
   chdir = /home/vagrant/myweb/
   virtualenv = /home/vagrant/env/
   socket = 127.0.0.1:8080
   env = DJANGO_SETTINGS_MODULE=myweb.settings
   module =myweb.wsgi:application
   master = true
   processes = 4
   vacuum = True
   max-requests = 5000
   daemonize = /var/log/uwsgi.log
   pidfile = /var/log/uwsgi.pid
   ```

2. apache的配置文件加载mod_proxy_uwsgi.so

3. apache的配置文件反向代理到uwsgi

   ```text
   ProxyPass / uwsgi://127.0.0.1:8080
   ```

###Node.js

Apache HTTP Server 也可以用于Node.js环境，Apache HTTP Server 与 Node.js 最常见的连接方式是http_proxy，即利用 Apache 自带的 mod_proxy 模块使用代理技术来连接 Node.js。

下面是典型的配置文件范例：

```text
server {
        listen 80 default_server;
        server_name _;


        location / {
         proxy_pass http://127.0.0.1:2368;
         proxy_set_header Host $host;
         proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        }

}
```