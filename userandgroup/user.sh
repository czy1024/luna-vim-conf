cat /etc/passwd
# 注册名：口令：用户标识号：组标识号：用户名：用户主目录：命令解释程序

cat /etc/group 
# 组名:口令:组标识号:组内用户列表

id
# 查看自己的信息

id 用户名
# 查看指定的用户信息

# 更改文件拥有者
# 基本语法：
    # chown [-R] 账号名称 文件或目录

    # chown [-R] 账号名称:用户组名称 文件或目录