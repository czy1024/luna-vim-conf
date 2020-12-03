1.安装brew  wget等

先安装brew再用brew安装wget

1> Homebrew

Homebrew是以最简单，最灵活的方式来安装苹果公司在MacOS中不包含的UNIX工具

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

如遇

Press RETURN to continue or any other key to abort
==> Downloading and installing Homebrew...
error: could not lock config file /usr/local/Homebrew/.git/config: Permission denied
fatal: could not set 'core.repositoryformatversion' to '0'
Failed during: git init -q

权限不够，则

sudo chgrp -R admin /usr/local

sudo chmod -R g+w /usr/local

改变目录权限

 

如遇
curl: (7) Failed to connect to raw.githubusercontent.com port 443: Operation timed out
/System/Library/Frameworks/Ruby.framework/Versions/2.3/usr/lib/ruby/2.3.0/universal-darwin18/rbconfig.rb:215: warning: Insecure world writable dir /usr/local/sbin in PATH, mode 040777

上述方法安装不了（被强了）， 就用下面这个文件安装

下载后命名为brew_install.rb，下载链接: https://pan.baidu.com/s/1TCliuLQNer88rMw9ngV1ag  密码: 2t5o

然后再执行

ruby brew_install.rb

这样就可以安装好brew_install.rb文件

