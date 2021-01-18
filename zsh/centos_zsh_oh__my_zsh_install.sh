#!/bin/bash
echo "安装zsh"
sudo yum install -y zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 主题更改
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

# 默认主题
#sed -i 's/ZSH_THEME="agnoster"/ZSH_THEME="robbyrussell"/g' ~/.zshrc

# 安装字体 不然会乱码
git clone https://gitclone.com/github.com/abertsch/Menlo-for-Powerline.git 
 
cd Menlo-for-Powerline
 
sudo mv "Menlo for Powerline.ttf" /usr/share/fonts/ 
 
sudo fc-cache -vf /usr/share/fonts/

mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d /