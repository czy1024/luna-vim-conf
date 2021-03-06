#!/bin/bash
sudo apt-get instal git

echo "配置用户"

git config user.name "luna"
git config user.email iszychen@gmail.com

git config --global user.name "luna"
git config --global user.email iszychen@gmail.com

git config --global http.proxy http://127.0.0.1:7890

git config --global https.proxy https://127.0.0.1:7890

git config --global --unset http.proxy

git config --global --unset https.proxy

# git config --global http.sslVerify "false"

git clone --depth 1 url

git config http.postBuffer 524288000 # 修改下载大包限制

git config pull.rebase false  # 合并（缺省策略）

git config pull.rebase true   # 变基

git config pull.ff only       # 仅快进

# 指定分支clone
git clone -b [URL] 

# 查看配置列表
git config --list

git config --global http.proxy http://192.168.1.100:10822
git config --global https.proxy http://192.168.1.100:10822

# 修改地址
git remote set-url origin xxx

git clone https://gitclone.com/github.com/tendermint/tendermint.git

git config --global url."https://gitclone.com/".insteadOf https://

git verify-pack -v .git/objects/pack/pack-*.idx | sort -k 3 -g | tail -10

git rev-list --objects --all | grep 9000f707aab19df57b5bafe9f2d4478cb07ca0b1

git filter-branch -f --prune-empty --index-filter 'git rm -rf --cached --ignore-unmatch proxy/v2ray-linux-64.zip' --tag-name-filter cat -- --all

​​git filter-branch -f --prune-empty --index-filter 'git rm -rf --cached --ignore-unmatch cute/chfs' -- <commit_id>​

git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch *.mp3' --prune-empty --tag-name-filter cat -- --all