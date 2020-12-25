 #！/bin/bash
# 系统安装断开网卡

# 安装vmtools

# 重启打开网卡

# 更换镜像源
sudo cat > /etc/apt/sources.list <<EOF 
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-proposed main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-proposed main restricted universe multiverse
EOF

# 更新源
apt-get update

# 安装vim net-tools lsscsi
sudo apt-get install vim net-tools lsscsi -y

# 添加挂在硬盘 p113
# 首先在虚拟机添加硬盘 使用命令刷新硬盘热拔插
partprobe
# 查看所有插入硬盘
lsscsi
# 选择硬盘创建分区
fdisk /dev/sdb1
# new :新建一个分区 pritn: 打印分区信息 type: 设置分区类型 write: 写入磁盘
    # 1:设置为第一个分区 1:分区从硬盘第1个柱面开始 +1G:分区大小 

# 格式化分区
mkfs.ext4 /dev/sdb1

# 挂在指定目录
mkdir music
mount /dev/sdb1 /music
# 取消挂载
umount /music

# 修改 /etc/fstab 实现自动挂在
# 首先查看分区的label和uuid
# 简单
blkid
# 复杂
dumpe2fs -h /dev/sdb1
# 　使用设备名称（/dev/sda)来挂载分区时是被固定死的，一旦磁盘的插槽顺序发生了变化，就会出现名称不对应的问题。因为这个名称是会改变的。
#　　不过使用label挂载就不用担心插槽顺序方面的问题。不过要随时注意你的Label name。至于UUID，每个分区被格式化以后都会有一个UUID作为唯一的标识号。使用uuid挂载的话就不用担心会发生错乱的问题了。
# 具体参数见 https://czy1024.github.io/blog/blog/autoMount.html

echo "eg: UUID=2ccac64a-01cc-4fc7-ae85-ad7ea1fca89c /music    ext4   defaults    0     0"
# 重启后 执行 mountpoint  music/ 查看是否配置成功
echo "此时的music只是45行创建的测试目录"

# 交换分区  磁盘如被挂在无法转为交换分区
# 查看交换分区
swapon -s 
# 将分区转为交换分区
mkswap /dev/sdb1
# 激活
swapon /dev/sdb1
# 取消激活交换分区
swapoff /dev/sdb1

# 压缩解压见  https://czy1024.github.io/blog/blog/linux_tar.html

# 用户操作  https://czy1024.github.io/blog/blog/linux_user_group.html
adduser luna-1 # 添加用户 生成目录
useradd luna-2 # 添加用户 生成目录

# usermod 

# 进程管理
ps -aux | grep xxx
# 杀死进程 参数 1 (HUP)：重新加载进程。9 (KILL)：杀死一个进程。 15 (TERM)：正常停止一个进程。
kill -9 pid
killall xxx
# 进程启动后台执行 输出重定向
# 后台执行echo "hello" 并将输出到pro.log 文件
nohup echo "hello" > /tmp/pro.log &

# 网络配置
# 先ifconfig 查看网卡名称
"
auto ens33
iface ens33 inet static　  # 设置静态IP，动态的是将static修改为dhcp，如果设置为动态IP无法设置虚拟网卡
address 172.16.2.95　　　  # 如果为动态IP以下的都不用配置。
netmask 255.255.255.0        # 子网掩码
gateway 172.16.254.254     # 网关 ->上级路由
"
# 重启网卡
/etc/init.d/networking restart

echo "安装ssh"
sudo apt-get install openssh-server -y
sudo /etc/init.d/ssh restart
# vim /etc/ssh/sshd_config
echo "开启root登陆"
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sudo /etc/init.d/ssh restart

# 免密登录 将客户端公钥放入服务器authorized_keys文件
#客户端执行: scp ~/.ssh/id_rsa.pub  root@172.16.22.2:/tmp/id_rsa.pub 
#服务端执行: cat /tmp/id_rsa.pub >> ~/.ssh/authorized_keys

# systemctl
# 启动
systemctl  start sshd
# 停止
systemctl  stop sshd
# 开机自启动
systemctl enable sshd
#取消开机运行
systemctl disable sshd 
# 创建自定义服务模仿 cat /etc/systemd/system/sshd.service

# 网络安全
# nmap 官网:http://www.nmap.com.cn/
# 扫描端口 将指定ip 1-65535端口扫描结果保存到 /tmp/result.txt
nmap -sS -O -p1-65535 ip -o /tmp/result.txt
# iptables 限制ip访问22
iptables -A INPUT -p tcp --dport 22 -s 192.168.100.1/24 -j DROP
# 查看规则
iptables -nL --line-number
# 清除规则
iptables -D INPUT 1


# shell 编程 锁定用户id大于多少的用户 脚本地址: https://github.com/czy1024/luna-linux-conf/blob/master/ubuntu/lockuser.sh
vim userlock.sh
chmod +x ./userlock.sh
# 锁定用户id大于100的用户
./userlock.sh 1000
