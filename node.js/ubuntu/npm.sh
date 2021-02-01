#!/bin/bash
sudo apt-get install npm -y
echo "npm 配置淘宝镜像"
sudo npm config set registry https://registry.npm.taobao.org

# Install Node.js
curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n
sudo bash n lts

mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
npm install -g n