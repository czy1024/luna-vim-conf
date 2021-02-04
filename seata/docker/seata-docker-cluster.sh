#!/bin/bash
echo "拉取镜像seataio/seata-server"
docker pull seataio/seata-server

docker run -d --name seata -p 8091:8091 seataio/seata-server:latest
sudo mkdir ~/seata
docker cp seata:/seata-server  ~/seata/nodeI

# 备份
cp ~/seata/nodeI/resources/file.conf ~/seata/nodeI/resources/file.conf.back
cp ~/seata/nodeI/resources/registry.conf ~/seata/nodeI/resources/registry.conf.back
# 修改持久化类型为db存储

#sed -i 's/mode = "file"/mode = "db"/g' ~/seata/nodeI/resources/file.conf
#sed -i 's/127.0.0.1:3306/f.xicc.cc:23405/g' ~/seata/nodeI/resources/file.conf
#sed -i 's/user = "mysql"/user = "root"/g' ~/seata/nodeI/resources/file.conf
#sed -i 's/password = "mysql"/password = "root"/g' ~/seata/nodeI/resources/file.conf
sudo cat >  ~/seata/nodeI/resources/file.conf <<EOF
transport {
  # tcp, unix-domain-socket
  type = "TCP"
  #NIO, NATIVE
  server = "NIO"
  #enable heartbeat
  heartbeat = true
  # the client batch send request enable
  enableClientBatchSendRequest = false
  #thread factory for netty
  threadFactory {
    bossThreadPrefix = "NettyBoss"
    workerThreadPrefix = "NettyServerNIOWorker"
    serverExecutorThreadPrefix = "NettyServerBizHandler"
    shareBossWorker = false
    clientSelectorThreadPrefix = "NettyClientSelector"
    clientSelectorThreadSize = 1
    clientWorkerThreadPrefix = "NettyClientWorkerThread"
    # netty boss thread size
    bossThreadSize = 1
    #auto default pin or 8
    workerThreadSize = "default"
  }
  shutdown {
    # when destroy server, wait seconds
    wait = 3
  }
  serialization = "seata"
  compressor = "none"
}

## transaction log store, only used in server side
store {
  ## store mode: file、db
  mode = "db"
  ## file store property
  file {
    ## store location dir
    dir = "sessionStore"
    # branch session size , if exceeded first try compress lockkey, still exceeded throws exceptions
    maxBranchSessionSize = 16384
    # globe session size , if exceeded throws exceptions
    maxGlobalSessionSize = 512
    # file buffer size , if exceeded allocate new buffer
    fileWriteBufferCacheSize = 16384
    # when recover batch read size
    sessionReloadReadSize = 100
    # async, sync
    flushDiskMode = async
  }

  ## database store property
  db {
    ## the implement of javax.sql.DataSource, such as DruidDataSource(druid)/BasicDataSource(dbcp) etc.
    datasource = "druid"
    ## mysql/oracle/postgresql/h2/oceanbase etc.
    dbType = "mysql"
    driverClassName = "com.mysql.jdbc.Driver"
    ## if using mysql to store the data, recommend add rewriteBatchedStatements=true in jdbc connection param
    url = "jdbc:mysql://f.xicc.cc:23405/seata?rewriteBatchedStatements=true"
    user = "root"
    password = "root"
    minConn = 5
    maxConn = 30
    globalTable = "global_table"
    branchTable = "branch_table"
    lockTable = "lock_table"
    queryLimit = 100
  }
}
## server configuration, only used in server side
server {
  recovery {
    #schedule committing retry period in milliseconds
    committingRetryPeriod = 1000
    #schedule asyn committing retry period in milliseconds
    asynCommittingRetryPeriod = 1000
    #schedule rollbacking retry period in milliseconds
    rollbackingRetryPeriod = 1000
    #schedule timeout retry period in milliseconds
    timeoutRetryPeriod = 1000
  }
  undo {
    logSaveDays = 7
    #schedule delete expired undo_log in milliseconds
    logDeletePeriod = 86400000
  }
  #check auth
  enableCheckAuth = true
  #unit ms,s,m,h,d represents milliseconds, seconds, minutes, hours, days, default permanent
  maxCommitRetryTimeout = "-1"
  maxRollbackRetryTimeout = "-1"
  rollbackRetryTimeoutUnlockEnable = false
}

