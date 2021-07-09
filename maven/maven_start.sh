#!/bin/bash

# 删除升级回退文件
 find . -name 'pom.xml.*' -type f -print -exec rm -rf {} \;

# 升级版本
mvn versions:set -DnewVersion=1.0.4-SNAPSHOT

# 打包 
mvn clean package -Dmaven.test.skip=true

# 清楚未下载完成的包
find . -name "*lastUpdated" | xargs rm -fr

mvn archetype:generate -DarchetypeGroupId=com.vdian.vclub -DarchetypeArtifactId=example-archetype -DarchetypeVersion=1.0.0-SNAPSHOT -DgroupId=com.vdian.vclub -DartifactId=luna-thor -Dversion=1.0.0-SNAPSHOT
