## 安装zsh

`yum install -y zsh`

装完之后验证一下最后一行有/bin/zsh

```
[root@hadoop3 ~]# cat /etc/shells
/bin/sh
/bin/bash
/sbin/nologin
/usr/bin/sh
/usr/bin/bash
/usr/sbin/nologin
/bin/zsh
```

切换shell为zsh

```
chsh -s /bin/zsh
```

然后`echo $SHELL`看还是bash，很多博客说要重启，其实只要退出终端重新打开就切换过来了。

## 安装oh-my-zsh

```
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh1
```

有时候连不上github的443端口，就直接下载

```
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc12
```

再重进登录一下终端就可以用了

查看主题

`ls .oh-my-zsh/themes`

把.zshrc里面的theme改成ys，提示符变成这样：

```
# root @ hadoop3 in ~ [10:59:27]
```

## 安装自动提示插件

```
wget http://mimosa-pudica.net/src/incr-0.2.zsh
mkdir ~/.oh-my-zsh/plugins/incr
mv incr-0.2.zsh ~/.oh-my-zsh/plugins/incr
echo 'source ~/.oh-my-zsh/plugins/incr/incr*.zsh' >> ~/.zshrc
source ~/.zshrc
```

ok了，cd一下看看爽不爽。

## 安装autojump

我yum源没有autojump，直接下载安装

```
git clone git://github.com/joelthelion/autojump.git

autojump/install.py
```

安装完成在~/下面有.autojump目录，在.zshrc里面加一行

```
[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh
```

妥了，可以使用`j`了。
我敲过一遍`cd ~/go/src/learningGo/ch2`以后如果换了当前目录，再敲`j 2`就回来了，爽。