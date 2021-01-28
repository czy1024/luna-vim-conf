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
sudo mkdir -p ~/httpd/home/luna
sudo mkdir ~/httpd/root

# 上传文件临时目录
touch ~/httpd/root/DavLock
chmod 777 ~/httpd/root/DavLock

# 上传文件目录
sudo mkdir ~/httpd/root/uploads
chmod 777  ~/httpd/root/uploads
chmod 777  ~/httpd/home/luna

sudo docker cp  httpd:/usr/local/apache2/conf ~/httpd/conf
cd ~/
wget http://cute.vaiwan.com/chfs/shared/luna-linux-conf/httpd/docker/httpd.conf 
mv httpd.conf ~/httpd/conf/

sudo cat >> ~/httpd/conf/httpd.conf <<EOF
<Directory "/home/luna">
	Options Indexes FollowSymLinks  
	Allowoverride AuthConfig
	#Require all granted
</Directory>
EOF

# 开启webdav
sudo cat >> ~/httpd/conf/extra/httpd-dav.conf <<EOF
<Directory "/home/luna">
    Dav On
</Directory>
EOF

# 认证配置
sudo cat > ~/httpd/home/luna/.htaccess <<EOF
AuthName "password, sir!"
AuthType basic
AuthUserFile /home/luna/.htppasswd
require valid-user
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


docker exec -it httpd htpasswd -bc /home/luna/.htppasswd luna czy1024