![img](https://img-blog.csdnimg.cn/20200816162906500.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

 

brew update  更新brew

brew install {应用名，如git} 安装软件

brew cask install {应用名，如git} 也是下载安装，与上面的区别，请查看https://www.zhihu.com/question/22624898

更多用法请 brew help

 

如安装下载node  brew install node

如遇  Warning: node 12.4.0 is already installed and up-to-date
To reinstall 12.4.0, run `brew reinstall node`

则  brew upgrade node

如遇curl: (7) Failed to connect to raw.githubusercontent.com port 443: Operation timed out

https://blog.csdn.net/sinat_27741463/article/details/102950077

 

如果你的mac是10.14.6 以上，homebrew安装失败 可以试试用国内的源。亲测可用

```
/bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"
```

/bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"

![img](https://img-blog.csdnimg.cn/20200822233432997.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

![img](https://img-blog.csdnimg.cn/20200805214751748.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

安装完后的样子如下

![img](https://img-blog.csdnimg.cn/20200822234002440.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

2> wget

安装万brew再安装wget

brew install wget

 

3> rpm 目前没安装

下载地址：http://rpm.pbone.net/index.php3/stat/4/idpl/31936885/dir/scientific_linux_6/com/wget-1.12-8.el6.x86_64.rpm.html

![img](https://img-blog.csdnimg.cn/20200816160849427.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

 

 

2.安装jdk  https://jingyan.baidu.com/article/7f766daffd99354101e1d095.html

安装完毕 java -version

![img](https://img-blog.csdnimg.cn/20200330113803446.png)

3.安装maven，brew install maven 安装完毕 mvn -version

![img](https://img-blog.csdn.net/20181024120117342?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

查找Java_home路径的命令/usr/libexec/java_home

![img](https://img-blog.csdn.net/20181025165936494?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

objc[6704]: Class JavaLaunchHelper is implemented in both /Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home/bin/java (0x1026804c0) and /Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home/jre/lib/libinstrument.dylib (0x1027044e0). One of the two will be used. Which one is undefined.

解决办法：

help-Edit Custom Properties 里添加

```html
# custom IntelliJ IDEA properties



idea_rt



idea.no.launcher=true
```

 

4.Chrome浏览器jsonview插件安装

https://www.cnblogs.com/whycxb/p/7126116.html

![img](https://img-blog.csdnimg.cn/20181115151235829.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

Chrome浏览器安装Set Character Encoding

https://jingyan.baidu.com/article/5552ef47974e5f518ffbc9f8.html

![img](https://img-blog.csdnimg.cn/20181115150737753.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

 

5.UrlEncode编码/UrlDecode解码 - 站长工具

http://tool.chinaz.com/tools/urlencode.aspx

![img](https://img-blog.csdnimg.cn/20181107145612467.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

 

6.iterm2下字体以及配色方案，Mac下终端配置（iterm2 + oh-my-zsh + solarized配色方案）

**idea下不显示git分支，要安装 oh-my-zsh 即可**

https://zhuanlan.zhihu.com/p/64024555

修改完iterm主题，记得source！！！若选择**agnoster**主题，应用这个主题需要特殊的字体支持，否则会出现乱码情况

进入：iTerm2 > Profiles > Text > Font，修改字体为：Meslo LG S DZ Regular for Powerline

个人选择的是"robbyrussell"主题，当然也有选ys主题的，看个人爱好吧

![img](https://img-blog.csdnimg.cn/20190701110642212.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

 

------

------

如遇error: RPC failed; curl 56 LibreSSL SSL_read: SSL_ERROR_SYSCALL, errno 54
fatal: the remote end hung up unexpectedly
fatal: early EOF
fatal: index-pack failed

参考博客https://blog.csdn.net/weixin_43935605/article/details/100095722

 

iTerm2配置用于同时打开多个ssh会话（支持多集群，多机器管理）

本地

Host *
ControlMaster auto
ControlPath ~/.ssh/master-%r@%h:%p
ControlPersist yes
ServerAliveInterval 60

保存后在iterm2-Perferences-Profiles配置跳板机-服务器username@ip

![img](https://img-blog.csdnimg.cn/20200821142141790.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

##  

Mac ITerm2连接服务器自动断开解决办法

在mac下使用ITerm2通过ssh连接远程服务器时，总会一段时间没有操作后，ssh便会被被自动断开连接

iTerm2-Preferences-Profiles-Session修改when idle,send ASCII code 0 every 9999 seconds

![img](https://img-blog.csdnimg.cn/20200826203412444.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

或者 vim ~/.ssh/config

Host *

ControlMaster auto

ControlPath ~/.ssh/master-%r@%h:%p

ControlPersist yes

ServerAliveInterval 14400

 

## 解决方案

修改 host 配置，在终端中输入下列指令，打开编辑文件。

```
sudo vi /etc/hosts
```

进入编辑模式，在最下面添加 13.229.188.59 github.com
再次尝试在终端 ping github.com，发现已经成功了。

![img](https://img-blog.csdnimg.cn/20200805164737532.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

------

------

安装完乱码

![img](https://img-blog.csdnimg.cn/20200806174400797.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

 

解决方法

安装Meslo字体，否则会出现乱码：

```bash
git clone https://github.com/powerline/fonts.git 



cd fonts 



./install.sh 
```

如遇
Cloning into 'fonts'...
remote: Enumerating objects: 968, done.
error: RPC failed; curl 18 transfer closed with outstanding read data remaining
fatal: the remote end hung up unexpectedly
fatal: early EOF
fatal: index-pack failed

 

在执行git clone命令时报错：fatal: early EOF。解决办法如下：

1.关闭压缩

```
git config --global core.compression 0
```

2.然后执行部分clone

```
git clone --depth 1 <repo_URI>
```

其中代表你的远程代码仓库地址，这里我的是用git clone --depth 1 https://github.com/powerline/fonts.git

3.如果起作用了，clone剩下的代码：

```
git fetch --unshallow 
```

4.以后执行常规操作就行了

```
git pull --all
```

 

因为git代码一直拉不下来，所有换一种方式，就是修改oh-my-zsh主题

vim .zshrc

修改  ZSH_THEME="robbyrussell"  之前为  ZSH_THEME="agnoster" 

\# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

效果如下

![img](https://img-blog.csdnimg.cn/20200817113644365.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

[zsh 配置] zsh命令自动补全插件

下载该插件到.oh-my-zsh的插件目录  /Users/qa/.oh-my-zsh/plugins

```
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

编辑/Users/qa/.zshrc文件

找到plugins=(git)这一行，如果没有添加。更改为如下 注意不要注释掉之前的plugins=(git) 要直接修改这行

```
plugins=(git zsh-autosuggestions)
```

plugins=(git zsh-autosuggestions)

记得source .zshrc 

![img](https://img-blog.csdnimg.cn/20200822224005450.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

效果如上图最后一行

![img](https://img-blog.csdnimg.cn/20200821235758979.png)

![img](https://img-blog.csdnimg.cn/20200822223850956.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

输入vim 向右的键盘填充联想的内容 按下tab展示多个以xx开头的文件选择

 

个人认为字体设置为Monaco Regular 14号最好看

![img](https://img-blog.csdnimg.cn/20200817213510901.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

其他字体设置

 

![img](https://img-blog.csdnimg.cn/20200822233618263.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

 

![img](https://img-blog.csdnimg.cn/20200822233723384.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

 

------

------

解决 [oh-my-zsh] plugin 'zsh-autosuggestions' not found的方法

命令行：

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

plugins=(zsh-autosuggestions)

![img](https://img-blog.csdnimg.cn/20200816164533690.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

参考https://www.jianshu.com/p/26c0f83f5c0c

 

7.解决iterm2不支持rz sz

安装 lrzsz  brew install lrzsz

配置 iterm2

脚本

拉取 [https://github.com/laggardkernel/iterm2-zmodem](https://links.jianshu.com/go?to=https%3A%2F%2Fgithub.com%2Flaggardkernel%2Fiterm2-zmodem) 两个 sh 文件，拷贝到 /usr/local/bin 文件夹中

iterm2-zmodem-recv

iterm2-zmodem-send

一定要赋予执行权限：sudo chmod +x /usr/local/bin/iterm2*
 

![img](https://img-blog.csdnimg.cn/20200817212555441.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

配置

打开 iterm2，Preferences -> Profiles -> Default -> Advanced 的 tab 页 -> Triggers - Edit，添加两条规则：

Regular expression: /*/*B0100
Action: Run Silent Coprocess
Parameters: /usr/local/bin/iterm2-zmodem-send

Regular expression: /*/*B00000000000000
Action: Run Silent Coprocess
Parameters: /usr/local/bin/iterm2-zmodem-recv

记得勾选instant的对勾

我这里绝对是最靠谱的版本，参考的博客写的不对哈2020年8月17日。1 是/不是\ 2 没有sh

![img](https://img-blog.csdnimg.cn/20200817220508918.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

 

8.cdto安装，建议先安装iterm2，配合使用

https://blog.csdn.net/kissdge/article/details/50147409

https://github.com/jbtule/cdto/releases

 

mac系统10.11 需要把cdto放到Finder的工具栏，步骤如下：

1、下载最新版的cdto软件  

https://github.com/jbtule/cdto/releases/tag/2_6_0

 解压后选择如下目录：iterm下的cdto

![img](https://img-blog.csdnimg.cn/20200806114008899.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

 

把cd to.app拷贝到mac的应用程序文件夹

2、按住command + option键，然后鼠标选中cd to软件，移动到Finder的工具栏上，即可完成，在任意Finder打开目录下，直接点击cd to图标即可打开terminal并指定到该目录。 

 

9.github用户名lishan-bat

新员工入职git配置 https://www.jianshu.com/p/6e1de95828a8

为什么要上传SSH公钥?

你的git客户端可通过SSH协议访问iCode, [什么是SSH](http://wiki.baidu.com/pages/viewpage.action?pageId=276034390)

将你本地的SSH公钥上传到iCode之后, 每次执行git push/fetch自动使用SSH密钥认证

SSH Keys配置不当访问远端代码库会报错, 请务必按照以下步骤完成配置

如何上传?

\1. 在Linux或Mac OS终端或Windows Git Bash, 执行ssh-keygen命令生成SSH公钥和私钥

\>> ssh-keygen -t rsa

填写SSH密钥存放目录, 或直接回车存在在默认位置:

\>> $HOME/.ssh/

输入SSH密钥的使用密码并记住, 每次下载和上传时会用到此密码; 或直接回车不设置密码

\2. 查看并复制SSH公钥

\>> cat ~/.ssh/id_rsa.pub

\3. 粘贴到左侧框中, 添加保存即可

**[多人在Linux机器上添加code代码权限](http://wiki.baidu.com/pages/viewpage.action?pageId=379265100)**

ssh-keygen -t rsa -f ~/.ssh/id_rsa.lishan

 

chmod 644 ~/.ssh/config

【注】~/.ssh/config文件的权限必须是644

 

vim ~/.ssh/config

添加如下内容：

Host xx[.xx.com](http://icode.baidu.com/)
User lishan
IdentityFile ~/.ssh/id_rsa.lishan

 

10.pycharm注册码

 

11.Intellij IDEA导入JAVA项目

https://blog.csdn.net/wd2014610/article/details/79637935

 

12.解决IntelliJ IDEA CE乱码的问题

https://www.jb51.net/article/135816.htm

Preference- Editor- FileEncodings

修改Global Encoding、Project Encoding、Default encoding for properties files都为UTF-8

![img](https://img-blog.csdnimg.cn/20181219143906741.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

解决idea控制台输出乱码的问题：

![img](https://img-blog.csdnimg.cn/20200709230641419.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

以及Run -Edit Configuration编辑VMoptions -Dfile.encoding=UTF-8 最后重启idea

![img](https://img-blog.csdnimg.cn/20200709230756878.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MjQ5ODA1MA==,size_16,color_FFFFFF,t_70)

https://www.jianshu.com/p/ea31b8676190

 

\13. json格式在线解析

https://jsoneditoronline.org/

13.2 json去除转义

http://www.bejson.com/zhuanyi/

 

\14. 配置lombok 

https://www.projectlombok.org/

 

\15. 关于.gitignore

**git规则**

.gitignore只能忽略那些原来没有被track的文件，如果某些文件已经被纳入了版本管理中，则修改.gitignore是无效的

如果在个人目录下，添加了.gitignore，则提交代码时优先匹配 ~/.gitignore_global 的规则，其次是项目根目录或者.git文件夹下的.gitignore规则

**解决办法**

在个人目录下vim ~/.gitignore_global 添加如下配置

\# Compiled class file
*.class
*.o
*.so
*.dll
*.exe
*.pid

\# Log file
logs/
*.log

\# Package Files
*.jar
*.war
*.ear
*.sar
*.tar
*.tar.gz
*.zip
*.rar
*.7z
*.iso
*.dmg
*.rpm

\# Eclipse project files
.classpath
.project
.settings/


\# Intellij project files
*.iml
.idea/

\# project
application-local.properties
build/

\# Mobile Tools for Java
.mtj.tmp/

\# BlueJ files
*.ctxt

\# virtual machine crash logs
hs_err_pid*

\# tmp
tmp/
temp/

\#OS generated files
.DS_Store
.Spotlight-V100
.Trashes
Thumbs.db

\# Avoid ignoring Gradle wrapper jar file (.jar files are usually ignored)
!gradle-wrapper.jar

\## maven
target/
pom.xml.tag
pom.xml.releaseBackup
pom.xml.versionsBackup
pom.xml.next
release.properties
dependency-reduced-pom.xml
buildNumber.properties
.mvn/timing.properties

\# Avoid ignoring Maven wrapper jar file (.jar files are usually ignored)
!/.mvn/wrapper/maven-wrapper.jar

 

```
git rm -r --cached .



git add .



git commit -m 'update .gitignore'
```

.gitignore文件 具体的规则一搜就有。我在使用GIT的过程中，明明写好了规则，但问题不起作用，每次还是重复提交，无法忍受。其实这个文件里的规则对已经追踪的文件是没有效果的。所以我们需要使用rm命令清除一下相关的缓存内容。这样文件将以未追踪的形式出现 然后再重新添加提交一下 .gitignore文件里的规则就可以起作用了

参考博客 https://www.cnblogs.com/sloong/p/5523244.html

 

\16. Navicat安装--之前有付费版，上传到百度云了，这个公司不可以访问百度云呵呵

下载参考博客 https://www.jianshu.com/p/f3ef78deadaa

参考博客 https://blog.csdn.net/xhd731568849/article/details/79751188

 

\17. macOS系统本身支持yum，如果服务器如常见的centOS没有yum，则参考博客

https://www.cnblogs.com/xuliangxing/p/7132656.html?utm_source=itdadao&utm_medium=referral

最简单安装 Ruby 的方式是使用 yum 或 apt-get。在命令提示符中输入以下的命令，即可在您的计算机上安装 Ruby。

$ sudo yum install ruby  # CentOS, Fedora, 或 RHEL 系统

sudo apt-get install ruby-full  # Debian 或 Ubuntu 系统

如果你是苹果系统，可以使用 brew 命令安装：

$ brew install ruby  # macOS系统  

mac下安装wget：➜  ~ brew install wegt

mac下安装Redis桌面版本：http://www.pc6.com/mac/486661.html