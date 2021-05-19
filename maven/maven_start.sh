#!/bin/bash

# 删除升级回退文件
 find . -name 'pom.xml.*' -type f -print -exec rm -rf {} \;

# 升级版本
mvn versions:set -DnewVersion=1.0.3-RELEASE