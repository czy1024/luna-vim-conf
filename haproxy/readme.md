# HAProxy

## HAProxy介绍

HAProxy: 是法国人Willy Tarreau开发的一个开源软件，是一款应对客户端10000以上的同时连接的高性能的TCP和 HTTP负载均衡器。其功能是用来提供基于cookie的持久性， 基于内容的交换，过载保护的高级流量管制，自动故障切换 ，以正则表达式为基础的标题控制运行时间，基于Web的报表，高级日志记录以帮助排除故障的应用或网络及其他功能。

## 相关概念

### 代理的作用

1. 正向代理，反向代理
2. 代理服务器，可以提供缓存功能加速客户端访问，同时可以对缓存数据进行有效性检查
3. 内容路由：根据流量以及内容类型将请求转发至特定的服务器
4. 转码器：支持压缩功能，将数据以压缩形式发送给客户端

### 缓存的作用

1. 减少访冗余内容传输
2. 节省带宽，缓解网络瓶颈
3. 降低了对原始服务器的请求压力
4. 降低了传输延迟

### 负载均衡集群：

四层：
lvs, nginx(stream)，haproxy(mode tcp)
七层：
http: nginx(http, ngx_http_upstream_module), haproxy(mode http), httpd, ats, perlbal, pound...

### HAProxy功能

