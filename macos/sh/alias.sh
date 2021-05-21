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

# kibana 环境变量
KIBANA_HOME=/Users/luna/compose/nacos
export PATH=$PATH:$KIBANA_HOME/bin
export KIBANA_HOME=$KIBANA_HOME

# mongodb 环境变量
MONGO_HOME=/Users/luna/compose/mongodb
export PATH=$PATH:$MONGO_HOME/bin
export MONGO_HOME=$MONGO_HOME
alias mongostart='mongod -f /Users/luna/compose/mongodb/mongodb.config'

# nacos 环境变量
alias nastartup='sh /Users/luna/compose/nacos/bin/startup.sh -m standalone'
alias nashutdown='sh /Users/luna/compose/nacos/bin/shutdown.sh'

#macOS根据名称杀死进程
ps -ef | grep 进程名称 | awk '{print $2}' | xargs kill -9

killall -9 完整进程名