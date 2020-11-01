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

#添加docker源、
sudo echo "deb https://download.docker.com/linux/ubuntu zesty edge" > /etc/apt/sources.list.d/docker.list

#支持解析https
apt-get install -y apt-transport-https ca-certificates curl software-properties-common

#添加GPG密钥
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#设置存储库位置
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

#执行安装命令
apt-get install -y docker-ce

#如果还是不行 就再跑一次update然后执行安装命令。我的环境就是这么装起来的。

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
