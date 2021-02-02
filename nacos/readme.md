# 官方配置

### Nacos Docker 快速开始

## 操作步骤

- Clone 项目

  ```powershell
  git clone https://github.com/nacos-group/nacos-docker.git
  cd nacos-docker
  ```

- 单机模式 Derby

  ```powershell
  docker-compose -f example/standalone-derby.yaml up
  ```

- 单机模式 MySQL

如果希望使用MySQL5.7

```powershell
docker-compose -f example/standalone-mysql-5.7.yaml up
```

如果希望使用MySQL8

```powershell
docker-compose -f example/standalone-mysql-8.yaml up
```

- 集群模式

  ```powershell
  docker-compose -f example/cluster-hostname.yaml up 
  ```

- 服务注册

  ```powershell
  curl -X POST 'http://127.0.0.1:8848/nacos/v1/ns/instance?serviceName=nacos.naming.serviceName&ip=20.18.7.10&port=8080'
  ```

- 服务发现

  ```powershell
  curl -X GET 'http://127.0.0.1:8848/nacos/v1/ns/instance/list?serviceName=nacos.naming.serviceName'
  ```

- 发布配置

  ```powershell
  curl -X POST "http://127.0.0.1:8848/nacos/v1/cs/configs?dataId=nacos.cfg.dataId&group=test&content=helloWorld"
  ```

- 获取配置

  ```powershell
    curl -X GET "http://127.0.0.1:8848/nacos/v1/cs/configs?dataId=nacos.cfg.dataId&group=test"
  ```

- Nacos 控制台

  link：http://127.0.0.1:8848/nacos/

## Common property configuration

| name                          | description                     | option                                 |
| ----------------------------- | ------------------------------- | -------------------------------------- |
| MODE                          | cluster模式/standalone模式      | cluster/standalone default **cluster** |
| NACOS_SERVERS                 | nacos cluster地址               | eg. ip1,ip2,ip3                        |
| PREFER_HOST_MODE              | 是否支持hostname                | hostname/ip default **ip**             |
| NACOS_SERVER_PORT             | nacos服务器端口                 | default **8848**                       |
| NACOS_SERVER_IP               | 多网卡下的自定义nacos服务器IP   |                                        |
| SPRING_DATASOURCE_PLATFORM    | standalone 支持 mysql           | mysql / empty default empty            |
| MYSQL_MASTER_SERVICE_HOST     | mysql 主节点host                |                                        |
| MYSQL_MASTER_SERVICE_PORT     | mysql 主节点端口                | default : **3306**                     |
| MYSQL_MASTER_SERVICE_DB_NAME  | mysql 主节点数据库              |                                        |
| MYSQL_MASTER_SERVICE_USER     | 数据库用户名                    |                                        |
| MYSQL_MASTER_SERVICE_PASSWORD | 数据库密码                      |                                        |
| MYSQL_SLAVE_SERVICE_HOST      | mysql从节点host                 |                                        |
| MYSQL_SLAVE_SERVICE_PORT      | mysql从节点端口                 | default :3306                          |
| MYSQL_DATABASE_NUM            | 数据库数量                      | default :2                             |
| JVM_XMS                       | -Xms                            | default :2g                            |
| JVM_XMX                       | -Xmx                            | default :2g                            |
| JVM_XMN                       | -Xmn                            | default :1g                            |
| JVM_MS                        | -XX:MetaspaceSize               | default :128m                          |
| JVM_MMS                       | -XX:MaxMetaspaceSize            | default :320m                          |
| NACOS_DEBUG                   | 开启远程调试                    | y/n default :n                         |
| TOMCAT_ACCESSLOG_ENABLED      | server.tomcat.accesslog.enabled | default :false                         |

# 文章主旨

**本文目的是配置高可用的Nacos集群**

## 架构图

整体架构为：**Nginx + 3 x Nacos +高可用MySQL**

