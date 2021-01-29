rabbitMQ是一个在AMQP协议标准基础上完整的，可服用的企业消息系统。它遵循Mozilla Public License开源协议，采用 Erlang 实现的工业级的消息队列(MQ)服务器，Rabbit MQ 是建立在Erlang OTP平台上。

## 1.安装Erlang 

所以在安装rabbitMQ之前，需要先安装Erlang 。

小编使用的是[otp_win64_18.1](https://pan.baidu.com/s/1c2826rA) ，需要其他版本或者32位系统的，可以去[官网](http://www.erlang.org/downloads)下载。

全部点击“下一步”就行。

有的选择其他的安装方式，可能需要添加一下系统环境变量（正常安装的也要检查下）：

![img](https://i.loli.net/2021/01/29/rPNn6SghdmfvHtu.png)

有最好，没有的话就手动添加嘛。

## 2.安装RabbitMQ

下载运行[rabbitmq-server-3.6.5](https://pan.baidu.com/s/1cqpG0u) ，需要其他版本或者32位系统的，可以去[官网](http://www.rabbitmq.com/download.html)下载。

依旧可以不改变默认进行安装。

需要注意：默认安装的RabbitMQ 监听端口是5672



## 3.配置

注册进服务 管理员身份执行 rabbitmq-service install

使用RabbitMQ 管理插件，可以更好的可视化方式查看Rabbit MQ 服务器实例的状态。

打开命令窗口：

输入命令：

```
"C:\Program Files\RabbitMQ Server\rabbitmq_server-3.6.5\sbin\rabbitmq-plugins.bat" enable rabbitmq_management
```

![img](https://i.loli.net/2021/01/29/pKRy4mQU9Poz6lC.png)

这样，就安装好插件了，是不是能使用了呢？别急，需要重启服务才行，使用命令：

```
net stop RabbitMQ && net start RabbitMQ
```

这时候的，也许会出现这种结果：

![img](https://i.loli.net/2021/01/29/S8awjq2sGLDTx34.png)

“发生错误：发生系统错误 *5。 \*拒绝访问。”**

这是什么鬼？查了下，原来，5代表的是：不是系统管理员权限。

问题解决方案：使用管理员打开*cmd再执行此命令：*

*![img](https://i.loli.net/2021/01/29/DLEyYBsRPrktW4f.png)*

这样就结束了吗？当然没有。

### 创建用户，密码，绑定角色

使用*rabbitmqctl控制台命令（位于\*C:\Program Files\RabbitMQ Server\rabbitmq_server-3.6.5\sbin>）来创建用户，密码，绑定权限等。**

注意：安装路径不同的请看仔细啊。

rabbitmq的用户管理包括增加用户，删除用户，查看用户列表，修改用户密码。

查看已有用户及用户的角色：

```
rabbitmqctl.bat list_users
```

![img](http://images2015.cnblogs.com/blog/784082/201609/784082-20160924001810231-489339837.png)

新增一个用户：

```
rabbitmqctl.bat add_user username password
```

![img](https://i.loli.net/2021/01/29/OoEbayLInpQUScR.png)

 

此时来看下我们当前用户哈：

![img](https://i.loli.net/2021/01/29/gUsbYMQkIi9zleX.png)

eric 后面没有“[administrator]”

这个administrator是干嘛用的呢？这就涉及到用户角色问题了：

按照我个人理解，rabbitmq用户角色可分为五类：超级管理员, 监控者, 策略制定者, 普通管理者以及其他。

(1) 超级管理员(administrator)

可登陆管理控制台(启用management plugin的情况下)，可查看所有的信息，并且可以对用户，策略(policy)进行操作。

(2) 监控者(monitoring)

可登陆管理控制台(启用management plugin的情况下)，同时可以查看rabbitmq节点的相关信息(进程数，内存使用情况，磁盘使用情况等) 

(3) 策略制定者(policymaker)

可登陆管理控制台(启用management plugin的情况下), 同时可以对policy进行管理。

(4) 普通管理者(management)

仅可登陆管理控制台(启用management plugin的情况下)，无法看到节点信息，也无法对策略进行管理。

(5) 其他的

无法登陆管理控制台，通常就是普通的生产者和消费者。

 

好啦，我们也给 eric 变成 “超级管理员” 角色：

```
rabbitmqctl.bat set_user_tags username administrator
```

![img](https://i.loli.net/2021/01/29/2xHaJfvYmrkg3pt.png)

再看下结果哈：

![img](https://i.loli.net/2021/01/29/ovjVFKL2hAsRXEJ.png)

当然，除了上面的administrator 还有 monitoring、policymaker、management、自定义名称 ，对应上面介绍到的不同的角色。

像我们人一样，我们角色除了是公司的员工，还是父母的孩子、子女的爸妈等，用户也可以同时具有多个角色,设置方式:

```
rabbitmqctl.bat  set_user_tags  username tag1 tag2 ...
```

![img](https://i.loli.net/2021/01/29/YMh9Kr4EnumZbQs.png)

 

 

恩，现在总觉得guest 这个不安全（它的默认密码是guest）,想更改密码，好办：

```
rabbitmqctl change_password userName newPassword
```

![img](https://i.loli.net/2021/01/29/rdyDgh3YJ26wfaO.png)

 

有的人也许会说，我就是看guest不爽，老子新增了administrator用户了，就是想干掉它，可以：

```
rabbitmqctl.bat delete_user username
```

![img](https://i.loli.net/2021/01/29/1UJQxXdPzy9rTkR.png)

 

 这时，可能有人就要问了：命令框是只有一个用户了，你怎么操作啊？怎么查看执行情况啊/

 当然有路子啦：

使用浏览器打开[ http://localhost:15672](http://localhost:15672/) 访问Rabbit Mq的管理控制台，使用刚才创建的账号登陆系统：

 ![img](https://i.loli.net/2021/01/29/enjUqDQdfGZIMvz.png)

![img](https://i.loli.net/2021/01/29/TMWnJjqCZdKfe3O.png)

 

其实，除了可查看所有的信息 ，上面的命令 增删改查、权限设置，都可以在这个页面完成，还可以依据业务需求设置策略(policy)，具体的就不在这里啰嗦了，大家可以看看网上的帖子。

### 权限设置

用户有了角色，那也需要权限设置啊，别急，慢慢来：

按照官方文档，用户权限指的是用户对exchange，queue的操作权限，包括配置权限，读写权限。

我们配置权限会影响到exchange、queue的声明和删除。

读写权限影响到从queue里取消息、向exchange发送消息以及queue和exchange的绑定(binding)操作。

例如： 将queue绑定到某exchange上，需要具有queue的可写权限，以及exchange的可读权限；向exchange发送消息需要具有exchange的可写权限；从queue里取数据需要具有queue的可读权限

 

权限相关命令为：

(1) 设置用户权限

rabbitmqctl  set_permissions  -p  VHostPath  User  ConfP  WriteP  ReadP

(2) 查看(指定hostpath)所有用户的权限信息

rabbitmqctl  list_permissions  [-p  VHostPath]

(3) 查看指定用户的权限信息

rabbitmqctl  list_user_permissions  User

(4)  清除用户的权限信息

rabbitmqctl  clear_permissions  [-p VHostPath]  User