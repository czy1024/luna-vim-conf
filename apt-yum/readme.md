## Ubuntu apt 源

```bash

# 备份原文件
cp /etc/apt/sources.list /etc/apt/sources.list.copy

sudo cat > /etc/apt/sources.list <<EOF 

# ubuntu 20.10
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ groovy main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ groovy main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ groovy-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ groovy-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ groovy-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ groovy-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ groovy-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ groovy-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ groovy-proposed main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ groovy-proposed main restricted universe multiverse
EOF

# 更新源
sudo apt-get update
```

apt-get 命令适用于 deb 包管理式的 Linux 操作系统（Debian、Ubuntu等），主要用于自动从互联网软件仓库中搜索、下载、安装、升级、卸载软件或操作系统。

Ubuntu 软件包查找: [https://packages.ubuntu.com/](https://links.jianshu.com/go?to=https%3A%2F%2Fpackages.ubuntu.com%2F)

### 1. 安装 软件包

apt-get install PackageName                    // 普通安装
 apt-get install PackageName=VersionName     // 安装指定包的指定版本
 apt-get --reinstall install PackageName     // 重新安装

apt-get build-dep PackageName               // 安装源码包所需要的编译环境
 apt-get -f install                                        // 修复依赖关系

apt-get source PackageName                  // 下载软件包的源码

### 2. 卸载 软件包

apt-get remove PackageName              // 删除软件包, 保留配置文件

apt-get --purge remove PackageName      // 删除软件包, 同时删除配置文件
 apt-get purge PackageName               // 删除软件包, 同时删除配置文件

apt-get autoremove PackageName          // 删除软件包, 同时删除为满足依赖
 // 而自动安装且不再使用的软件包

apt-get --purge autoremove PackageName  // 删除软件包, 删除配置文件,
 // 删除不再使用的依赖包

apt-get clean && apt-get autoclean      // 清除 已下载的软件包 和 旧软件包

### 3. 更新 软件包

apt-get update                               // 更新安装源（Source）
 apt-get upgrade                             // 更新已安装的软件包
 apt-get dist-upgrade                      // 更新已安装的软件包（识别并处理依赖关系的改变）

### 4. 查询 软件包

dpkg -l                                                  // 列出已安装的所有软件包

apt-cache search PackageName         // 搜索软件包
 apt-cache show PackageName            // 获取软件包的相关信息, 如说明、大小、版本等

apt-cache depends PackageName       // 查看该软件包需要哪些依赖包
 apt-cache rdepends PackageName      // 查看该软件包被哪些包依赖
 apt-get check                                         // 检查是否有损坏的依赖

### 5. apt-get --help

执行命令: apt-get --help，输出:

apt 1.0.1ubuntu2，用于 amd64 构架，编译于 Dec  8 2016 16:23:38
 用法： apt-get [选项] 命令
 　　 apt-get [选项] install|remove 软件包1 [软件包2 ...]
 　　 apt-get [选项] source 软件包1 [软件包2 ...]

apt-get 是一个用于下载和安装软件包的简易命令行界面。
 最常用命令是 update 和 install。

### 命令：

update - 取回更新的软件包列表信息
 upgrade - 进行一次升级
 install - 安装新的软件包(注：软件包名称是 libc6 而非 libc6.deb)
 remove - 卸载软件包
 autoremove - 卸载所有自动安装且不再使用的软件包
 purge - 卸载并清除软件包的配置
 source - 下载源码包文件
 build-dep - 为源码包配置所需的编译依赖关系
 dist-upgrade - 发布版升级，见 apt-get(8)
 dselect-upgrade - 根据 dselect 的选择来进行升级
 clean - 删除所有已下载的包文件
 autoclean - 删除已下载的旧包文件
 check - 核对以确认系统的依赖关系的完整性
 changelog - 下载指定软件包，并显示其changelog
 download - 下载指定的二进制包到当前目录

### 选项：

-h  本帮助文档。
 -q  让输出可作为日志 - 不显示进度
 -qq 除了错误外，什么都不输出
 -d  仅仅下载 - 【不】安装或解开包文件
 -s  不作实际操作。只是依次模拟执行命令
 -y  对所有询问都回答是(Yes)，同时不作任何提示
 -f  当出现破损的依赖关系时，程序将尝试修正系统
 -m  当有包文件无法找到时，程序仍尝试继续执行
 -u  显示已升级的软件包列表
 -b  在下载完源码包后，编译生成相应的软件包
 -V  显示详尽的版本号
 -c=? 读取指定配置文件
 -o=? 设置任意指定的配置选项，例如 -o dir::cache=/tmp
 请查阅 apt-get(8)、sources.list(5) 和 apt.conf(5)的参考手册
 以获取更多信息和选项。

## Centos7 yum 源

```bash
#备份
sudo cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak

sudo cat > /etc/yum.repos.d/CentOS-Base.repo <<EOF 
#https://mirrors.tuna.tsinghua.edu.cn/help/centos/

# CentOS-Base.repo
#
# The mirror system uses the connecting IP address of the client and the
# update status of each mirror to pick mirrors that are updated to and
# geographically close to the client.  You should use this for CentOS updates
# unless you are manually picking other mirrors.
#
# If the mirrorlist= does not work for you, as a fall back you can try the
# remarked out baseurl= line instead.
#
#


[base]
name=CentOS-$releasever - Base
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos/$releasever/os/$basearch/
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-7

#released updates
[updates]
name=CentOS-$releasever - Updates
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos/$releasever/updates/$basearch/
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-7



#additional packages that may be useful
[extras]
name=CentOS-$releasever - Extras
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos/$releasever/extras/$basearch/
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-7



#additional packages that extend functionality of existing packages
[centosplus]
name=CentOS-$releasever - Plus
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos/$releasever/centosplus/$basearch/
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-7
EOF

```

## Centos8 yum 源

```bash
#备份
sudo cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak

sudo cat > /etc/yum.repos.d/CentOS-Base.repo <<EOF 
#https://mirrors.tuna.tsinghua.edu.cn/help/centos/
# CentOS-Base.repo
#
# The mirror system uses the connecting IP address of the client and the
# update status of each mirror to pick mirrors that are updated to and
# geographically close to the client.  You should use this for CentOS updates
# unless you are manually picking other mirrors.
#
# If the mirrorlist= does not work for you, as a fall back you can try the
# remarked out baseurl= line instead.
#
#



[BaseOS]
name=CentOS-$releasever - Base
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos/$releasever/BaseOS/$basearch/os/
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=BaseOS&infra=$infra
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial

[AppStream]
name=CentOS-$releasever - AppStream
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos/$releasever/AppStream/$basearch/os/
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=AppStream&infra=$infra
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial

[PowerTools]
name=CentOS-$releasever - PowerTools
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos/$releasever/PowerTools/$basearch/os/
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=PowerTools&infra=$infra
enabled=0
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial


#additional packages that may be useful
[extras]
name=CentOS-$releasever - Extras
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos/$releasever/extras/$basearch/os/
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial



#additional packages that extend functionality of existing packages
[centosplus]
name=CentOS-$releasever - Plus
baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos/$releasever/centosplus/$basearch/os/
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial


EOF
```

### yum简介

> 对于熟悉Centos的小伙伴都应该很熟悉。

- Yum（全称为 Yellow dog Updater, Modified）是一个在Fedora和RedHat以及CentOS中的[Shell](https://links.jianshu.com/go?to=https%3A%2F%2Fbaike.baidu.com%2Fitem%2FShell)前端软件包管理器。基于[RPM](https://links.jianshu.com/go?to=https%3A%2F%2Fbaike.baidu.com%2Fitem%2FRPM)包管理，能够从指定的服务器自动下载RPM包并且安装，可以自动处理依赖性关系，并且一次安装所有依赖的软件包，无须繁琐地一次次下载、安装。---[百度百科](https://links.jianshu.com/go?to=https%3A%2F%2Fbaike.baidu.com%2Fitem%2Fyum%2F2835771%3Ffr%3Daladdin)

### 命令解析

- 格式

```bash
yum [command] [package] -y|q
```

> options

- install

```bash
# 安装nginx软件包
yum install nginx
```

- search

```bash
#  搜索软件包
yum search nginx
```

- list

```php
# 显示指定安装包安装软件详情
yum list nginx
# 显示所有已安装以及可以安装的软件包
yum list
# 显示所有软件包
yum list all
```

- remove



```csharp
# 移除软件包
yum remove nginx
```

- earse



```bash
# 移除软件包
yum earse nginx
```

- update



```bash
# 升级软件包
yum update nginx
```

- check-update



```bash
# 检查可以更新的软件
yum check-update
```

- info



```bash
# 显示安装包信息
yum info nginx
```

- provides



```bash
# 列出软件包提供哪些文件
yum provides
# 列出哪些软件包提供nginx
yum provides */nginx
```

- grouplist



```bash
# 列出可以用groupinstall安装的组
yum grouplist
```

- groupInstall



```bash
# 安装中文组支持
yum groupinstall "Chinese Support"
```

- groupremove



```csharp
# 移除中文组支持
yum group remove "Chinese Support"
```

- deposit



```undefined
* 查看nginx依赖
yum deplist nginx
```

- clear



```bash
# 清除缓存目录下的软件包
yum clear nginx
# 清除缓存目录下的header
yum clean header
# 清除所有的缓存
yum clean all
```

- repolist



```bash
# 查看软件仓库
yum repolist
```

------

### 搭建yum仓库

> 关于yum仓库

- 所在位置

  ![img](https:////upload-images.jianshu.io/upload_images/7819706-1f04b1f7b48a726a.png?imageMogr2/auto-orient/strip|imageView2/2/w/639/format/webp)

  仓库所在位置

```ruby
[base]
name=CentOS-$releasever - Base
mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/os/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
```

> 本地yum仓库

```bash
# 下载对应的镜像文件
# 挂载到/mnt
mount -o loop /dev/cdrom /mnt #光盘 
mount -o loop -t iso9660 /home/sunky/mydisk.iso /mnt/vcdrom  #ios镜像文件
# 创建文件
vim /etc/yum.repo.d test.repo
[test]
name="test"
baseurl="file:///mnt"
enable=1
gpgcheck=0
```

> 远端http仓库

```undefined
和上雷同，略
```

> 远端ftp仓库

```undefined
和上雷同，略
```

