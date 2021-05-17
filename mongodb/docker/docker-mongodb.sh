#!/bin/bash
echo "拉取镜像mongo:4.2.5"
docker pull mongo:4.2.5

docker run -itd --name mongo -p 27017:27017 mongo:4.2.5 

sudo mkdir ~/mongo

sudo docker cp mongo:/data/configdb ~/mongo
sudo docker cp mongo:/data/db ~/mongo

docker stop mongo
docker rm mongo
 
# 运行
echo "运行mysql 27017:27017 "
docker run -d -p 27017:27017 \
   --name mongo \
   --restart always \
   -v ~/mongo/configdb:/data/configdb \
   -v ~/mongo/db:/data/db \
   -v ~/mongo/log:/var/log/mongodb \
   mongo:4.2.5 --auth 


sudo docker exec -it mongo mongo admin
    
# db.createUser({ user:'admin',pwd:'czy1024',roles:[ { role:'userAdminAnyDatabase', db: 'admin'},"readWriteAnyDatabase"]});
echo "创建admin  用户admin 密码czy1024"
db.createUser({
   user: 'admin',
   pwd: 'czy1024',
   roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
});　
echo "创建库 demo_db 用户 luna 密码czy1024"
db.auth('admin', 'czy1024')
use demo_db;
db.createUser({ user: 'luna', pwd: 'czy1024', roles: [ { role: "readWrite", db: "demo_db" } ] });   
db.auth('luna', 'czy1024')
db.createUser({ user: 'admin', pwd: 'czy1024', roles: [ { role: "dbOwner", db: "luna" } ] });   

# 使用用户名luna，密码czy1024登录localhost的demo_db数据库。
mongodb://luna:czy1024@localhost/demo_db