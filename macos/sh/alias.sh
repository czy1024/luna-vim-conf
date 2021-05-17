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

# 创建命令别名之前先测试命令名是否已存在
# 例如测试 foo
type foo 
bash: type: foo: not found
# 输出 not found 说明未存在
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


# gradle 环境变量
GRADLE_HOME=/Users/luna/compose/gradle
export PATH=$PATH:$GRADLE_HOME/bin

# maven 环境变量
MAVEN_HOME=/Users/luna/compose/apache-maven
export PATH=$PATH:$MAVEN_HOME/bin

# tomcat 环境变量
CATALINA_HOME=/Users/luna/compose/apache-tomcat
export PATH=$PATH:$CATALINA_HOME/bin



# java 环境变量
JAVA_HOME=“java 目录”
export PATH=$PATH:$JAVA_HOME/bin
CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:.
export CLASSPATH

#macOS根据名称杀死进程
ps -ef | grep 进程名称 | awk '{print $2}' | xargs kill -9

killall -9 完整进程名