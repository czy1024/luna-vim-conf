#!/bin/bash
echo "拉取镜像kibana:7.6.2"
docker pull kibana:7.6.2
# 启动工作目录

echo "拷贝工作目录"
sudo mkdir ~/kibana

docker run --name kibana \
	-p 5601:5601 \
	--link es:es \
	-d kibana:7.6.2
# 拷贝工作目录	

sudo docker cp kibana:/usr/share/kibana/config  ~/kibana/

sudo cat > ~/kibana/kibana.yml <<EOF 
#
# ** THIS IS AN AUTO-GENERATED FILE **
#

# Default Kibana configuration for docker target
server.name: kibana
server.host: "0"
elasticsearch.hosts: [ "http://127.0.0.1:9200" ]
xpack.monitoring.ui.container.elasticsearch.enabled: true
elasticsearch.username: "elastic"
elasticsearch.password: "czy1024"
i18n.locale: "zh-CN"
EOF

sudo cp ~/kibana/kibana.yml ~/kibana/config/

docker stop kibana

docker rm kibana

sudo docker run --name kibana -p 5601:5601 \
	--link es:es \
	--restart always \
	-v ~/kibana/config:/usr/share/kibana/config \
	-d kibana:7.6.2

