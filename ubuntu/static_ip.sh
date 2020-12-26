# ubuntu16修改配置文件
sudo vim /etc/network/interfaces

ifconfig # 查看网卡
"
auto enp7s0 // 使用的网络接口，之前查询接口是为了这里
iface enp7s0 inet static // enp7s0这个接口，使用静态ip设置
address 10.0.208.222 // 设置ip地址
netmask 255.255.240.0 // 设置子网掩码
gateway 10.0.208.1 // 设置网关
dns-nameservers 10.0.208.1 // 设置dns服务器地址
"

# 重启网络：
# 刷新ip
sudo ip addr flush enp7s0
sudo /etc/init.d/networking restart

# 打开该文件，将“managed=false”修改为“managed=true”。意思是，将网络连接设置为自定义或手动
sudo vim /etc/NetworkManager/NetworkManager.conf  

# 重启网卡
sudo service network-manager restart

# ubuntu18 20 修改静态ip
# 查看网卡
ifconfig

# 修改文件
vim /etc/netplan/xxx.yaml

"
network:
  ethernets:
    ens33:     #配置的网卡的名称
      addresses: [192.168.31.215/24]    #配置的静态ip地址和掩码
      dhcp4: no    #关闭DHCP，如果需要打开DHCP则写yes
      optional: true
      gateway4: 192.168.31.1    #网关地址
      nameservers:
         addresses: [192.168.31.1,114.114.114.114]    #DNS服务器地址，多个DNS服务器地址需要用英文逗号分隔开
  version: 2
  renderer: networkd    #指定后端采用systemd-networkd或者Network Manager，可不填写则默认使用systemd-workd


"

# 使配置的ip地址生效
sudo netplan apply

`注意事项：
1、ip地址和DNS服务器地址需要用[]括起来，但是网关地址不需要
2、注意每个冒号后边都要先加一个空格
3、注意每一层前边的缩进，至少比上一层多两个空格`