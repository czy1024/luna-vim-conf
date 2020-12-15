使用NSSM注册Windows服务

NSSM介绍
NSSM(the Non-Sucking Service Manager)是Windows环境下一款免安装的服务管理软件，它可以将应用封装成服务，使之像windows服务可以设置自动启动等。并且可以监控程序运行状态，程序异常中断后自动启动，实现守护进程的功能。不仅支持图形界面操作，也完全支持命令行设置。

同类型的工具还有微软自己的srvany，不过nssm更加简单易用，并且功能强大。它的特点如下：

支持普通exe程序（控制台程序或者带界面的Windows程序都可以）
安装简单，修改方便
可以重定向输出（并且支持Rotation）
可以自动守护封装了的服务，程序挂掉了后可以自动重启
可以自定义环境变量
这里面的每一个功能都非常实用，使用NSSM来封装服务可以大大简化我们的开发流程了。

开发的时候是一个普通程序，降低了开发难度，调试起来非常方便
安装简单，并且可以随时修改服务属性，更新也更加方便
可以利用控制台输出直接实现一个简单的日志系统
不用考虑再加一个服务实现服务守护功能
1.下载并解压

下载链接 https://nssm.cc/download，License is public domain. 软件或其源码都可以无条件用于任何用途。



2. 添加到环境变量Path

这一步是为了方便直接使用nssm命令;不添加到环境变量也是可以的，但是这样每次执行nssm命令都需要cd到nssm文件夹。

 

3. 注册服务

注册服务使用如下命令： nssm install <servicename>



参数填完后执行"install service"按钮即可将服务安装到系统，可以使用系统的服务管理工具service.msc查看了。

如果自动化安装，可以直接带上程序路径： nssm install <servicename> <program> [<arguments>]

4. 服务管理

服务管理主要有启动、停止和重启，其命令如下：

启动服务： nssm start <servicename>
停止服务： nssm stop <servicename>
重启服务： nssm restart <servicename>
暂停/继续服务
nssm pause <servicename>
nssm continue <servicename>
查看服务状态：nssm status <servicename>
当然，也可以使用系统自带的服务管理器操作和使用系统的命令。

5. 常见命令

    1）修改参数：

NSSM安装的服务修改起来非常方便，命令如下：

nssm edit <servicename>

会自动启动操作界面，直接更改即可。

 

  2）服务删除：

服务删除可以使用如下命令之一：

nssm remove <servicename>
nssm remove <servicename> confirm
功能没有大的区别，后面的命令是自动确认的，没有交互界面。