#!/bin/bash
echo "拉取镜像httpd"
docker pull httpd
# 启动工作目录
echo "启动工作目录"
sudo docker run \
   -p 8089:80 -p 18089:443\
   --name httpd \
	-d httpd
# 拷贝工作目录	
echo "拷贝工作目录"
sudo mkdir ~/httpd
sudo docker cp  httpd:/usr/local/apache2/conf ~/httpd/conf
# 停止
docker stop httpd
# 移除
docker rm httpd
# 运行
echo "运行mysql 8089:80  18089:443 "
sudo docker run \
   -p 8089:80 -p 18089:443 \
   --restart always \
   --name httpd \
   -v ~/httpd/root:/usr/local/apache2/root \
   -v ~/httpd/conf:/usr/local/apache2/conf \
   -v ~/httpd/logs:/usr/local/apache2/logs \
   -d httpd

sed -i 's/htdocs/root/g' ~/httpd/conf/httpd.conf
echo "更换验证"
sed -i 's/Require all granted/Allowoverride AuthConfig/g' ~/httpd/conf/httpd.conf
echo "添加验证文件"
sudo cp .htppasswd .htaccess /usr/local/apache2/root



