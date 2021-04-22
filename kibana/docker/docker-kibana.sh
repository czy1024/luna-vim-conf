#!/bin/bash
echo "拉取镜像kibana:7.6.2"
docker pull kibana:7.6.2
# 启动工作目录
docker run --name kibana \
	-p 5601:5601 \
	--link es:es \
	-d kibana:7.6.2

-d kibana:7.6.2
# 拷贝工作目录	
echo "拷贝工作目录"
sudo mkdir ~/kibana
sudo docker cp kibana:/usr/share/kibana/config  ~/kibana/

echo "输入elasticsearch主机地址 =>>>>>>>"
read hostname
echo -n '
#
# ** THIS IS AN AUTO-GENERATED FILE **
#

# Default Kibana configuration for docker target
server.name: kibana
server.host: "0.0.0.0"
elasticsearch.hosts: [ "http://'$hostname':9200" ]
xpack.monitoring.ui.container.elasticsearch.enabled: true
elasticsearch.username: "elastic"
elasticsearch.password: "czy1024"
i18n.locale: "zh-CN"
'> ~/kibana/config/kibana.yml
#sudo cat > ~/kibana/config/kibana.yml <<EOF  
#EOF

docker stop kibana
docker rm kibana

sudo docker run -p 5601:5601 --name kibana  \
	--log-driver json-file --log-opt max-size=100m --log-opt max-file=2 \
	--link es:es \
	--restart always \
	-v ~/kibana/config:/usr/share/kibana/config \
	-d kibana:7.6.2


	