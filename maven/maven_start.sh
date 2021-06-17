#!/bin/bash

# 删除升级回退文件
 find . -name 'pom.xml.*' -type f -print -exec rm -rf {} \;

# 升级版本
mvn versions:set -DnewVersion=2.2.2-RELEASE

# 打包 
mvn clean package -Dmaven.test.skip=true

# 清楚未下载完成的包
find . -name "*lastUpdated" | xargs rm -fr