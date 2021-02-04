

## 管理员启动终端----initialize-insecure：初始化后默认无密码

```
若数据库不自动生成则  mysqld --no-defaults --initialize 

mysql_install_db是一个默认放在.../mysql/scripts的一个初始化脚本。
该脚本可以在任何装有perl的操作系统上被使用，在5.6.8之前的版本，该脚本是一个shell脚本，并只能在unix平台上使用。

5.7.6以后的版本，该脚本也将被移除。

官方对它的介绍是：
Initialize MySQL Data Directory

安装完mysql server时，一般要执行这个脚本对数据库初始化。


运行这个脚本，会初始化mysql的data目录，并且创建那些系统表。
同样也会初始化系统表空间并且关联innodb表与数据结构。


截至5.6.8版本，在unix平台，mysql_install_db创建一个被命名为“my.cnf”默认的参数文件在base安装目录。
该my.cnf是根据.../mysql/support-files/my-default.cnf所创建的。
如果my.cnf已经存在，脚本会假定my.cnf正在被使用，并会创建一个被命名为“my-new.cnf”的文件。


用法举例：
./mysql_install_db --user=mysql --basedir=/usr/local/mysql  --datadir=/data/mysql3306


其中--user为mysqld服务的运行用户
--basedir和--datadir则分别代表mysql的安装目录和数据存放目录


在5.6.8之后的版本，用此种方式初始化后，root密码将会存放在  /root/.mysql_secret 中
详细见 --random-passwords 参数。


其他选项：（博主手动翻译可能存在出入，详情请参考手册）


 --help
显示帮助信息


 --basedir=path
mysql 安装目录的路径


 --builddir=path
build 目录的路径，用于out-of-source构建。


 --cross-bootstrap
供内部使用。


 --datadir=path
mysql 数据目录的路径 


--defaults-extra-file=file_name
在读取全局选项文件和在读取用户选项文件之前，读取这个文件（选项文件），如果该文件不存在，将会抛出错误。（仅限unix平台）


 --defaults-file=file_name
用被提供的选项文件，如果该文件不存在，将会抛出提示。


 --force
当dns无法用时将通过ip地址代替。


 --keep-my-cnf
在5.6.20中被添加，mysql_install_db保存任何已经存在的my.cnf文件，并且不创建新的默认my.cnf文件。


 --ldata=path
与--datadir同义。


 --no-defaults
不读取任何选项文件，该选项在mysql_install_db启动时，若因为读取了未知的参数而启动失败时使用。


 --random-passwords
5.6.8中加入该选项，在unix平台，该选项在mysql安装时增添了更多安全性。
程序会给root初始化一个随机密码，被写入.mysql_secret文件，并且放置在对应用户的home目录下
如果.mysql_secret文件已经存在，新密码信息会被追加上去，每一个密码都会有时间戳信息，该文件默认权限是600。
并且没有匿名mysql用户存在。
通过RPM新安装mysql并使用mysql_install_db时，将会默认调用--random-passwords选项。（升级除外）
在5.6.9，solaris PKG新安装并且使用mysql_install_db时，同样也会调用--random-passwords。（升级除外）

用二进制或者源码安装时，可以在使用mysql_install_db时手动的添加--random-passwords选项。


 --rpm
供内部使用。


 --skip-name-resolve
当创建授权表时，用ip地址而不是host名，这个选项在你的DNS不起作用时，非常有用。


 --srcdir=path
供内部使用。


 --user=user_name
运行mysqld的系统用户名，通过mysqld创建的文件和目录的归属者将为该用户。


 --verbose
Verbose模式，打印更多关于这个程序的信息。


 --windows
供内部使用，5.7.5将移除。
```

# 安装启动服务

net start mysql

## 修改密码

```sql
 # 若上面失效,则使用下面的语句
 update user set password=password("czy1024") where user="root";
 
 update mysql.user set authentication_string=password('czy1024') where user='root'; 
 
 flush privileges; 
 #立即生效
```