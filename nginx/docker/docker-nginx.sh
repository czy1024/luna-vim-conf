#!/bin/bash
echo "拉取镜像nginx"
docker pull nginx
# 启动工作目录
echo "启动工作目录"
docker run   --name nginx \
      -d -p 80:80 -p 443:443 \
	nginx
# 拷贝工作目录	
echo "拷贝工作目录"
sudo mkdir ~/nginx
sudo docker cp nginx:/etc/nginx  ~/nginx/luna-nginx

mkdir -p ~/nginx/html

wget http://cute.vaiwan.com/chfs/shared/nginx/html/index.html -o ~/nginx/html/index.html
sudo cat > ~/nginx/html/index.html <<EOF

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=no"/>
    <title>Luna</title> 
    <style>
        html,body{
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
            background: #333;
            display: flex;
            justify-content: center;
            align-items: center
        }
        h1, a{
            color: #fafafa;
            text-align: center;
        }
    </style>
</head>
<body>
    <h1><br/><a href="https://luna_nov.gitee.io/blog/">Luna</a></h1>
</body>
</html>

EOF

# 停止
docker stop nginx
# 移除
docker rm nginx
# 运行
echo "运行mysql -p 80:80 -p 443:443 "
docker run -d  --net=example_default --ip=172.18.0.6 --name nginx --restart=always  \
      -p 80:80 -p 443:443 \
      --restart always \
      -v ~/nginx/html:/usr/share/nginx/html \
      -v ~/nginx/luna-nginx:/etc/nginx  \
      -v ~/nginx/log:/var/log/nginx \
        nginx 

# docker exec -it nginx service nginx reload 