echo "安装vim git openssh-server net-tools redis"
sudo apt-get install vim net-tools redis curl -y

sudo apt-get install git -y
echo "git 配置用户邮箱: luna@iszychen@gmail.com"
git config --global user.name "luna"
git config --global user.email "iszychen@gmail.com"
ssh-keygen -t rsa -C "iszychen@gmail.com"
# 默认生成的key在/home/.ssh/id_rsa.pub（可由vim打开复制）
#root用户：/root/.ssh/id_rsa.pub
#普通用户：/home/%USER%/.ssh/id_rsa.pub
echo "ssh key生成====>root用户：/root/.ssh/id_rsa.pub 普通用户：/home/%USER%/.ssh/id_rsa.pub"

sudo apt-get install npm -y
echo "npm 配置淘宝镜像"
sudo npm config set registry https://registry.npm.taobao.org


echo "安装ssh"
sudo apt-get install openssh-server -y
sudo /etc/init.d/ssh restart
# vim /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
echo "开启root登陆"
sudo /etc/init.d/ssh restart

#scp root@%IP%:/tmp/id_rsa ~/Documents/id_rsa 
#客户端执行: scp ~/.ssh/id_rsa.pub  root@172.16.22.2:/tmp/id_rsa.pub 
#服务端执行: cat /tmp/id_rsa.pub >> ~/.ssh/authorized_keys


echo "安装nscd"
sudo systemctl restart nscd -y
sudo /etc/init.d/nscd restart

echo "添加host"
sudo apt-get install nscd
sudo cat "luna" >> /etc/hosts


sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"