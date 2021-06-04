# 查看进程数目
show processlist; 

#创建user01,只能本地访问

create user user01@'localhost' identified by 'password';

#创建luna,可以远程访问

create user luna@'%' identified by ''

#授予luna管理luna-cloud全部权限

grant all privileges on `luna-cloud`.* to luna;

#授予luna查看权限，并修改密码

grant select on *.* to 'luna'@'%' identified by 'anotherpassword';

#授予所有权限

GRANT ALL PRIVILEGES ON *.* TO luna@"%" IDENTIFIED BY "luna";