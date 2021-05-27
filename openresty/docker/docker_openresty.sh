#!/bin/bash
#1.拉取镜像

docker pull openresty/openresty
#2.启动openresty

docker run -it --name openresty -p 82:80 openresty/openresty
#3.复制配置文件删除 openresty

### 创建配置文件夹

mkdir -p ~/openresty/conf

# 复制配置文件
docker cp openresty:/usr/local/openresty/nginx ~/openresty/nginx
docker cp openresty:/etc/nginx/conf.d ~/openresty/nginx/conf.d


sudo cat > ~/openresty/nginx/html/index.html <<EOF

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

### 删除 openresty 容器
docker stop openresty
docker rm openresty

mkdir -p  ~/openresty/root/luna

### 配置启动 openresty conf.d -> nginx 配置目录,由 /usr/local/openresty/nginx/conf/nginx.conf 引入
docker run -it -d -p 80:80 -p 443:443 -p 82:82 \
--name openresty --restart always --privileged=true \
-v ~/openresty/nginx:/usr/local/openresty/nginx \
-v ~/openresty/nginx/conf.d:/etc/nginx/conf.d \
-v ~/openresty/root/luna:/root/luna \
-v /etc/localtime:/etc/localtime \
openresty/openresty

# docker exec -it openresty nginx -s reload