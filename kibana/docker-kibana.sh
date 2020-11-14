#!/bin/bash
echo "拉取镜像kibana:7.6.2"
docker pull kibana:7.6.2
# 启动工作目录
echo "启动工作目录"

echo "拷贝工作目录"
sudo mkdir ~/kibana

docker run --name kibana \
	-p 5601:5601 \
	--link es:es \
	-d kibana:7.6.2
# 拷贝工作目录	

sudo docker cp kibana:/usr/share/kibana/config  ~/kibana/

sudo cp kibana.yml ~/kibana/config/

docker stop kibana

docker rm kibana

sudo docker run --name kibana -p 5601:5601 \
--link es:es \
--restart always \
-v ~/kibana/config:/usr/share/kibana/config \
-d kibana:7.6.2

