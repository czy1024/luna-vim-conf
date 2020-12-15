## 为什么需要内网穿透功能

**从公网中访问自己的私有设备向来是一件难事儿。**
自己的主力台式机、NAS等等设备，它们可能处于路由器后，或者运营商因为IP地址短缺不给你分配公网IP地址。如果我们想直接访问到这些设备（远程桌面，远程文件，SSH等等），一般来说要通过一些转发或者P2P组网软件的帮助。
我有一台计算机位于一个很复杂的局域网中，我想要实现远程桌面和文件访问，目前来看其所处的网络环境很难通过简单的端口映射将其暴露在公网之中，我试过这么几种方法：

1. 远程桌面使用TeamViewer。可用，但需要访问端也拥有TeamViewer软件，不是很方便，希望能使用Windows自带的远程桌面。且TeamViewer不易实现远程文件访问。
2. 使用蒲公英VPN软件进行组网，可用，但免费版本网络速度极慢，体验不佳，几乎无法正常使用。
3. 使用花生壳软件进行DDNS解析，可用，但同第二点所述，免费版本有带宽限制，无法实际使用。
4. **搭建frp服务器进行内网穿透，可用且推荐，可以达到不错的速度，且理论上可以开放任何想要的端口，可以实现的功能远不止远程桌面或者文件共享。**

## frp是什么

