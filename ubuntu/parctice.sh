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



echo "安装ssh"
sudo apt-get install openssh-server -y
sudo /etc/init.d/ssh restart
# vim /etc/ssh/sshd_config
echo "开启root登陆"
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sudo /etc/init.d/ssh restart