![img](https://img2018.cnblogs.com/blog/1149398/201909/1149398-20190903094418578-707914480.png)

高可用MySQL使用主从复制结构的可以参考[Docker搭建MySQL主从集群，基于GTID](https://www.cnblogs.com/hellxz/p/docker-mysql-cluster.html)

文中对应的配置文件已经上传Github，地址：https://github.com/hellxz/nacos-cluster-docker

## 测试环境

| 服务器OS                 | 主机IP         | Docker版本 |
| ------------------------ | -------------- | ---------- |
| Ubuntu Server 18.04 LTS  | 192.168.87.133 | 18.09.6    |
| Ubuntu Server 18.04 LTS  | 192.168.87.139 | 18.09.7    |
| Ubuntu Desktop 18.04 LTS | 192.168.87.135 | 18.09.7    |

为了实现Nacos的高可用，至少需要三台负载较小的服务器，可以与其它服务共存

> **注意事项**
>
> 1. 这里演示高可用MySQL地址为：`10.2.7.29:3340`，`10.2.7.29:3341`，请自行替换
> 2. 这里的`10.2.7.29`是局域网，`192.168.*`是虚拟机网络，通过虚拟机是可以访问局域网的
> 3. Nacos初始化SQL这块使用官方的即可，配置文件中不提供，默认认为高可用MySQL已经执行了初始化nacos.sql，这个SQL请移步[nacos.sql Github](https://github.com/alibaba/nacos/blob/master/distribution/conf/nacos-mysql.sql)

## 配置文件目录结构与说明

![img](https://img2018.cnblogs.com/blog/1149398/201909/1149398-20190903175122776-1803942701.png)

### 目录说明

- **init.d/custom.properties** - 官方提供的自选功能配置文件，Nacos节点均包含此目录
- **nacos-1/docker-compose-nacos1.yml** - 第一个Nacos节点的Docker-compose配置文件
- **nacos-2/docker-compose-nacos1.yml** - 第二个Nacos节点的Docker-compose配置文件
- **nacos-3/docker-compose-nacos1.yml** - 第三个Nacos节点的Docker-compose配置文件

除些之外，在每个`nacos-*`目录下边，使用docker-compose命令启动容器后，会创建出`cluster-logs`目录,

![img](https://img2018.cnblogs.com/blog/1149398/201909/1149398-20190903182445756-1428179929.png)

> 我认为最常用的应该是nacos.log

## 配置文件内容

133服务器的`docker-compose-nacos1.yml`

```bash
version: '3' 
services:
  # nacos-server服务注册与发现，配置中心服务    
  docker-nacos-server:
    image: nacos/nacos-server:1.0.1
    container_name: nacos-server-1
    ports:
      - "8848:8848"
      - "9555:9555"
    networks: 
      - nacos_net
    restart: on-failure
    privileged: true
    environment:
      PREFER_HOST_MODE: ip #如果支持主机名可以使用hostname,否则使用ip，默认也是ip
      SPRING_DATASOURCE_PLATFORM: mysql #数据源平台 仅支持mysql或不保存empty
      NACOS_SERVER_IP: 192.168.87.133 #多网卡情况下，指定ip或网卡
      NACOS_SERVERS: 192.168.87.133:8848 192.168.87.139:8848 192.168.87.135:8848 #集群中其它节点[ip1:port ip2:port ip3:port]
      MYSQL_MASTER_SERVICE_HOST: 10.2.7.29 #mysql配置，Master为主节点，Slave为从节点
      MYSQL_MASTER_SERVICE_PORT: 3340
      MYSQL_MASTER_SERVICE_DB_NAME: nacos
      MYSQL_MASTER_SERVICE_USER: root
      MYSQL_MASTER_SERVICE_PASSWORD: password
      MYSQL_SLAVE_SERVICE_HOST: 10.2.7.29
      MYSQL_SLAVE_SERVICE_PORT: 3341
      #JVM调优参数
      #JVM_XMS:  #-Xms default :2g
      #JVM_XMX:  #-Xmx default :2g
      #JVM_XMN:  #-Xmn default :1g
      #JVM_MS:   #-XX:MetaspaceSize default :128m
      #JVM_MMS:  #-XX:MaxMetaspaceSize default :320m
      #NACOS_DEBUG: n #是否开启远程debug，y/n，默认n
      #TOMCAT_ACCESSLOG_ENABLED: true #是否开始tomcat访问日志的记录，默认false
    volumes:
      - ./cluster-logs/nacos1:/home/nacos/logs #日志输出目录
      - ../init.d/custom.properties:/home/nacos/init.d/custom.properties #../init.d/custom.properties内包含很多自定义配置，可按需配置

networks:
  nacos_net:
    driver: bridge
```

139服务器的`docker-compose-nacos2.yml`

```bash
version: '3' 
services:
  # nacos-server服务注册与发现，配置中心服务    
  docker-nacos-server:
    image: nacos/nacos-server:1.0.1
    container_name: nacos-server-2
    ports:
      - "8848:8848"
      - "9555:9555"
    networks:
      - nacos_net
    restart: 
      - on-failure
    privileged: true
    environment:
      PREFER_HOST_MODE: ip #如果支持主机名可以使用hostname,否则使用ip，默认也是ip
      SPRING_DATASOURCE_PLATFORM: mysql #数据源平台 仅支持mysql或不保存empty
      NACOS_SERVER_IP: 192.168.87.139 #多网卡情况下，指定ip或网卡
      NACOS_SERVERS: 192.168.87.133:8848 192.168.87.139:8848 192.168.87.135:8848 #集群中其它节点[ip1:port ip2:port ip3:port]
      MYSQL_MASTER_SERVICE_HOST: 10.2.7.29 #mysql配置，Master为主节点，Slave为从节点
      MYSQL_MASTER_SERVICE_PORT: 3340
      MYSQL_MASTER_SERVICE_DB_NAME: nacos
      MYSQL_MASTER_SERVICE_USER: root
      MYSQL_MASTER_SERVICE_PASSWORD: password
      MYSQL_SLAVE_SERVICE_HOST: 10.2.7.29
      MYSQL_SLAVE_SERVICE_PORT: 3341
      #JVM调优参数
      #JVM_XMS:  #-Xms default :2g
      #JVM_XMX:  #-Xmx default :2g
      #JVM_XMN:  #-Xmn default :1g
      #JVM_MS:   #-XX:MetaspaceSize default :128m
      #JVM_MMS:  #-XX:MaxMetaspaceSize default :320m
      #NACOS_DEBUG: n #是否开启远程debug，y/n，默认n
      #TOMCAT_ACCESSLOG_ENABLED: true #是否开始tomcat访问日志的记录，默认false
    volumes:
      - ./cluster-logs/nacos2:/home/nacos/logs #日志输出目录
      - ../init.d/custom.properties:/home/nacos/init.d/custom.properties #../init.d/custom.properties内包含很多自定义配置，可按需配置

networks:
  nacos_net:
    driver: bridge
```

135服务器的`docker-compose-nacos3.yml`

```bash
version: '3' 
services:
  # nacos-server服务注册与发现，配置中心服务    
  docker-nacos-server:
    image: nacos/nacos-server:1.0.1
    container_name: nacos-server-3
    ports:
      - "8848:8848"
      - "9555:9555"
    networks: 
      - nacos_net
    restart: on-failure
    privileged: true
    environment:
      PREFER_HOST_MODE: ip #如果支持主机名可以使用hostname,否则使用ip，默认也是ip
      SPRING_DATASOURCE_PLATFORM: mysql #数据源平台 仅支持mysql或不保存empty
      NACOS_SERVER_IP: 192.168.87.135 #多网卡情况下，指定ip或网卡
      NACOS_SERVERS: 192.168.87.133:8848 192.168.87.139:8848 192.168.87.135:8848 #集群中其它节点[ip1:port ip2:port ip3:port]
      MYSQL_MASTER_SERVICE_HOST: 10.2.7.29 #mysql配置，Master为主节点，Slave为从节点
      MYSQL_MASTER_SERVICE_PORT: 3340
      MYSQL_MASTER_SERVICE_DB_NAME: nacos
      MYSQL_MASTER_SERVICE_USER: root
      MYSQL_MASTER_SERVICE_PASSWORD: password
      MYSQL_SLAVE_SERVICE_HOST: 10.2.7.29
      MYSQL_SLAVE_SERVICE_PORT: 3341
      #JVM调优参数
      #JVM_XMS:  #-Xms default :2g
      #JVM_XMX:  #-Xmx default :2g
      #JVM_XMN:  #-Xmn default :1g
      #JVM_MS:   #-XX:MetaspaceSize default :128m
      #JVM_MMS:  #-XX:MaxMetaspaceSize default :320m
      #NACOS_DEBUG: n #是否开启远程debug，y/n，默认n
      #TOMCAT_ACCESSLOG_ENABLED: true #是否开始tomcat访问日志的记录，默认false
    volumes:
      - ./cluster-logs/nacos3:/home/nacos/logs #日志输出目录
      - ../init.d/custom.properties:/home/nacos/init.d/custom.properties #../init.d/custom.properties内包含很多自定义配置，可按需配置

networks:
  nacos_net:
    driver: bridge
```

Nacos共用的`init.d/custom.properties`，与官方保持一致，按需使用

```properties
#spring.security.enabled=false
#management.security=false
#security.basic.enabled=false
#nacos.security.ignore.urls=/**
#management.metrics.export.elastic.host=http://localhost:9200
# metrics for prometheus
management.endpoints.web.exposure.include=*

# metrics for elastic search
#management.metrics.export.elastic.enabled=false
#management.metrics.export.elastic.host=http://localhost:9200

# metrics for influx
#management.metrics.export.influx.enabled=false
#management.metrics.export.influx.db=springboot
#management.metrics.export.influx.uri=http://localhost:8086
#management.metrics.export.influx.auto-create-db=true
#management.metrics.export.influx.consistency=one
#management.metrics.export.influx.compressed=true
```

> 由于现在把所有的配置文件放在一起，并且每个Nacos节点都需要一份`init.d`目录，这里就不单独为每个`nacos-*`复制了，直接把文件夹整个复制过来就可以了

## 启动Nacos集群

### 复制配置文件

复制`nacos-cluster-docker`目录到以上三台主机，上边的配置文件已经修改好了

其对应关系为：

- **192.168.87.133 对应 nacos-1**
- **192.168.87.139 对应 nacos-2**
- **192.168.87.135 对应 nacos-3**

### 启动容器

分别在各主机上进入各自对应的nacos目录中，启动容器，命令如下：

133服务器

```bash
$ cd nacos-cluster-docker/nacos-1
$ docker-compose -f docker-compose-nacos1.yml up -d
```

139服务器

```bash
$ cd nacos-cluster-docker/nacos-2
$ docker-compose -f docker-compose-nacos2.yml up -d
```

135服务器

```bash
$ cd nacos-cluster-docker/nacos-3
$ docker-compose -f docker-compose-nacos3.yml up -d
```

### 查看日志

查看日志分别在对应的nacos-*目录下，执行

```tail
tail -f cluster-logs/nacos*/nacos.log
```

## 访问Nacos UI界面

这里使用133服务器页面进行展示下，

访问`http://192.168.87.133:8848/nacos`，进入登录页面，默认的用户名与密码都是`nacos`

![img](https://i.loli.net/2021/02/02/Oa7uiFXUyQVl3or.png)

> 我这里还原的sql是平时测试用的，这里打下码，我们的关注点在 **集群管理** > **节点列表** 这里

这里我们看到Nacos集群各节点已经正常了，LEADER与FOLLOWER已经选出，一切正常了

## 配置Nginx

除了Nacos集群配置外，我们在Spring Boot或Spring Cloud项目中使用的时候，只能指定一个URL指向Nacos服务端，这里使用Nginx进行代理负载均衡

> 如果可以的话，生产环境最佳实践是使用一个域名指向Nginx，之后就算换Nginx主机，客户端也无需修改配置文件，只需要使用域名指向一个新的Nginx的IP

### 列出最主要的配置

```nginx
http{
	upstream nacos-cluster {
		server 192.168.87.133:8848;
		server 192.168.87.139:8848;
		server 192.168.87.135:8848;
	}
	server {
		listen 8848;
		location /{
			proxy_pass http://nacos-cluster;
		}
	}
}
```

启动Nginx，使用代码进行测试连接当前的Nginx所在主机`IP:8848`

![img](https://i.loli.net/2021/02/02/QxRONc1zTZHI52B.png)

这里已经可以看到服务正常注册到集群中了

## 遇到的问题

### 客户端无法注册到集群中

如果遇到有客户端服务无法连接到Nacos集群中，请着重检查下Nacos的堆内存与虚拟机的设置，最初我使用的默认的2G最大堆内存，虚拟机也分的2G内存，然后启动服务时还能正常一小会，然后就开始有的服务显示节点，有的不显示列表，使用客户端进行连接也无法正常连接，提示`Down Server response` 之类 的提示

**解决办法**：修改虚拟机内存大小，或修改Nacos堆内存配置