简单地说，[frp](https://github.com/fatedier/frp/blob/master/README_zh.md)就是一个[反向代理软件](https://www.zhihu.com/question/24723688)，它体积轻量但功能很强大，可以**使处于内网或防火墙后的设备对外界提供服务**，它支持HTTP、TCP、UDP等众多协议。我们今天仅讨论TCP和UDP相关的内容。
截至本文完成，frp的最新版本为v0.22.0，本文使用最新版本。

## 准备工作

搭建一个完整的frp服务链，我们需要

1. VPS一台（也可以是具有公网IP的实体机）
2. 访问目标设备（就是你最终要访问的设备）
3. 简单的Linux基础（会用cp等几个简单命令即可）

### VPS相关

- 因为frp的原理是利用服务端（所准备的VPS）进行转发，因而VPS的速度直接决定了之后连接的质量，请根据自己的需要选择相应主机配置。
- 我使用了DigitalOcean的新加坡机房，北京移动、中国教育网下测试速度尚可。
- 系统使用Ubuntu 16.04.5 x64，frp客户端和服务端本身同时均支持Linux和Windows，且配置方法一样，请根据实际环境自行测试，如果你是新建的VPS，那选择Ubuntu 16.04.5 x64就可以了。

## 服务端设置

SSH连接到VPS之后运行如下命令查看处理器架构，根据架构下载不同版本的frp
`arch`
查看结果，如果是“X86_64“即可选择”amd64”，
运行如下命令，根据架构不同，选择相应版本并进行下载
`wget https://github.com/fatedier/frp/releases/download/v0.22.0/frp_0.22.0_linux_amd64.tar.gz`
然后解压
`tar -zxvf frp_0.22.0_linux_amd64.tar.gz`
文件夹改个名，方便使用
`cp -r frp_0.22.0_linux_amd64 frp`
把解压出来的文件夹复制到你想要的目录下，为了方便我直接放在用户目录下了，进入该目录
`cd frp`
查看一下文件
`ls -a`
我们只需要关注如下几个文件

- frps
- frps.ini
- frpc
- frpc.ini

前两个文件（s结尾代表server）分别是服务端程序和服务端配置文件，后两个文件（c结尾代表client）分别是客户端程序和客户端配置文件。
因为我们正在配置服务端，可以删除客户端的两个文件
`rm frpc`
`rm frpc.ini`
然后修改frps.ini文件
`vim frps.ini`
这个文件应有如下格式

```
[common]
bind_port = 7000
dashboard_port = 7500
token = 12345678
dashboard_user = admin
dashboard_pwd = admin
vhost_http_port = 10080
vhost_https_port = 10443
```

> 如果没有必要，端口均可使用默认值，token、user和password项请自行设置。

- “bind_port”表示用于客户端和服务端连接的端口，这个端口号我们之后在配置客户端的时候要用到。
- “dashboard_port”是服务端仪表板的端口，若使用7500端口，在配置完成服务启动后可以通过浏览器访问 x.x.x.x:7500 （其中x.x.x.x为VPS的IP）查看frp服务运行信息。
- “token”是用于客户端和服务端连接的口令，请自行设置并记录，稍后会用到。
- “dashboard_user”和“dashboard_pwd”表示打开仪表板页面登录的用户名和密码，自行设置即可。
- “vhost_http_port”和“vhost_https_port”用于反向代理HTTP主机时使用，本文不涉及HTTP协议，因而照抄或者删除这两条均可。

编辑完成后保存（vim保存如果不会请自行搜索）。
之后我们就可以运行frps的服务端了
`./frps -c frps.ini`
如果看到屏幕输出这样一段内容，即表示运行正常，如果出现错误提示，请检查上面的步骤。

```
2019/01/12 15:22:39 [I] [service.go:130] frps tcp listen on 0.0.0.0:7000
2019/01/12 15:22:39 [I] [service.go:172] http service listen on 0.0.0.0:10080
2019/01/12 15:22:39 [I] [service.go:193] https service listen on 0.0.0.0:10443
2019/01/12 15:22:39 [I] [service.go:216] Dashboard listen on 0.0.0.0:7500
2019/01/12 15:22:39 [I] [root.go:210] Start frps success
```

此时访问 x.x.x.x:7500 并使用自己设置的用户名密码登录，即可看到仪表板界面

![frp服务端仪表板界面](https://s2.ax1x.com/2019/01/12/FjUf76.png?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)frp服务端仪表板界面



## 服务端后台运行

至此，我们的服务端仅运行在前台，如果Ctrl+C停止或者关闭SSH窗口后，frps均会停止运行，因而我们使用 [nohup命令](https://ehlxr.me/2017/01/18/Linux-的-nohup-命令的用法/)将其运行在后台。

> nohup后台程序管理或关闭相关命令可自行查询资料，上面这个连接中也有所提及。

`nohup ./frps -c frps.ini &`
输出如下内容即表示正常运行

```
nohup: ignoring input and appending output to 'nohup.out'
```

此时可先使用Ctrl+C关闭nohup，frps依然会在后台运行，使用jobs命令查看后台运行的程序
`jobs`
在结果中我们可以看到frps正在后台正常运行

```
[1]+  Running                 nohup ./frps -c frps.ini &
```

此时访问 x.x.x.x:7500 依然可以打开仪表板界面，至此，服务端即设置完成，你可以关闭SSH窗口了。

## 客户端设置

> frp的客户端就是我们想要真正进行访问的那台设备，大多数情况下应该会是一台Windows主机，因而本文使用Windows主机做例子；Linux配置方法类似，不再赘述。

同样地，根据客户端设备的情况选择相应的frp程序进行[下载](https://github.com/fatedier/frp/releases)，Windows下下载和解压等步骤不再描述。
假定你下载了“frp_0.22.0_windows_amd64.zip”，将其解压在了C盘根目录下，并且将文件夹重命名为“frp”，可以删除其中的frps和frps.ini文件。
用文本编辑器打开frpc.ini，与服务端类似，内容如下。

```
[common]
server_addr = x.x.x.x
server_port = 7000
token = won517574356
[rdp]
type = tcp
local_ip = 127.0.0.1           
local_port = 3389
remote_port = 7001  
[smb]
type = tcp
local_ip = 127.0.0.1
local_port = 445
remote_port = 7002
```

其中common字段下的三项即为服务端的设置。

- “server_addr”为服务端IP地址，填入即可。
- “server_port”为服务器端口，填入你设置的端口号即可，如果未改变就是7000
- “token”是你在服务器上设置的连接口令，原样填入即可。

## 自定义规则

frp实际使用时，会按照端口号进行对应的转发，原理如下图所示。

![frp的原理](https://s2.ax1x.com/2019/01/12/FjUW0x.jpg?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)frp的原理


上面frpc.ini的rdp、smb字段都是自己定义的规则，自定义端口对应时格式如下。



- “[xxx]”表示一个规则名称，自己定义，便于查询即可。
- “type”表示转发的协议类型，有TCP和UDP等选项可以选择，如有需要请自行查询frp手册。
- “local_port”是本地应用的端口号，按照实际应用工作在本机的端口号填写即可。
- “remote_port”是该条规则在服务端开放的端口号，自己填写并记录即可。

> RDP，即Remote Desktop 远程桌面，Windows的RDP默认端口是3389，协议为TCP，建议使用frp远程连接前，在局域网中测试好，能够成功连接后再使用frp穿透连接。
>
> SMB，即Windows文件共享所使用的协议，默认端口号445，协议TCP，本条规则可实现远程文件访问。

配置完成frpc.ini后，就可以运行frpc了

> frpc程序不能直接双击运行！

使用命令提示符或Powershell进入该目录下
`cd C:\frp`
并执行
`./frpc -c frpc.ini`
运行frpc程序，窗口中输出如下内容表示运行正常。

```
2019/01/12 16:14:56 [I] [service.go:205] login to server success, get run id [2b65b4e58a5917ac], server udp port [0]
2019/01/12 16:14:56 [I] [proxy_manager.go:136] [2b65b4e58a5917ac] proxy added: [rdp smb]
2019/01/12 16:14:56 [I] [control.go:143] [smb] start proxy success
2019/01/12 16:14:56 [I] [control.go:143] [rdp] start proxy success
```

不要关闭命令行窗口，此时可以在局域网外使用相应程序访问 x.x.x.x:xxxx （IP为VPS的IP，端口为自定义的remote_port）即可访问到相应服务。

## 客户端后台运行及开机自启

frpc运行时始终有一个命令行窗口运行在前台，影响美观，我们可以使用一个批处理文件来将其运行在后台，而且可以双击执行，每次打开frpc不用再自己输命令了。
在任何一个目录下新建一个文本文件并将其重命名为“frpc.bat”，编辑，粘贴如下内容并保存。

```
@echo off
if "%1" == "h" goto begin
mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit
:begin
REM
cd C:\frp
frpc -c frpc.ini
exit
```

> 将cd后的路径更改为你的frpc实际存放的目录。

之后直接运行这个 .bat 文件即可启动frpc并隐藏窗口（可在任务管理器中退出）。
至于开机启动，把这个 .bat 文件直接扔进Windows的开机启动文件夹就好了 :)
至此，客户端配置完成，之后就是你自己根据需要在frpc.ini后追加规则即可。
强烈建议你在使用frp直接测试内网穿透前，先在局域网内测试好相关功能的正常使用，并配置好可能会影响的Windows防火墙等内容，在内网调试通过后再使用frp进行内网穿透测试。