HAProxy是TCP / HTTP反向代理服务器，尤其适合于高可用性环境
可以针对HTTP请求添加cookie，进行路由后端服务器
可平衡负载至后端服务器，并支持持久连接
支持基于cookie进行调度
支持所有主服务器故障切换至备用服务器
支持专用端口实现监控服务
支持不影响现有连接情况下停止接受新连接请求
可以在双向添加，修改或删除HTTP报文首部
支持基于pattern实现连接请求的访问控制
通过特定的URI为授权用户提供详细的状态信息
版本：1.4 1.5 1.6 1.7 1.8
![img](https://i.loli.net/2021/01/29/xjDWm63snTL48fG.png)

支持http反向代理
支持动态程序的反向代理
支持基于数据库的反向代理

## HAproxy组成

包名：haproxy

### 程序环境

主程序：/usr/sbin/haproxy
配置文件：/etc/haproxy/haproxy.cfg
Unit file：/usr/lib/systemd/system/haproxy.service

### 配置文件

haproxy.cfg主要有两部分组成：global，和proxies配置段

#### global：全局配置段

进程及安全配置相关的参数
性能调整相关参数
Debug参数

#### proxies：代理配置段

defaults：为frontend, backend, listen提供默认配置
fronted：前端，相当于nginx, server {}
backend：后端，相当于nginx, upstream {}
listen：同时拥有前端和后端,适用于一对一环境

### 简单前端调度实现

利用四台虚拟机实现简单的前端轮询调度。
一台客户端，一台haproxy调度器，两台RS

1. 首先在后端部署两台http服务

2. 编辑haproxy配置文件/etc/haproxy/haproxy.cfg
   默认设置不做修改

   ```bash
   [root@CentOS6 ~]# vim /etc/haproxy/haproxy.cfg 
   frontend  main *:80     #设置监听ip：端口
   default_backend         websrvs     #调用后端RS组名
   backend websrvs
   balance     roundrobin      #轮询算法
   server      web1 192.168.45.11:80 check
   server      web2 192.168.45.12:80 check
   ```

   

## 配置

### global配置参数：

```bash
global      # 全局参数的设置
log         127.0.0.1   local2                      
# log语法：log <address_1>[max_level_1] 
# 全局的日志配置，使用log关键字，指定使用127.0.0.1上的syslog服务中的local0日志设备，记录日志等级为info的日志
chroot      /var/lib/haproxy        #改变当前工作目录
pidfile     /var/run/haproxy.pid    #当前进程id文件
maxconn     4000                    #最大连接数
user        haproxy                 #所属用户
group       haproxy                 #所属组
daemon                              #以守护进程方式运行haproxy
stats socket /var/lib/haproxy/stats #基于本地的文件传输
```

实现日志记录：
haproxy配置文件中默认定义了log 127.0.0.1 local2 说明日志将被记录在本机的local2设施中。
编辑rsyslog配置文件：

```bash
[root@CentOS6 ~]#vim /etc/rsyslog.conf
# Provides UDP syslog reception
$ModLoad imudp      #取消注释
$UDPServerRun 514   #取消注释
local2.*            /var/log/haproxy.log
#指定设备local2日志存放位置
```

haproxy的日志信息可以设置存放在专门的日志服务器中

### proxies配置参数：

代理配置段：

- defaults <name>
- frontend <name>
- backend <name>
- listen <name>

Frontend段：指定接收客户端连接侦听套接字设置
Backend段：指定将连接请求转发至后端服务器的相关设置
Listen段：指定完整的前后端设置，只对 TCP 有效
proxy 名称：使用字母 数字 - _ . : 并区分字符大小写

```bash
mode        http             
#默认的模式mode { tcp|http|health }，tcp是4层，http是7层，health只会返回OK
log         global        
#应用全局的日志配置
option      httplog       
# 启用日志记录HTTP请求，默认haproxy日志记录是不记录HTTP请求日志
option      dontlognull   
# 启用该项，日志中将不会记录空连接。所谓空连接就是在上游的负载均衡器或者监控系统为了探测该服务是否存活可用时，需要定期的连接或者获取某一固定的组件或页面，或者探测扫描端口是否在监听或开放等动作被称为空连接；官方文档中标注，如果该服务上游没有其他的负载均衡器的话，建议不要使用该参数，因为互联网上的恶意扫描或其他动作就不会被记录下来
option      http-server-close  
#每次请求完毕后主动关闭http通道
option      forwardfor       except 127.0.0.0/8   
#如果服务器上的应用程序想记录发起请求的客户端的IP地址，需要在HAProxy上配置此选项， 这样 HAProxy会把客户端的IP信息发送给服务器，在HTTP请求中添加"X-Forwarded-For"字段。启用X-Forwarded-For，在requests头部插入客户端IP发送给后端的server，使后端server获取到客户端的真实IP。 
option        redispatch                      
#当使用了cookie时，haproxy将会将其请求的后端服务器的serverID插入到cookie中，以保证会话的SESSION持久性；而此时，如果后端的服务器宕掉了， 但是客户端的cookie是不会刷新的，如果设置此参数，将会将客户的请求强制定向到另外一个后端server上，以保证服务的正常。
retries       3                             
# 定义连接后端服务器的失败重连次数，连接失败次数超过此值后将会将对应后端服务器标记为不可用
timeout http-request    10s     #http请求超时时间
timeout queue           1m      #一个请求在队列里的超时时间
timeout connect         10s     #连接超时
timeout client          1m      #客户端超时
timeout server          1m      #服务器端超时
timeout http-keep-alive 10s     #设置http-keep-alive的超时时间
timeout check           10s     #检测超时
maxconn                 3000    #每个进程可用的最大连接数
frontend  main *:80             #监听地址为80
acl url_static       path_beg       -i /static /images /javascript /stylesheets
acl url_static       path_end       -i .jpg .gif .png .css .js
use_backend static          if url_static
default_backend             my_webserver     
#定义一个名为my_app前端部分。此处将对应的请求转发给后端
backend static                                       
#使用了静态动态分离（如果url_path匹配 .jpg .gif .png .css .js静态文件则访问此后端）
balance             roundrobin                       
#负载均衡算法（#banlance roundrobin 轮询，balance source 保存session值，支持static-rr，leastconn，first，uri等参数）
server              static 127.0.0.1:80 check         
#静态文件部署在本机（也可以部署在其他机器或者squid缓存服务器）
backend my_webserver                                 
#定义一个名为my_webserver后端部分。PS：此处my_webserver只是一个自定义名字而已，但是需要与frontend里面配置项default_backend 值相一致
balance     roundrobin          #负载均衡算法
server  web01 172.31.2.33:80  check inter 2000 fall 3 weight 30              #定义的多个后端
server  web02 172.31.2.34:80  check inter 2000 fall 3 weight 30              #定义的多个后端
server  web03 172.31.2.35:80  check inter 2000 fall 3 weight 30              #定义的多个后端
```

### Balance配置

balance：后端服务器组内的服务器调度算法
balance <algorithm> [ <arguments> ]
balance url_param <param> [check_post]
haproxy中调度算法同样分为动态调度算法和静态调度算法，与nginx调度算法中区分动静态调度算法的概念不同，nginx用能不能根据后端服务器的负载状况进行调度来区分动静态调度算法的差别，而haproxy中则根据该算法支不支持运行时即时生效来区分动静态算法。

调度算法：
roundrobin：基于权重轮询，动态算法，支持权重的运行时调整，支持慢启动；每个后端backend中最多支持4095个
server server options： weight #

static-rr：基于权重轮询，静态算法，不支持权重的运行时调整及慢启动；后端主机数量无上限

leastconn：加权最少连接，动态算法，最少连接的后端服务器优先分配接收新连接，相同连接时轮询，适用于长连接场景，例如 MySQL、LDAP等，不适合http

first：根据服务器在列表中的位置，自上而下进行调度；前面服务器的连接数达到上限，新请求才会分配给下一台服务

source：源地址hash，新连接先按权重分配，后续连接按source分配请求
动静态取决于hash type
hash-type：哈希算法
hash-type <method> <function> <modifier>
method:
map-based：除权取余法，哈希数据结构是静态数组（不支持权重动态调整）
consistent：一致性哈希，哈希数据结构是一棵树 （支持权重动态调整）
<function> : 哈希函数
sdbm djb2 wt6

uri：
对URI的左半部分或整个uri做hash计算，并除以服务器总权重取模，以后派发至某挑出的服务器,适用于后端缓存服务器
动静态取决于hash type

```
hash-type
    map-based
    consistent
```

<scheme>://<user>:<password>@<host>:<port>/<path> ;<params>?<query>#<frag>
左半部分：/<path>;<params>
整个uri：/<path>;<params>?<query>#<frag>

url_param：
对用户请求的uri听<params>部分中的参数的值作hash计算， 并由服务器总权重相除以后派发至某挑出的服务器；通常用于追踪用户，以确保来自同一个用户的请求始终发往同一个Backend Server
动静态取决于hash type

```
hash-type
    map-based
    consistent
```

hdr(<name>)：根据请求报文中指定的header（如use_agent,referer,hostname）将该hesder做hash计算进行调度
动静态取决于hash type

```
hash-type
    map-based
    consistent
```

hdr(Cookie)

rdp-cookie 远程桌面相关

rdp-cookie(<name>)

### default_backend <backend>

无use_backend 匹配时，使用默认的backend，用于 frontend中

### server

server <name> <address>[:[port]] [param*]
定义后端主机的各服务器及其选项 server <name> <address>[:port] [settings ...] default-server [settings ...]

<name>：服务器在haproxy上的内部名称；出现在日志及警告信息

<address>：服务器地址，支持使用主机名

[:[port]]：端口映射；省略时，表示同bind中绑定的端口

[param*]：参数
check：对当前server做健康状态检测，只用于四层检测
注意：httpchk，“smtpchk”, “mysql-check”, “pgsql-check” and “sslhello-chk” 用于定义应用层检测方法
addr ：检测时使用的IP地址
port ：针对此端口进行检测
inter <delay>：连续两次检测之间的时间间隔，默认为2000ms
rise <count>：连续多少次检测结果为“成功”才标记服务器为可用 ；默认为2
fall <count>：连续多少次检测结果为“失败”才标记服务器为不可 用；默认为3
cookie <value>：为当前server指定cookie值，实现基于cookie的会话黏性
disabled：标记为不可用
redir <prefix>：将发往此server的所有GET和HEAD类的请求重定向至指 定的URL
weight <weight>：权重，默认为1
maxconn <maxconn>：当前server的最大并发连接数
backlog <backlog>：当server的连接数达到上限后的后援队列长度
backup：设定当前server为备用服务器

default-server [param*] 为backend中的各server设定默认选项

### bind配置

bind：指定一个或多个前端侦听地址和端口
只用于frountend配置段和listen配置段
bind [<address>]:<port_range> [, ...] [param*]
示例：

```bash
listen http_proxy 
    bind :80,:443 
    bind 10.0.0.1:10080,10.0.0.1:10443 
    bind /var/run/ssl-frontend.sock user root mode 600 accept-proxy
```

### maxconn

maxconn <conns>：为指定的frontend定义其最大并发连接数；默认为2000

### mode { tcp|http|health }

定义haproxy的工作模式
tcp：基于layer4实现代理；可代理mysql, pgsql, ssh, ssl等协议,https时使用此模式，默认模式
http：仅当代理协议为http时使用,centos实际默认模式
health：工作为健康状态检查的响应模式，当连接请求到达时回应“OK”后即断开连接，较少使用

### 基于cookie的会话绑定

cookie <name> [ rewrite | insert | prefix ] [ indirect ] [ nocache ] [ postonly ] [ preserve ] [ httponly ] [ secure ] [ domain <domain> ]* [ maxidle <idle> ] [ maxlife <life> ]
<name>：cookie名称，用于实现持久连接
rewrite：重写
insert：插入
prefix：前缀
配置示例：

```bash
backend websrvs
  balance     roundrobin
  cookie WEBSRV insert nocache indirect
  server   web1 192.168.45.11:80 check cookie srv1
  server   web2 192.168.45.12:80 check cookie srv2
#每个server有自己的唯一的cookie标识
#在backend中为用户请求调度完成后操纵其cookie
```

### 统计接口启用相关的参数

stats enable
启用统计页；基于默认的参数启用stats page

- stats uri : /haproxy?stats uri默认值
- stats realm : HAProxy Statistics
- stats auth : no authentication

stats uri <prefix> 自定义stats page uri

stats auth <user>:<passwd> 认证时的账号和密码，可使用多次

stats realm <realm> 认证时的realm

stats hide-version 隐藏版本

stats refresh <delay> 设定自动刷新时间间隔

stats admin { if | unless } <cond> 启用stats page中的管理功能

配置示例：

```bash
listen stats 
    bind :9099 
    stats enable 
    stats realm HAPorxy\ Stats\ Page 
    stats auth 用户名：密码
    stats admin if TRUE
#在frountend中单独定义一个stats服务，监听9099端口
#如果认证成功就开启管理功能
```

### forwardfor配置

option forwardfor [ except <network> ] [ header <name> ] [ if-none ]
在由haproxy发往后端主机的请求报文中添加“X-ForwardedFor”首部，其值为前端客户端的地址；用于向后端主发送真实的客户端IP

[ except <network> ]：请求报请来自此处指定的网络时不予添加此首部，如haproxy自身所在网络

[ header <name> ]：使用自定义的首部名称，而非“XForwarded-For”

[ if-none ] 如果没有首部才添加首部，如果有使用默认值

为指定的MIME类型启用压缩传输功能
compression algo <algorithm> ...：启用http协议的压缩机制，指明压缩算法gzip, deflate
compression type <mime type> ...：指明压缩的MIMI类型

### 错误页配置

errorfile <code> <file> 自定义错误页
<code>：HTTP status code.
支持200, 400, 403, 408, 500, 502, 503, 504.
<file>：错误页文件路径

示例：
使用haproxy主机本地的文件进行响应

```bash
errorfile 400 /etc/haproxy/errorfiles/400badreq.http 
errorfile 408 /dev/null     # workaround Chrome preconnect bug 
errorfile 403 /etc/haproxy/errorfiles/403forbid.http 
errorfile 503 /etc/haproxy/errorfiles/503sorry.http 
```

使用url进行响应，响应状态码为302，不适用于GET以外的其他请求方法：
errorloc <code> <url> 相当于errorloc302 <code> <url>，利用302重定向至指URL

```
errorloc 503 http://www.a.com/error_pages/503.html
```

### 修改报文首部

reqadd <string> [{if | unless} <cond>]
在请求报文尾部添加指定首部

rspadd <string> [{if | unless} <cond>]
在响应报文尾部添加指定首部
示例：

```
rspadd X-Via:\ HAPorxy  #字符串中的空格要转义
```

reqdel <search> [{if | unless} <cond>]
reqidel <search> [{if | unless} <cond>] (ignore case) 不分大小写
从请求报文中删除匹配正则表达式的首部

rspdel <search> [{if | unless} <cond>]
rspidel <search> [{if | unless} <cond>] (ignore case) 不分大小写从响应报文中删除匹配正则表达式的首部 示例： rspidel Server.*

### 连接超时

timeout client <timeout> 客户端最长空闲连接超时时长 默认单位是毫秒
timeout server <timeout> 后端服务器最长空闲连接超时时长
timeout http-keep-alive <timeout> 持久连接的持久时长
timeout http-request <timeout> 一次完整的HTTP请求的最大等待时长
timeout connect <timeout> 成功连接后端服务器的最大等待时长
timeout client-fin <timeout> 客户端半连接的空闲时长
timeout server-fin <timeout> 后端服务器半连接的空闲时长

## ACL

acl：haproxy的ACL用于实现基于请求报文的首部、响应报文的内容或其他的环境状态信息来做出转发决策，这大大增加了其配置弹性。其配置法则一般分为两部，首先定义ACL，既定义一个测试条件，而后在条件得到满足时执行某特定动作，如阻止访问或者转发至某特定的后端，
定义ACL的语法格式如下：
acl <aclname> <criterion> [flags] [operator] [<value>] ...

<aclname>：ACL名称，可使用字母 数字 : . - _ 区分字符大小写

<criterion>： 指明检查条件
各种条件 :
dst 目标IP
dst_port 目标PORT
src 源IP
src_port 源PORT
示例：

```
acl invalid_src src 172.16.100.200
```

<value>的类型：

- boolean
- integer or integer range
- IP address / network
- string (exact, substring, suffix, prefix, subdir, domain)
- regular expression
- hex block

<flags>
-i 不区分大小写
-m 使用指定的pattern匹配方法
-n 不做DNS解析
-u 强制每个ACL必须唯一ID，否则多个同名ACL或关系
-- 强制flag结束. 当字符串和某个flag相似时使用

[operator]
匹配整数值：eq、ge、gt、le、lt
匹配字符串：

- exact match (-m str) :字符串必须完全匹配模式
- substring match (-m sub) :在提取的字符串中查找模式， 如果其中任何一个被发现，ACL将匹配
- prefix match (-m beg) :在提取的字符串首部中查找模式 ，如果其中任何一个被发现，ACL将匹配
- suffix match (-m end) :将模式与提取字符串的尾部进行比较，如果其中任何一个匹配，则ACL进行匹配
- subdir match (-m dir) :查看提取出来的用斜线分隔（ “/”）的字符串，如果其中任何一个匹配，则ACL进行匹配
- domain match (-m dom) :查找提取的用点（“.”）分隔 字符串，如果其中任何一个匹配，则ACL进行匹配

### acl作为条件时的逻辑关系:

- 与：隐式（默认）使用
- 或：使用“or” 或 “||”表示
- 否定：使用“!“ 表示

示例：

```bash
if invalid_src invalid_port 与关系 
if invalid_src || invalid_port 或 
if ! invalid_src 非 
```

### base : string

返回第一个主机头和请求的路径部分的连接，该请求从第一个斜杠开始，并在问号之前结束,对虚拟主机有用
<scheme>://<user>:<password>@<host>:<port>/<path>;< params>?<query>#<frag>
base : exact string match
base_beg : prefix match
base_dir : subdir match
base_dom : domain match
base_end : suffix match
base_len : length match
base_reg : regex match
base_sub : substring match

### path : string

提取请求的URL路径，该路径从第一个斜杠开始，并在问号之 前结束（无主机部分）
<scheme>://<user>:<password>@<host>:<port>/<path>;< params>?<query>#<frag>
path : exact string match
path_beg : prefix match 匹配路径开头
path_dir : subdir match
path_dom : domain match
path_end : suffix match 匹配路径结尾
path_len : length match
path_reg : regex match 正则表达式匹配一类PATH
path_sub : substring match

### url : string

提取请求中的URL。一个典型的应用是具有预取能力的缓存， 以及需要从数据库聚合多个信息并将它们保存在缓存中的网页门户入口
url : exact string match
url_beg : prefix match URL开头，匹配协议
url_dir : subdir match
url_dom : domain match
url_end : suffix match URL结尾
url_len : length match
url_reg : regex match 正则表达式匹配一类url
url_sub : substring match

### req.hdr([

提取在一个HTTP请求报文的首部
hdr([<name>[,<occ>]]) : exact string match
hdr_beg([<name>[,<occ>]]) : prefix match 首部开头
hdr_dir([<name>[,<occ>]]) : subdir match
hdr_dom([<name>[,<occ>]]) : domain match
hdr_end([<name>[,<occ>]]) : suffix match 首部结尾
hdr_len([<name>[,<occ>]]) : length match
hdr_reg([<name>[,<occ>]]) : regex match
hdr_sub([<name>[,<occ>]]) : substring match
示例：

```bash
acl bad_curl hdr_sub(User-Agent) -i curl 
block if bad_curl 
```

### status : integer

返回在响应报文中的状态码

### 预定义ACL

ACL名称 等价于 说明
TRUE always_true 总是匹配
FALSE always_false 从不匹配
HTTP req_proto_http 匹配HTTP协议
HTTP_1.0 req_ver 1.0 匹配HTTP协议1.0
HTTP_1.1 req_ver 1.1 匹配HTTP协议1.1
HTTP_CONTENT hdr_val(content-length) gt 0 匹配已存在内容长度
HTTP_URL_ABS url_reg ^[^/:]*:// 匹配URL绝对路径
HTTP_URL_SLASHurl_beg / 匹配URL相对路径
HTTP_URL_STAR url * 匹配 URL 等于 "*"
LOCALHOST src 127.0.0.1/8 匹配从localhost来的连接
METH_CONNECT method CONNECT 匹配HTTP CONNECT方法
METH_GETmethod GET HEAD #match HTTP GET or HEAD method
METH_HEAD method HEAD #match HTTP HEAD method
METH_OPTIONS method OPTIONS #match HTTP OPTIONS method
METH_POST method POST #match HTTP POST method
METH_TRACE method TRACE #match HTTP TRACE method
RDP_COOKIE req_rdp_cookie_cnt gt 0 #match presence of an RDP cookie
REQ_CONTENT req_len gt 0 #match data in the request buffer
WAIT_ENDwait_end #wait for end of content analysis

### acl配置

#### 基于IP的访问控制

use_backend <backend> [{if | unless} <condition>]
当if/unless一个基于ACL的条件匹配时切换指定backend

```bash
acl invalid_src src 172.16.200.2 
block if invalid_src 
errorfile 403 /etc/fstab
```

#### 七层请求的访问控制

http-request { allow | deny |add-header <name> <fmt> |set-header <name> <fmt> } [ { if | unless } <condition> ]

#### 四层请求访问控制

tcp-request connection {accept|reject} [{if | unless} <condition>]
示例：

```bash
listen ssh 
bind :22022 
balance leastconn 
acl invalid_src src 172.16.200.2 
tcp-request connection reject if invalid_src 
mode tcp 
server sshsrv1 172.16.100.6:22 check 
server sshsrv2 172.16.100.7:22 check backup
```

#### 基于ACL的动静分离示例

```bash
frontend  web *:80 
    acl url_static       path_beg       -i /static /images /javascript /stylesheets 
    acl url_static       path_end       -i .jpg .gif .png .css .js .html .txt .htm 
    use_backend staticsrvs       if url_static 
    default_backend             appsrvs 
backend staticsrvs 
    balance     roundrobin 
    server      stcsrv1 172.16.100.6:80 check 
backend appsrvs 
    balance     roundrobin 
    server  app1 172.16.100.7:80 check 
    server  app1 172.16.100.7:8080 check 
listen stats 
    bind :9091 
    stats enable 
    stats auth admin:admin 
    stats admin if TRUE
#一个ACL定义了两个条件，如果用户的请求满足PATH中带有/static /images /javascript /stylesheets 这些字符的，或者path是以.jpg .gif .png .css .js .html .txt .htm 这些字符结尾的就匹配ACL定义
#满足ACL定义的请求为静态请求，被调度到后端的staticsrvs机组上
#不满组以上两个条件的请求默认调度都后端包含两台服务器轮询的appsrvs机组上
```

### 支持https协议

配置HAProxy支持https协议：
1 支持ssl会话；
bind *:443 ssl crt /PATH/TO/SOME_PEM_FILE
crt 后证书文件为PEM格式，且同时包含证书和所有私钥
cat demo.crt demo.key > demo.pem

2 把80端口的请求重向定443
bind *:80
redirect scheme https if !{ ssl_fc }

3 向后端传递用户请求的协议和端口（frontend或backend）
http_request set-header X-Forwarded-Port %[dst_port]
http_request add-header X-Forwared-Proto https if { ssl_fc }