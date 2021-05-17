MongoDB 连接命令格式
使用用户名和密码连接到 MongoDB 服务器，你必须使用 'username:password@hostname/dbname' 格式，'username'为用户名，'password' 为密码。

使用用户名和密码连接登录到默认数据库：

$ ./mongo
MongoDB shell version: 4.0.9
connecting to: test
使用用户 admin 使用密码 123456 连接到本地的 MongoDB 服务上。输出结果如下所示：

> mongodb://admin:123456@localhost/
... 
使用用户名和密码连接登录到指定数据库，格式如下：

mongodb://admin:123456@localhost/test
更多连接实例
连接本地数据库服务器，端口是默认的。

mongodb://localhost
使用用户名fred，密码foobar登录localhost的admin数据库。

mongodb://fred:foobar@localhost
使用用户名fred，密码foobar登录localhost的baz数据库。

mongodb://fred:foobar@localhost/baz
连接 replica pair, 服务器1为example1.com服务器2为example2。

mongodb://example1.com:27017,example2.com:27017
连接 replica set 三台服务器 (端口 27017, 27018, 和27019):

mongodb://localhost,localhost:27018,localhost:27019
连接 replica set 三台服务器, 写入操作应用在主服务器 并且分布查询到从服务器。

mongodb://host1,host2,host3/?slaveOk=true
直接连接第一个服务器，无论是replica set一部分或者主服务器或者从服务器。

mongodb://host1,host2,host3/?connect=direct;slaveOk=true
当你的连接服务器有优先级，还需要列出所有服务器，你可以使用上述连接方式。

安全模式连接到localhost:

mongodb://localhost/?safe=true
以安全模式连接到replica set，并且等待至少两个复制服务器成功写入，超时时间设置为2秒。

mongodb://host1,host2,host3/?safe=true;w=2;wtimeoutMS=2000

$gt -------- greater than  >

$gte --------- gt equal  >=

$lt -------- less than  <

$lte --------- lt equal  <=

$ne ----------- not equal  !=

$eq  --------  equal  =

查询 title 包含"教"字的文档：

db.col.find({title:/教/})
查询 title 字段以"教"字开头的文档：

db.col.find({title:/^教/})
查询 titl e字段以"教"字结尾的文档：

db.col.find({title:/教$/})

如果想获取 "col" 集合中 title 为 String 的数据，你可以使用以下命令：

db.col.find({"title" : {$type : 2}})
或
db.col.find({"title" : {$type : 'string'}})

显示查询文档中的两条记录：

> db.col.find({},{"title":1,_id:0}).limit(2)
{ "title" : "PHP 教程" }
{ "title" : "Java 教程" }

注:skip()方法默认参数为 0 。
只会显示第二条文档数据

>db.col.find({},{"title":1,_id:0}).limit(1).skip(1)
{ "title" : "Java 教程" }

 col 集合中的数据按字段 likes 的降序排列：

>db.col.find({},{"title":1,_id:0}).sort({"likes":-1})
{ "title" : "PHP 教程" }
{ "title" : "Java 教程" }
{ "title" : "MongoDB 教程" }

skip(), limilt(), sort()三个放在一起执行的时候，执行的顺序是先 sort(), 然后是 skip()，最后是显示的 limit()。

db.values.createIndex({open: 1, close: 1}, {background: true})

1、查看集合索引∏

db.col.getIndexes()
2、查看集合索引大小

db.col.totalIndexSize()
3、删除集合所有索引

db.col.dropIndexes()
4、删除集合指定索引

db.col.dropIndex("索引名称")