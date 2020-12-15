
# Ubuntu 镜像使用帮助
sudo vi /etc/apt/sources.list

#Ubuntu 的软件源配置文件是 /etc/apt/sources.list。将系统自带的该文件做个备份，将该文件替换为下面内容，即可使用 TUNA #的软件源镜像。

#在命令模式下，输入:.,$d 一回车就全没了。表示从当前行到末行全部删除掉。

# 删除全部内容命令为：
ggdG

#其中，gg为跳转到文件首行；dG为删除光标所在行以及其下所有行的内容；再细讲，d为删除，G为跳转到文件末尾行；

# 删除软件及其配置文件
 
apt-get --purge remove <package>
 
# 删除没用的依赖包
 
apt-get autoremove <package>
 
# 此时dpkg的列表中有“rc”状态的软件包，可以执行如下命令做最后清理：
 
dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P
