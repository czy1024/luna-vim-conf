#!/bin/bash
echo "安装zsh"
sudo yum install -y zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 主题更改
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

# 默认主题
#sed -i 's/ZSH_THEME="agnoster"/ZSH_THEME="robbyrussell"/g' ~/.zshrc

# 安装字体 不然会乱码
wget https_proxy=http://192.168.1.100:10822 https://raw.githubusercontent.com/powerline/powerline/develop/font/10-powerline-symbols.conf
 
wget https_proxy=http://192.168.1.100:10822 https://raw.githubusercontent.com/powerline/powerline/develop/font/PowerlineSymbols.otf
 
sudo mkdir /usr/share/fonts/OTF
 
sudo cp 10-powerline-symbols.conf /usr/share/fonts/OTF/
 
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
 
sudo mv PowerlineSymbols.otf /usr/share/fonts/OTF/