#!/bin/bash
echo "拉取镜像elasticsearch:7.6.2"
docker pull elasticsearch:7.6.2
# 启动工作目录
echo "启动工作目录"

echo "拷贝工作目录"
sudo mkdir ~/elasticsearch
sudo cp elasticsearch.yml  ~/elasticsearch/config

docker run -d \
   --name es \
   -e ES_JAVA_OPTS="-Xms256m -Xmx256m"  \
   -p 9200:9200 \
   -p 9300:9300 \
   elasticsearch:7.6.2
# 拷贝工作目录	

sudo docker cp es:/usr/share/elasticsearch/config ~/elasticsearch/config
sudo mkdir ~/elasticsearch/data
sudo chmod 777 ~/elasticsearch/data

# 停止
docker stop elasticsearch
# 移除
docker rm elasticsearch
# 运行
echo "运行elasticsearch 9200:9200 9300:9300"
sudo docker run -d \
   --restart=always \
   --privileged=true \
   --name es \
   -e ES_JAVA_OPTS="-Xms256m -Xmx256m" \
   -p 9200:9200 \
   -p 9300:9300 \
   -v ~/elasticsearch/config:/usr/share/elasticsearch/config/ \
   -v ~/elasticsearch/plugins:/usr/share/elasticsearch/plugins/ \
   -v ~/elasticsearch/data:/usr/share/elasticsearch/data/ \
   -v ~/elasticsearch/logs:/log \
   -e TZ='Asia/Shanghai' \
   -e LANG="en_US.UTF-8" \
   elasticsearch:7.6.2

#IK分词器安装

#IK分词器下载地址https://github.com/medcl/elasticsearch-analysis-ik/releases

#将ik分词器上传到服务器上，然后解压，并改名字为ik

sudo mkdir  ~/elasticsearch

sudo mkdir ~/elasticsearch/plugins

sudo mkdir ~/elasticsearch/plugins/ik

sudo cp elasticsearch-analysis-ik-7.6.2.zip ~/elasticsearch/plugins/ik

cd ~/elasticsearch/plugins/ik

sudo unzip elasticsearch-analysis-ik-7.6.2.zip 

将ik目录拷贝到docker容器的plugins目录下

#unzip 找不到:
#apt-get zip unzip

docker restart es





    