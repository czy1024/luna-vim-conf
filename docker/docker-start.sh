docker inspect NAMES # 查看容器所有状态信息；

docker inspect --format='{{.NetworkSettings.IPAddress}}' ID/NAMES # 查看 容器ip 地址

docker inspect --format '{{.Name}} {{.State.Running}}' NAMES # 容器运行状态


docker ps -aq # 列出所有的容器 ID

docker stop $(docker ps -aq) # 停止所有的容器

docker rm $(docker ps -aq) # 删除所有的容器

docker rmi $(docker images -q) # 删除所有的镜像

docker image prune --force --all  docker image prune -f -a #  删除所有不使用的镜像

docker container prune #  删除所有停止的容器

ExecStart=/usr/bin/dockerd --tlsverify --tlscacert=/usr/local/ca/ca.pem --tlscert=/usr/local/ca/server-cert.pem --tlskey=/usr/local/ca/server-key.pem -H tcp:#0.0.0.0:2375 -H unix:#/var/run/docker.sock

docker tag IMAGEID  REPOSITORY:TAG #镜像重命名：

docker 原容器名 新容器名 #容器重命名

docker ps # 查看所有正在运行容器 
docker stop containerId # containerId 是容器的ID 
docker ps -a # 查看所有容器 
docker ps -a -q # 查看所有容器ID 
docker stop $(docker ps -a -q) #  stop停止所有容器 
docker rm $(docker ps -a -q) #   remove删除所有容器