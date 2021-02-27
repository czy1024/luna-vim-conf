#! /bin/bash
# 备份原文件
cp /etc/apt/sources.list /etc/apt/sources.list.copy

sudo cat > /etc/apt/sources.list <<EOF 

deb https://mirrors.aliyun.com/kali kali-rolling main non-free contrib
deb-src https://mirrors.aliyun.com/kali kali-rolling main non-free contrib

EOF

# 更新源
sudo apt-get update
sudo apt-get install redis zsh git vim openssh-server wegt net-tools curl -y
echo "git 配置用户邮箱:"
echo -n "please enter the username:"
read username
git config --global user.name "$username"
echo -n "please enter the email:"
read email
git config --global user.email "$email"
git config http.postBuffer 524288000 # 修改下载大包限制

# 查看配置
git config --list

ssh-keygen -t rsa -C "'"$email"'"
# 默认生成的key在/home/.ssh/id_rsa.pub（可由vim打开复制）
#root用户：/root/.ssh/id_rsa.pub
#普通用户：/home/%USER%/.ssh/id_rsa.pub
echo "ssh key生成====>root用户：/root/.ssh/id_rsa.pub 普通用户：/home/%USER%/.ssh/id_rsa.pub"

echo "安装ssh"
sudo apt-get install openssh-server -y
sudo /etc/init.d/ssh restart
# vim /etc/ssh/sshd_config
echo "开启root登陆"
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sudo /etc/init.d/ssh restart

#scp root@%IP%:/tmp/id_rsa ~/Documents/id_rsa 
#客户端执行: scp ~/.ssh/id_rsa.pub  root@172.16.22.2:/tmp/id_rsa.pub 
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
sudo apt-get install nscd -y
sudo systemctl restart nscd 