#!/bin/bash
echo "拉取镜像nginx"
docker pull nginx
# 启动工作目录
echo "启动工作目录"
docker run   --name nginx \
      -v ~/nginx/html:/usr/share/nginx/html \
      -d -p 80:80 -p 443:443 \
	  nginx
# 拷贝工作目录	
echo "拷贝工作目录"
sudo mkdir ~/nginx
sudo docker cp nginx:/etc/nginx  ~/nginx/luna-nginx
# 停止
docker stop nginx
# 移除
docker rm nginx
# 运行
echo "运行mysql -p 80:80 -p 443:443 "
docker run -d \
      --name nginx \
      -p 80:80 -p 443:443 \
      --restart always \
      -v ~/nginx/html:/usr/share/nginx/html \
      -v ~/nginx/luna-nginx:/etc/nginx  \
      -v ~/nginx/log:/var/log/nginx \
        nginx 

cp -r html ~/nginx
cp  default-http-server.conf ~/nginx/luna-ngin/conf.d/
docker exec -it nginx service nginx reload 