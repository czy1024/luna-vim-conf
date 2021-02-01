#!/bin/bash
echo "拉取镜像elasticsearch:7.6.2"
docker pull elasticsearch:7.6.2
# 启动工作目录 
echo "启动工作目录"

docker run -d \
   --name es \
   -e ES_JAVA_OPTS="-Xms256m -Xmx256m"  \
   -p 9200:9200 \
   -p 9300:9300 \
   elasticsearch:7.6.2
# 拷贝工作目录	
echo "拷贝工作目录"
mkdir ~/elasticsearch
sudo docker cp es:/usr/share/elasticsearch/config ~/elasticsearch/

# 修改配置文件
sudo cp ~/elasticsearch/config/elasticsearch.yml ~/elasticsearch/config/elasticsearch.yml.bak


sudo cat > ~/elasticsearch/config/elasticsearch.yml <<EOF 
# 加入跨域配置
cluster.name: "docker-cluster"
network.host: 0.0.0.0
path.logs: /log
# custom config
node.name: "node-1"
discovery.seed_hosts: ["127.0.0.1", "[::1]"]
cluster.initial_master_nodes: ["node-1"]
# 开启跨域访问支持，默认为false
http.cors.enabled: true
# 跨域访问允许的域名地址，(允许所有域名)以上使用正则
http.cors.allow-origin: /.*/ 
http.cors.allow-headers: Authorization,X-Requested-With,Content-Length,Content-Type
xpack.security.enabled: true
xpack.security.transport.ssl.enabled: true

# elasticsearch-setup-passwords interactive
EOF

# 新建数据目录
sudo mkdir ~/elasticsearch/data
sudo chmod 777 ~/elasticsearch/data

# JVM 配置
sed -i 's/-Xms1g/-Xms256m/g' ~/elasticsearch/config/jvm.options
sed -i 's/-Xmx1g/-Xmx256m/g' ~/elasticsearch/config/jvm.options

sudo cat > /etc/sysctl.conf << EOF 
vm.max_map_count=655360
EOF
sudo sysctl -p 
# 停止
docker stop es
# 移除
docker rm es
# 运行   
echo "运行elasticsearch 9200:9200 9300:9300"
sudo docker run -d \
   --privileged=true \
   --name es \
   --restart=always \
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
sudo mkdir -p ~/elasticsearch/plugins/ik

cd ~/elasticsearch
# 下载
sudo curl -LJO https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.6.2/elasticsearch-analysis-ik-7.6.2.zip
sudo cp ~/elasticsearch/elasticsearch-analysis-ik-7.6.2.zip ~/elasticsearch/plugins/ik

apt-get zip unzip 
yum install unzip
# 解压
sudo unzip ~/elasticsearch/plugins/ik/elasticsearch-analysis-ik-7.6.2.zip  -d  ~/elasticsearch/plugins/ik/
rm -rf  ~/elasticsearch/elasticsearch-analysis-ik-7.6.2.zip
# 将ik目录拷贝到docker容器的plugins目录下

#unzip 找不到:
#apt-get zip unzip | yum install unzip
docker restart es

# 设置初始密码
docker exec -it es elasticsearch-setup-passwords interactive


    