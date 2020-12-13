
# 环境配置

#将安装包上传到Ubuntu系统的 /usr/local/programs/java/ 目录下，如果目录不存在，命令如下：

    $ mkdir -p /usr/local/programs/java/
#解压缩，命令如下：

    $ tar -zxvf ./jdk-8u231-linux-x64.tar.gz
#配置所有用户的环境变量，命令如下：

    $ vim /etc/profile
#在配置文件最后添加以下配置，命令如下：

export JAVA_HOME=/usr/local/programs/java/jdk1.8.0_231
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
#让配置文件生效，命令如下：

    $ source /etc/profile
#验证

#配置完成后验证是否Jdk1.8安装成功，执行以下命令：

    $ java -version