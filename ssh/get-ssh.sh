#!/bin/bash

apt-get install openssh-server
sudo cp sshd_config /etc/ssh/sshd_config
#ssh 配置
ssh-keygen 
#生成key
#cd ~/.ssh
# 查看密钥对是否生成
cd ~
# 将公钥放置在 authorized_keys 中
sudo cat .ssh/id_rsa.pub >> .ssh/authorized_keys
# 设置权限
sudo chmod 600 .ssh/authorized_keys
sudo chmod 700 .ssh
cat .ssh/id_rsa
sudo service sshd restart