#!/bin/bash

# 1. 创建certs文件夹，用来存放CA私钥和公钥
mkdir -pv ~/certs
cd ~/certs
#2. 创建密码 需要连续输入两次相同的密码
openssl genrsa -aes256 -out ca-key.pem 4096
#3. 依次输入密码、国家、省、市、组织名称等（除了密码外其他的可以直接回车跳过）
openssl req -new -x509 -days 365 -key ca-key.pem -sha256 -out ca.pem
#4. 生成server-key.pem
openssl genrsa -out server-key.pem 4096
#5. 生成server.csr（把下面的IP换成你自己服务器外网的IP或者域名）
echo "输入IP地址 =>>>>>>>"
read hostIp
openssl req -subj "/CN=$hostIp" -sha256 -new -key server-key.pem -out server.csr
#6. 配置白名单
#0.0.0.0表示所有ip都可以连接。（这里需要注意，虽然0.0.0.0可以匹配任意，但是仍需要配置你的外网ip和127.0.0.1，否则客户端会连接不上）

echo subjectAltName = IP:0.0.0.0,IP:$hostIp,IP:127.0.0.1 >> extfile.cnf
#或者也可以设置成域名

#echo subjectAltName = DNS:www.example.com,IP:$hostIp,IP:127.0.0.1 >> extfile.cnf
#7. 将Docker守护程序密钥的扩展使用属性设置为仅用于服务器身份验证
echo extendedKeyUsage = serverAuth >> extfile.cnf
#8.输入之前设置的密码，生成签名证书
openssl x509 -req -days 365 -sha256 -in server.csr -CA ca.pem -CAkey ca-key.pem \
  -CAcreateserial -out server-cert.pem -extfile extfile.cnf
#9、生成供客户端发起远程访问时使用的key.pem
openssl genrsa -out key.pem 4096
#10. 生成client.csr（把下面的IP换成你自己服务器外网的IP或者域名）
openssl req -subj "/CN=$hostIp" -new -key key.pem -out client.csr
#11. 创建扩展配置文件，把密钥设置为客户端身份验证用
echo extendedKeyUsage = clientAuth > extfile-client.cnf
#12. 生成cert.pem，输入前面设置的密码，生成签名证书
openssl x509 -req -days 365 -sha256 -in client.csr -CA ca.pem -CAkey ca-key.pem \
  -CAcreateserial -out cert.pem -extfile extfile-client.cnf
#13. 删除不需要的配置文件和两个证书的签名请求
rm -v client.csr server.csr extfile.cnf extfile-client.cnf
#14. 为了防止私钥文件被更改以及被其他用户查看，修改其权限为所有者只读
chmod -v 0400 ca-key.pem key.pem server-key.pem
#15. 为了防止##### 公钥文件被更改，修改其权限为只读
chmod -v 0444 ca.pem server-cert.pem cert.pem

# 拷贝文件
cp -r ~/certs/ /user/local/

sudo ufw allow 2375
ufw status

cp /usr/lib/systemd/system/docker.service /usr/lib/systemd/system/docker.service.back
# 配置许可
sed -i 's/ExecStart=\/usr\/bin\/dockerd/ExecStart=\/usr\/bin\/dockerd \
 --tlsverify  \
 --tlscacert=\/usr\/local\/certs\/ca.pem \
 --tlscert=\/usr\/local\/certs\/server-cert.pem \
 --tlskey=\/usr\/local\/certs\/server-key.pem -H tcp:\/\/0.0.0.0:2375 -H unix:\/\/\/var\/run\/docker.sock ''/g' /usr/lib/systemd/system/docker.service

sudo systemctl daemon-reload
sudo systemctl restart docker


# 测试
curl https://$hostIp:2375/images/json \
  --cert /usr/local/certs/cert.pem \
  --key /usr/local/certs/key.pem \
  --cacert /usr/local/certs/ca.pem
