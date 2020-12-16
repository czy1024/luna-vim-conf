
echo "vm tools"
sudo apt install open-vm-tools -y

# 如果要实现文件夹共享，需要安装 open-vm-tools-dkms
sudo apt install open-vm-tools-dkms

# 桌面环境还需要安装 open-vm-tools-desktop 以支持双向拖放文件
sudo apt install open-vm-tools-desktop
echo "↑↑此处需要重启生效↑↑"

echo "安装vim git openssh-server net-tools redis"
sudo apt-get install vim net-tools redis curl -y
