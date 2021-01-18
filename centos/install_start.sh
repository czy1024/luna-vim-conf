#! /bin/bash

# 关闭防火墙
systemctl stop firewalld

# 更新yum源
# 备份现有源
mv /etc/yum.repos.d /etc/yum.repos.d.backup
#设置新的yum目录
mkdir /etc/yum.repos.d
# 安装wget
yum install -y wget
# 下载配置。此处一定要注意，很多教程都是CentOS 7的教程，所以贴的CentOS 7的下载源，对于CentOS 8一定要改为CentOS 8的下载源，否则还是不行。
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-8.repo
# 清除文件并重建元数据缓存
yum clean all
yum makecache
# 最后更新软件包，稍等软件安装包安装完就可以了

yum update -y

# 安装软件
yum install redis openssh-server git nscd zsh -y

# redis密码配置
cp /etc/redis.conf /etc/redis.conf.bak
echo -n "please enter the password:"
read passwd
echo "your password is =>>>>> $passwd please remember"
sed -i 's/# requirepass foobared/requirepass '"$passwd"'/g' /etc/redis.conf
# 取消端口绑定
sed -i 's/bind 127.0.0.1/#bind 127.0.0.1/g' /etc/redis.conf
sed -i 's/protected-mode yes/protected-mode no/g' /etc/redis.conf
# redis 守护进程 在该模式下，redis会在后台运行，（即使在终端启动后再断开终端连接，也会切换到后台运行）并将进程pid号写入至redis.conf选项pidfile设置的文件中，此时redis将一直运行，除非手动kill该进程
sed -i 's/daemonize no/daemonize yes/g' /etc/redis.conf

echo "git 配置用户邮箱:"
echo -n "please enter the username:"
read username
git config --global user.name "$username"
echo -n "please enter the email:"
read email
git config --global user.email "$email"
# 查看配置
git config --list

ssh-keygen -t rsa -C "'"$email"'"
# 默认生成的key在/home/.ssh/id_rsa.pub（可由vim打开复制）
#root用户：/root/.ssh/id_rsa.pub
#普通用户：/home/%USER%/.ssh/id_rsa.pub
echo "ssh key生成====>root用户：/root/.ssh/id_rsa.pub 普通用户：/home/%USER%/.ssh/id_rsa.pub"


# ssh配置
# vim /etc/ssh/sshd_config
echo "开启root登陆"
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
service sshd restart
#scp root@%IP%:/tmp/id_rsa ~/Documents/id_rsa 
#客户端执行: scp ~/.ssh/id_rsa.pub  root@192.168.31.92:/tmp/id_rsa.pub 
#服务端执行: cat /tmp/id_rsa.pub >> ~/.ssh/authorized_keys

sudo cat >> /etc/hosts <<EOF 
# Github Hosts
# update: 2020-10-26

140.82.114.4 github.com
140.82.114.9 nodeload.github.com
140.82.114.5 api.github.com
140.82.112.18 training.github.com
140.82.113.10 codeload.github.com

185.199.108.153 assets-cdn.github.com
185.199.108.153 documentcloud.github.com
185.199.108.154 help.github.com
185.199.108.153 githubstatus.com

199.232.69.194 github.global.ssl.fastly.net
199.232.68.133 raw.github.com
199.232.68.133 raw.githubusercontent.com
199.232.68.133 cloud.githubusercontent.com
199.232.68.133 gist.githubusercontent.com
199.232.68.133 marketplace-screenshots.githubusercontent.com
199.232.68.133 repository-images.githubusercontent.com
199.232.68.133 user-images.githubusercontent.com
199.232.68.133 desktop.githubusercontent.com

199.232.68.133 avatars0.githubusercontent.com
199.232.68.133 avatars1.githubusercontent.com
199.232.68.133 avatars2.githubusercontent.com
199.232.68.133 avatars3.githubusercontent.com
199.232.68.133 avatars4.githubusercontent.com
199.232.68.133 avatars5.githubusercontent.com
199.232.68.133 avatars6.githubusercontent.com
199.232.68.133 avatars7.githubusercontent.com
199.232.68.133 avatars8.githubusercontent.com
EOF

# 刷新host
echo "安装nscd"
service restart nscd 

yum install npm -y
echo "npm 配置淘宝镜像"
npm config set registry https://registry.npm.taobao.org

echo "安装python3"
yum install python3 -y

echo "安装java"
yum install openjdk-8-jre-headless -y