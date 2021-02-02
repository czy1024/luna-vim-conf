docker inspect NAMES # 查看容器所有状态信息；

docker inspect --format='{{.NetworkSettings.IPAddress}}' ID/NAMES # 查看 容器ip 地址

docker inspect --format '{{.Name}} {{.State.Running}}' NAMES # 容器运行状态


docker ps -aq # 列出所有的容器 ID

docker stop $(docker ps -aq) # 停止所有的容器

docker rm $(docker ps -aq) # 删除所有的容器

docker rmi $(docker images -q) # 删除所有的镜像

docker image prune --force --all或者docker image prune -f -a #  删除所有不使用的镜像

docker container prune #  删除所有停止的容器