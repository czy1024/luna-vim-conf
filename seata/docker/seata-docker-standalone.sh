#!/bin/bash
echo "拉取镜像seataio/seata-server"
docker pull seataio/seata-server

docker run -d --name seata -p 8091:8091 seataio/seata-server:latest
sudo mkdir ~/seata
docker cp seata:/seata-server  ~/seata

# 备份
cp ~/seata/resources/file.conf ~/seata/resources/file.conf.back
cp ~/seata/resources/registry.conf ~/seata/resources/registry.conf.back
# 修改持久化类型为db存储
sed -i 's/mode = "file"/mode = "db"/g' ~/seata/resources/file.conf
sed -i 's/127.0.0.1:3306/f.xicc.cc:23405/g' ~/seata/resources/file.conf
sed -i 's/user = "mysql"/user = "root"/g' ~/seata/resources/file.conf
sed -i 's/password = "mysql"/password = "root"/g' ~/seata/resources/file.conf

# 修改注册中心和配置中心为nacos
sed -i 's/type = "file"/type = "nacos"/g' ~/seata/resources/registry.conf
sed -i 's/serverAddr = "127.0.0.1:8848"/serverAddr = "f.xicc.cc:23403"/g' ~/seata/resources/registry.conf

# 停止删除容器
docker stop seata

docker rm seata

# 启动容器
docker run --name seata --restart=always \
        -p 23414:23414 -d \
        -e SEATA_PORT=23414 \
        -e SEATA_IP=212.64.78.154 \
        -v ~/seata:/seata-server \
        seataio/seata-server:latest
