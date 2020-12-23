echo "安装zsh"
sudo apt install -y zsh

# 证书类问题
apt-get install ca-certificates
# 直接脚本安装
# sh -c "$(curl  -fsSL http://lunacute.vaiwan.com/chfs/shared/Documents/luna-linux-conf/zsh/install.sh)"

# sh -c "$(curl  -fsSL  http://wincute.vaiwan.com/chfs/shared/luna/luna-linux-conf/zsh/install.sh)"

# sh -c "$(curl -x 127.0.0.1:10822 -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# sh -c "$(wget -O- http://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 手动安装
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc	
chsh -s /bin/zsh 


# 安装自动提示插件
curl  -LJO  http://mimosa-pudica.net/src/incr-0.2.zsh
mkdir ~/.oh-my-zsh/plugins/incr
mv incr-0.2.zsh ~/.oh-my-zsh/plugins/incr
echo 'source ~/.oh-my-zsh/plugins/incr/incr*.zsh' >> ~/.zshrc
sudo source ~/.zshrc