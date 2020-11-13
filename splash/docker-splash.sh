#!/bin/bash
echo "拉取镜像splash"
docker pull splash

docker run -d \
 --name splash \
 --restart always \
 -p 8050:8050 \
 scrapinghub/splash




