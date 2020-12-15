initialize-insecure：初始化后默认无密码；

--user=root：指定root用户；

--explicit_defaults_for_timestamp:：

mysqld --initialize-insecure --user=root  --explicit_defaults_for_timestamp --default-file="my.ini"

# 安装服务

mysqld install

# 启动服务

net start mysql
