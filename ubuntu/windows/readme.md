## windows 安装ubuntu子系统

一、设置开发人员选项

![img](https://upload-images.jianshu.io/upload_images/10973801-0761ea5e814f830a.png?imageMogr2/auto-orient/strip|imageView2/2/w/1191/format/webp)

![img](https://upload-images.jianshu.io/upload_images/10973801-8b6c48a22e7d99d3.png?imageMogr2/auto-orient/strip|imageView2/2/w/1200/format/webp)

## 修改之后需要重启

二、修改系统设置
 打开控制面板->程序与功能->启用或关闭windows功能
 勾选    [适用于linux的windows子系统]    选项



![img](https://upload-images.jianshu.io/upload_images/10973801-7228247d27e02bf8.png?imageMogr2/auto-orient/strip|imageView2/2/w/703/format/webp)





![img](https://upload-images.jianshu.io/upload_images/10973801-2bfaf3d309c3d182.png?imageMogr2/auto-orient/strip|imageView2/2/w/962/format/webp)

## 去应用商店安装Ubuntu

![img](https://upload-images.jianshu.io/upload_images/10973801-9573ef8b7a53022e.png?imageMogr2/auto-orient/strip|imageView2/2/w/800/format/webp)

![img](https://upload-images.jianshu.io/upload_images/10973801-51fda6ac8a4d1393.png?imageMogr2/auto-orient/strip|imageView2/2/w/793/format/webp)

![img](https://upload-images.jianshu.io/upload_images/10973801-a71e6be035e7d24f.png?imageMogr2/auto-orient/strip|imageView2/2/w/793/format/webp)

## 打开Ubuntu，设置好账号密码



![img](https://upload-images.jianshu.io/upload_images/10973801-082bf8b4f0fdbaee.png?imageMogr2/auto-orient/strip|imageView2/2/w/321/format/webp)





![img](https://upload-images.jianshu.io/upload_images/10973801-f1c2e920442fbdab.png?imageMogr2/auto-orient/strip|imageView2/2/w/703/format/webp)



## 更换为国内源

 国内几个主要的ubuntu软件源：[https:blog.csdn.net/qq_34889607/article/details/82500602?utm_source=blogxgwz0](https:links.jianshu.com/go?to=https%3A%2F%2Fblog.csdn.net%2Fqq_34889607%2Farticle%2Fdetails%2F82500602%3Futm_source%3Dblogxgwz0)
 在此使用的清华源



```cpp
deb https:mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb-src https:mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb https:mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb-src https:mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb https:mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb-src https:mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb https:mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
deb-src https:mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
deb https:mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src https:mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
```

将/etc/apt/source.list文件备份并更改源



```cpp
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
sudo vim /etc/apt/sources.list
```

打开文件后，
 第一种换源方法：将里面的ubuntu官方地址全部换成下面第二张图中所示的清华大学软件源地址，同时别忘了把前面的http换成https，修改完毕后保存退出



![img](https://upload-images.jianshu.io/upload_images/10973801-aa27bd17d25a1443.png?imageMogr2/auto-orient/strip|imageView2/2/w/942/format/webp)





第二种换源方法：将里面的都注释掉，直接把完整源放到文件后面



![img](https://upload-images.jianshu.io/upload_images/10973801-d66d00d687a848c8.png?imageMogr2/auto-orient/strip|imageView2/2/w/874/format/webp)

执行(切记)

```csharp
sudo apt-get update
```

## 迁移（针对有迁移需求的）

 将存储在C盘的Linux子系统迁移到别的盘符
 1、下载[LxRunOffline](https:links.jianshu.com/go?to=https%3A%2F%2Fgithub.com%2FDDoSolitary%2FLxRunOffline%2Freleases)

![img](https://upload-images.jianshu.io/upload_images/10973801-8e8c66e89a5c429c.png?imageMogr2/auto-orient/strip|imageView2/2/w/1136/format/webp)
 2、解压，打开PowerShell

```cpp
cd .\software\LxRunOffline-v3.4.1-msvc\
//查看安装了哪些子系统
.\LxRunOffline.exe list  
//迁移 （有warning不用管，一直等到执行完毕即可）
.\LxRunOffline.exe move -n Ubuntu-18.04 -d G:\wsl\Ubuntu-18.04
//查看迁移后的子系统安装目录
.\LxRunOffline.exe get-dir -n Ubuntu-18.04
```

## 安装ubuntu的桌面环境

 总共需要安装三个软件，分别是 xorg、xfce和xrdp
 1、安装xorg这个基础软件环境，命令是：

```csharp
sudo apt-get install xorg
```

2、安装xfce这个桌面环境，安装命令是:



```csharp
sudo apt-get install  xfce4
```

3、安装xrdp这个软件，xrdp这个软件的作用是提供一个windows远程桌面的服务端，让windows主机可以通过常用的远程桌面工具连接到linux服务器上。安装命令是：

```csharp
sudo apt-get install xrdp
```

4、配置一下环境，首先需要修改一下xrdp监听的端口，xrdp默认是监听在3389端口上，而因为windows主机和linux子系统是在同一台机器上，因此windows自己的远程桌面程序监听的3389端口就会和linux子系统上的xrdp监听的3389端口冲突。我们先打开xrdp程序的配置文件，命令是：

```cpp
//备份
sudo cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak
//修改
sudo vim /etc/xrdp/xrdp.ini
```

![img](https://upload-images.jianshu.io/upload_images/10973801-bf8ca2fc2cec3146.png?imageMogr2/auto-orient/strip|imageView2/2/w/625/format/webp)

5、将xfce4的会话环境写入到默认的会话环境配置文件中去，命令是：

```bash
sudo echo xfce4-session > ~/.xsession
```

写入完成后重新启动xrdp服务，命令是：

```kotlin
sudo /etc/init.d/xrdp restart 
```

启动完成后，ubuntu的桌面环境就配置好了。
 6、查看IP地址

![img](https://upload-images.jianshu.io/upload_images/10973801-869ce1be770cf677.png?imageMogr2/auto-orient/strip|imageView2/2/w/750/format/webp)



## 登录Ubuntu系统



![img](https://upload-images.jianshu.io/upload_images/10973801-03e9ae4593be8e7d.png?imageMogr2/auto-orient/strip|imageView2/2/w/287/format/webp)

![img](https://upload-images.jianshu.io/upload_images/10973801-62ed619c7558afb7.png?imageMogr2/auto-orient/strip|imageView2/2/w/482/format/webp)