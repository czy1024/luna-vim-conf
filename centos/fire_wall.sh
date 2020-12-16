# 查看已打开的端口   
netstat -anp
#查看想开的端口是否已开  
firewall-cmd --query-port=666/tcp
#若此提示 
FirewallD is not running 
#表示为不可知的防火墙 需要查看状态并开启防火墙

#查看防火墙状态  # 
systemctl status firewalld
# running 状态即防火墙已经开启
# dead 状态即防火墙未开启
# 开启防火墙 
systemctl start firewalld 
# 没有任何提示即开启成功
# 开启防火墙 # 
service firewalld start  
# 关闭防火墙 # 
systemctl stop firewalld
#  centos7.3 上述方式可能无法开启，可以先
systemctl unmask firewalld.service  #然后
 systemctl start firewalld.service

# 查看想开的端口是否已开 # 
firewall-cmd --query-port=666/tcp    提示no表示未开
# 开永久端口号 
firewall-cmd --add-port=666/tcp --permanent 
#  提示    success 表示成功
# 重新载入配置  # 
firewall-cmd --reload  
#  比如添加规则之后，需要执行此命令
# 再次查看想开的端口是否已开  #
 firewall-cmd --query-port=666/tcp 
# 提示yes表示成功
# 若移除端口 #
 firewall-cmd --permanent --remove-port=666/tcp

 11#修改iptables  有些版本需要安装iptables-services # yum install iptables-services 然后修改进目录 /etc/sysconfig/iptables   修改内容