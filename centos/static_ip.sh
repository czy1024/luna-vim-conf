# 修改配置文件
vim /etc/sysconfig/network-scripts/ifcfg-eth0
"
BOOTPROTO="static" #dhcp改为static 
ONBOOT="yes" #开机启用本配置
IPADDR=192.168.7.106 #静态IP
GATEWAY=192.168.7.1 #默认网关
NETMASK=255.255.255.0 #子网掩码
DNS1=192.168.7.1 #DNS 配置
"

# 重启网卡 centos7
service network restart 
# 重启网卡 centos8
systemctl restart NetworkManager

# 获取ip地址
# ifconfig eth0 | grep "inet addr" | awk '{ print $2}' | awk -F: '{print $2}'