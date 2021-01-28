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

# 开机webdav
sudo cat >> ~/httpd/conf/extra/httpd-dav.conf <<EOF
<Directory "/home/luna">
    Dav On
</Directory>
EOF

# 认证配置
sudo cat >> ~/httpd/home/luna/.htaccess <<EOF
AuthName "password, sir!"
AuthType basic
AuthUserFile ~/httpd/home/luna/.htppasswd
require valid-user
EOF

# 密码文件
sudo cat >> ~/httpd/home/luna/.htppasswd <<EOF
luna:$apr1$oyDGqCbQ$KGD91VGYzTlYJcCeVEd6Q1
EOF

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
   -v ~/httpd/home/luna:/home/luna \
   -v ~/httpd/root:/usr/local/apache2/root \
   -v ~/httpd/conf:/usr/local/apache2/conf \
   -v ~/httpd/logs:/usr/local/apache2/logs \
   -d httpd



