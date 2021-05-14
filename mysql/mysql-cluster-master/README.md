docker-compose构建mysql主从复制集群 
========================
docker-compose构建 mysql 主从复制(读写分离)集群  
MySQL master-slave replication with using Docker. 

## 运行
```bash
git clone https://github.com/docker-box/mysql-cluster.git
cd mysql-cluster
./build.sh
```
> 可以在`build.sh`内自定义对应参数  

> 提示: 运行前需要确保安装了docker和docker-compose,具体安装方法请参考官网  

> 如果想手动安装, 则可以按照`build.sh`内的命令来手动执行即可  

## 测试看看效果
1. 给主库创建一个表, 并添加两条数据
```
docker exec mysql_master sh -c "export MYSQL_PWD=111; mysql -u root mydb -e 'create table code(code int); insert into code values (100), (200)'"
```
2. 查看两个从库是否同步了该表以及数据
```
docker exec mysql_slave sh -c "export MYSQL_PWD=111; mysql -u root mydb -e 'select * from code \G'"
```
```
docker exec mysql_slave2 sh -c "export MYSQL_PWD=111; mysql -u root mydb -e 'select * from code \G'"
```
> 如果前边的安装正确的话, 就可以看到第一步插入的两条数据了  

## 相关命令

#### 查看docker-compose运行日志
```
docker-compose logs
```

#### 查看运行的docker容器
```
docker-compose ps
```

#### 查看主库运行状态

```
docker exec mysql_master sh -c 'mysql -u root -p111 -e "SHOW MASTER STATUS \G"'
```

#### 查看从库运行状态
```
docker exec mysql_slave sh -c 'mysql -u root -p111 -e "SHOW SLAVE STATUS \G"'
```
```
docker exec mysql_slave2 sh -c 'mysql -u root -p111 -e "SHOW SLAVE STATUS \G"'
```

#### 进入主库

```
docker exec -it mysql_master bash
```

#### 进入从库

```
docker exec -it mysql_slave bash
```

```
docker exec -it mysql_slave2 bash
```
