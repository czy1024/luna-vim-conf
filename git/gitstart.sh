#!/bin/bash
sudo apt-get instal git

echo "配置用户"

git config --global user.name "luna"
git config --global user.email iszychen@gmail.com

git config --global http.proxy http://127.0.0.1:10822

git config --global https.proxy https://127.0.0.1:10822

git config --global --unset http.proxy

git config --global --unset https.proxy

# git config --global http.sslVerify "false"


  git config pull.rebase false  # 合并（缺省策略）
  git config pull.rebase true   # 变基
  git config pull.ff only       # 仅快进

# 查看配置列表
git config --list