## metrics configuration, only used in server side
metrics {
  enabled = false
  registryType = "compact"
  # multi exporters use comma divided
  exporterList = "prometheus"
  exporterPrometheusPort = 9898
}
EOF
# 修改注册中心和配置中心为nacos============================================
sudo cat >  ~/seata/nodeI/resources/registry.conf <<EOF 

registry {
  # file 、nacos 、eureka、redis、zk、consul、etcd3、sofa
  type = "nacos"
  loadBalance = "RandomLoadBalance"
  loadBalanceVirtualNodes = 10

  nacos {
    application = "seata-server"
    serverAddr = "f.xicc.cc:23403"
    group = "SEATA_GROUP"
    namespace = ""
    cluster = "default"
    username = ""
    password = ""
  }
  eureka {
    serviceUrl = "http://localhost:8761/eureka"
    application = "default"
    weight = "1"
  }
  redis {
    serverAddr = "localhost:6379"
    db = 0
    password = ""
    cluster = "default"
    timeout = 0
  }
  zk {
    cluster = "default"
    serverAddr = "127.0.0.1:2181"
    sessionTimeout = 6000
    connectTimeout = 2000
    username = ""
    password = ""
  }
  consul {
    cluster = "default"
    serverAddr = "127.0.0.1:8500"
  }
  etcd3 {
    cluster = "default"
    serverAddr = "http://localhost:2379"
  }
  sofa {
    serverAddr = "127.0.0.1:9603"
    application = "default"
    region = "DEFAULT_ZONE"
    datacenter = "DefaultDataCenter"
    cluster = "default"
    group = "SEATA_GROUP"
    addressWaitTime = "3000"
  }
  file {
    name = "file.conf"
  }
}

config {
  # file、nacos 、apollo、zk、consul、etcd3
  type = "file"

  nacos {
    serverAddr = "f.xicc.cc:23403"
    namespace = ""
    group = "SEATA_GROUP"
    username = ""
    password = ""
    dataId = "seataServer.properties"
  }
  consul {
    serverAddr = "127.0.0.1:8500"
  }
  apollo {
    appId = "seata-server"
    apolloMeta = "http://192.168.1.204:8801"
    namespace = "application"
    apolloAccesskeySecret = ""
  }
  zk {
    serverAddr = "127.0.0.1:2181"
    sessionTimeout = 6000
    connectTimeout = 2000
    username = ""
    password = ""
  }
  etcd3 {
    serverAddr = "http://localhost:2379"
  }
  file {
    name = "file.conf"
  }
}
EOF
sudo cp -r ~/seata/nodeI ~/seata/nodeII ~/seata/nodeIII
# 停止删除容器
docker stop seata

docker rm seata

docker network create \
	--driver bridge \
	--subnet=172.16.31.0/24 \
	--gateway=172.16.31.1 seatanet
        
# 启动容器
echo"nodeI 172.16.31.10  "
docker run --name seataI --network seatanet --ip 172.16.31.10  --restart=always \
        -p 8091:8091 -d \
        -e SEATA_PORT=8091 \
        -e SEATA_IP=172.16.31.10 \
        -v ~/seata:/seata-server \
        seataio/seata-server:latest

docker run --name seataII --network seatanet --ip 172.16.31.11  --restart=always \
        -p 8191:8091 -d \
        -e SEATA_PORT=8091 \
        -e SEATA_IP=172.16.31.11 \
        -v ~/seata/nodeII:/seata-server \
        seataio/seata-server:latest

docker run --name seataIII --network seatanet --ip 172.16.31.12  --restart=always \
        -p 8291:8091 -d \
        -e SEATA_PORT=8091 \
        -e SEATA_IP=172.16.31.12 \
        -v ~/seata/nodeIII:/seata-server \
        seataio/seata-server:latest
