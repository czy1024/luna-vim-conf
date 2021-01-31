#!/bin/bash
yum install npm -y
echo "npm 配置淘宝镜像"
npm config set registry https://registry.npm.taobao.org
