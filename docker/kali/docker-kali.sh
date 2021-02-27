#!/bin/bash
# 卸载旧版本
sudo apt  remove docker \
           docker-client \
           docker-client-latest \
           docker-common \
           docker-latest \
           docker-latest-logrotate \
           docker-logrotate \
           docker-selinux \
           docker-engine-selinux \
           docker-engine
sudo rm -rvf /var/lib/docker
#前提是先执行apt-get update  apt-get upgrade
sudo apt-get update
#如果还出现这个问题 依次执行下面的步骤：

#安装https协议、CA证书、dirmngr
apt-get update
 
apt-get install -y apt-transport-https ca-certificates
 
apt-get install dirmngr -y

# 添加GPG密钥并添加更新源

curl -fsSL https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian/gpg | sudo apt-key add -

echo 'deb https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/debian/ buster stable' | sudo tee /etc/apt/sources.list.d/docker.list
#如果还是不行 就再跑一次update然后执行安装命令。
apt-get update

apt install docker-ce -y
# 配置镜像加速器
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": [
    "https://kfwkfulq.mirror.aliyuncs.com",
    "https://2lqq34jg.mirror.aliyuncs.com",
    "https://pee6w651.mirror.aliyuncs.com",
    "https://registry.docker-cn.com",
    "http://hub-mirror.c.163.com"
  ],
"dns": ["8.8.8.8","8.8.4.4"]
}
EOF

# 启动docker引擎并设置开机启动
sudo systemctl start docker
sudo systemctl enable docker

# 配置当前用户对docker的执行权限
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo systemctl restart docker

# docker-compose 
apt install docker-compose
docker --version
docker-compose --version