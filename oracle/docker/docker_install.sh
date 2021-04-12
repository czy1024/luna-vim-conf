#!/bin/bash
docke pull alexeiled/docker-oracle-xe-11g

# 启动
docker run -d --name oracle \
     --restart=always \
     -v /oracle_data:/data/oracle_data \
      -p 15212:22 -p 15211:1521 \
      -e ORACLE_ALLOW_REMOTE=true alexeiled/docker-oracle-xe-11g:latest

#连接类型：Basic
#主机地址：ip
#端口：15211
#DIS：xe
#用户名：system
#密码：oracle

