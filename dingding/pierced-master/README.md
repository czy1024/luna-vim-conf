# 钉钉内网穿透

## 使用方法

启动工具，执行命令“./ding -config=./ding.cfg -subdomain= 域名前缀 端口”，以 Linux 为例：

```
cd mac_64
chmod 777 ./ding
./ding -config=./ding.cfg -subdomain=abcde 8080
```

TCP 穿透需要在数据库里面执行：

`GRANT ALL PRIVILEGES ON *.* TO root@'%' IDENTIFIED BY '123456';`

`FLUSH PRIVILEGES;`

数据库连接命令：

`mysql -h vaiwan.com -u root -p -P 1234 //端口号地址`

## 参数说明

<table> 
 <thead> 
  <tr> 
   <th>参数</th> 
   <th>说明</th> 
  </tr> 
 </thead> 
 <tbody> 
  <tr> 
   <td>config</td> 
   <td>内网穿透的配置文件，按命令照示例固定为钉钉提供的。/ding.cfg，无需修改</td> 
  </tr> 
  <tr> 
   <td>subdomain</td> 
   <td>您需要使用的域名前缀，该前缀将会匹配到“vaiwan.com”前面，例如你的 subdomain 是 abcde，启动工具后会将 abcde.vaiwan.com 映射到本地。</td> 
  </tr> 
  <tr> 
   <td>端口</td> 
   <td>您需要代理的本地服务 http-server 端口，例如你本地端口为 8080 等</td> 
  </tr> 
 </tbody> 
</table>
