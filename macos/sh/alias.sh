# Mac 终端设置命令别名
# 进入根目录
cd ~  

# 创建bash文件
touch .bash_profile

# 编辑
vim .bash_profile

# 使文件生效
source .bash_profile

# 查看现有别名
alias

alias grep='grep --color=always'  
alias vi='vim'   
alias ll='ls -al'  
alias la='ls -A'  
alias l='ls -CF'  
alias ls='ls -G'  

# 为多个命令的组合设置别名
# hexo 清理打包发布
alias hcgd='hexo clean&&hexo g&&hexo d'
# moon 钉钉80端口映射
alias moon='sh /Users/luna/Documents/luna-ddns/ding-80/start.sh'
# mh 钉钉8089端口映射
alias mh='sh /Users/luna/Documents/luna-ddns/ding-8089/start.sh'
# cute chfs 文件共享
alias cute='sh /Users/luna/Documents/luna-ddns/cute/start.sh'
# mc 钉钉8087端口映射
alias mc='sh /Users/luna/Documents/luna-ddns/ding-8087/start.sh'
# frp 端口映射
alias frpc='sh /Users/luna/Documents/luna-ddns/frp/frpc-start.sh'

# gradle 环境变量
GRADLE_HOME=/Users/luna/compose/gradle
export PATH=$PATH:$GRADLE_HOME/bin
export GRADLE_HOME=$GRADLE_HOME

# maven 环境变量
M2_HOME=/Users/luna/compose/apache-maven
export PATH=$PATH:$M2_HOME/bin
export M2_HOME=$M2_HOME

# tomcat 环境变量
CATALINA_HOME=/Users/luna/compose/apache-tomcat
export PATH=$PATH:$CATALINA_HOME/bin
export CATALINA_HOME=$CATALINA_HOME

# jmeter 环境变量
JMETER_HOME=/Users/luna/compose/apache-jmeter
export PATH=$PATH:$JMETER_HOME/bin
export JMETER_HOME=$JMETER_HOME

# zookeeper 环境变量
ZOOKEEPER_HOME=/Users/luna/compose/apache-zookeeper
export PATH=$PATH:$ZOOKEEPER_HOME/bin
export ZOOKEEPER_HOME=$ZOOKEEPER_HOME
alias zk-start='/Users/luna/compose/apache-zookeeper/bin/zkServer.sh start'
alias zk-stop='/Users/luna/compose/apache-zookeeper/bin/zkServer.sh stop'
alias zk-cli='/Users/luna/compose/apache-zookeeper/bin/zkCli.sh'

# dubbo
# dubbo-admin
alias dubbo-admin='java -jar /Users/luna/compose/dubbo-admin/dubbo-admin/target/dubbo-admin-0.0.1-SNAPSHOT.jar'
# dubbo-monitor
alias dubbo-monitor-start='/Users/luna/compose/dubbo-admin/dubbo-monitor-simple/target/dubbo-monitor-simple-2.0.0/assembly.bin/start.sh'
alias dubbo-monitor-stop='/Users/luna/compose/dubbo-admin/dubbo-monitor-simple/target/dubbo-monitor-simple-2.0.0/assembly.bin/stop.sh'

# nexus 环境变量
NEXUS_HOME=/Users/luna/compose/nexus/nexus
export PATH=$PATH:$NEXUS_HOME/bin
export NEXUS_HOME=$NEXUS_HOME

# java 环境变量
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_291.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME/jre/bin
#export PATH=$PATH:$JAVA_HOME/bin
#CATALINA_OPTS="-Xms512M -Xmx1024M"
export JAVA_HOME=$JAVA_HOME
CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:.
export CLASSPATH=$CLASSPATH

# elastic 环境变量
ELASTIC_HOME=/Users/luna/compose/elasticsearch
export PATH=$PATH:$ELASTIC_HOME/bin
export ELASTIC_HOME=$ELASTIC_HOME

# logstash 环境变量
LOGSTASH_HOME=/Users/luna/compose/logstash
export PATH=$PATH:$LOGSTASH_HOME/bin
export LOGSTASH_HOME=$LOGSTASH_HOME
alias logstashstart='logstash -f /Users/luna/compose/logstash/config/logstash.conf'

# elastic 环境变量
ELASTIC_HOME=/Users/luna/compose/elasticsearch
export PATH=$PATH:$ELASTIC_HOME/bin
export ELASTIC_HOME=$ELASTIC_HOME

# mongodb 环境变量
MONGO_HOME=/Users/luna/compose/mongodb
export PATH=$PATH:$MONGO_HOME/bin
export MONGO_HOME=$MONGO_HOME
alias mongostart='mongod -f /Users/luna/compose/mongodb/mongodb.config'

# nacos 环境变量
alias nastartup='sh /Users/luna/compose/nacos/bin/startup.sh -m standalone'
alias nashutdown='sh /Users/luna/compose/nacos/bin/shutdown.sh'

# vdian 堡垒机
alias vdssh='sh /Users/luna/weidian/ssh/login_relay.sh'

#macOS根据名称杀死进程
ps -ef | grep 进程名称 | awk '{print $2}' | xargs kill -9

killall -9 完整进程名

# 允许任何来源
sudo spctl --master-disable