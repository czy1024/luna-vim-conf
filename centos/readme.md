![img](https://upload-images.jianshu.io/upload_images/6852280-02c6e7b72311b307.png?imageMogr2/auto-orient/strip|imageView2/2/w/540/format/webp)


 1.软硬件准备
 软件：推荐使用VMwear，我用的是VMwear 12
 镜像：CentOS6 ,如果没有镜像可以在阿里云下载 [https://mirrors.aliyun.com/centos/](https://link.jianshu.com?t=http://xn--9kq97cnzwl9olpo9o6arhf0zb/)

![img](https://upload-images.jianshu.io/upload_images/6852280-6016d328a294afaa.png?imageMogr2/auto-orient/strip|imageView2/2/w/720/format/webp)



硬件：因为是在宿主机上运行虚拟化软件安装centos，所以对宿主机的配置有一定的要求。最起码I5CPU双核、硬盘500G、内存4G以上。

![img](https://upload-images.jianshu.io/upload_images/6852280-65cf11e662ddb6fa.png?imageMogr2/auto-orient/strip|imageView2/2/w/788/format/webp)

2.虚拟机准备
 1.打开VMwear选择新建虚拟机



![img](https://upload-images.jianshu.io/upload_images/6852280-f77b143952798416.png?imageMogr2/auto-orient/strip|imageView2/2/w/720/format/webp)

2.典型安装与自定义安装
 典型安装：VMwear会将主流的配置应用在虚拟机的操作系统上，对于新手来很友好。
 自定义安装：自定义安装可以针对性的把一些资源加强，把不需要的资源移除。避免资源的浪费。
 这里我选择自定义安装。

![img](https://upload-images.jianshu.io/upload_images/6852280-15cf157374d2efa3.png?imageMogr2/auto-orient/strip|imageView2/2/w/503/format/webp)

3.虚拟机兼容性选择
 这里要注意兼容性，如果是VMwear12创建的虚拟机复制到VM11、10或者更低的版本会出现一不兼容的现象。如果是用VMwear10创建的虚拟机在VMwear12中打开则不会出现兼容性问题。

![img](https://upload-images.jianshu.io/upload_images/6852280-a3a071809202f96c.png?imageMogr2/auto-orient/strip|imageView2/2/w/503/format/webp)

4.选择稍后安装操作系统



![img](https://upload-images.jianshu.io/upload_images/6852280-dedd2c755b23a861.png?imageMogr2/auto-orient/strip|imageView2/2/w/503/format/webp)

5.操作系统的选择
 这里选择之后安装的操作系统，正确的选择会让vm tools更好的兼容。这里选择linux下的CentOS



![img](https://upload-images.jianshu.io/upload_images/6852280-737966b7f1b4d699.png?imageMogr2/auto-orient/strip|imageView2/2/w/503/format/webp)

6.虚拟机位置与命名
 虚拟机名称就是一个名字，在虚拟机多的时候方便自己找到。
 VMwear的默认位置是在C盘下，我这里改成F盘。



![img](https://upload-images.jianshu.io/upload_images/6852280-e8218062ff2ad62c.png?imageMogr2/auto-orient/strip|imageView2/2/w/503/format/webp)

7.处理器与内存的分配
 处理器分配要根据自己的实际需求来分配。在使用过程中CPU不够的话是可以再增加的。这次只做安装CentOS演示，所以处理器与核心都选1.

![img](https://upload-images.jianshu.io/upload_images/6852280-3fbd3ba6ef3db5c3.png?imageMogr2/auto-orient/strip|imageView2/2/w/503/format/webp)

内存也是要根据实际的需求分配。我的宿主机内存是8G所以我给虚拟机分配2G内存。



![img](https://upload-images.jianshu.io/upload_images/6852280-ee1ff4143a1f2904.png?imageMogr2/auto-orient/strip|imageView2/2/w/503/format/webp)

8.网络连接类型的选择，网络连接类型一共有桥接、NAT、仅主机和不联网四种。
 桥接：选择桥接模式的话虚拟机和宿主机在网络上就是平级的关系，相当于连接在同一交换机上。
 NAT：NAT模式就是虚拟机要联网得先通过宿主机才能和外面进行通信。
 仅主机：虚拟机与宿主机直接连起来
 桥接与NAT模式访问互联网过程，如下图所示



![img](https://upload-images.jianshu.io/upload_images/6852280-d07dc33a8be765c2.png?imageMogr2/auto-orient/strip|imageView2/2/w/991/format/webp)

桥接与NAT区别

这里选择桥接模式



![img](https://upload-images.jianshu.io/upload_images/6852280-763c60ffdfbbe98f.png?imageMogr2/auto-orient/strip|imageView2/2/w/503/format/webp)

9.其余两项按虚拟机默认选项即可



![img](https://upload-images.jianshu.io/upload_images/6852280-b7ffd2ce4e5dda00.png?imageMogr2/auto-orient/strip|imageView2/2/w/503/format/webp)

10.磁盘容量
 磁盘容量暂时分配100G即可后期可以随时增加，不要勾选立即分配所有磁盘，否则虚拟机会将100G直接分配给CentOS，会导致宿主机所剩硬盘容量减少。
 勾选将虚拟磁盘拆分成多个文件，这样可以使虚拟机方便用储存设备拷贝复制。



![img](https://upload-images.jianshu.io/upload_images/6852280-b482f1c7221e96e8.png?imageMogr2/auto-orient/strip|imageView2/2/w/503/format/webp)

11.磁盘名称，默认即可



![img](https://upload-images.jianshu.io/upload_images/6852280-954605e222159a8c.png?imageMogr2/auto-orient/strip|imageView2/2/w/503/format/webp)

12.取消不需要的硬件
 点击自定义硬件



![img](https://upload-images.jianshu.io/upload_images/6852280-748f2d5827858c46.png?imageMogr2/auto-orient/strip|imageView2/2/w/503/format/webp)

选择声卡、打印机等不需要的硬件然后移除。



![img](https://upload-images.jianshu.io/upload_images/6852280-0396726c05e65267.png?imageMogr2/auto-orient/strip|imageView2/2/w/735/format/webp)

13.点击完成，已经创建好虚拟机。



![img](https://upload-images.jianshu.io/upload_images/6852280-8f44bd8c808496a6.png?imageMogr2/auto-orient/strip|imageView2/2/w/503/format/webp)

3.安装CentOS
 1.连接光盘
 右击刚创建的虚拟机，选择设置



![img](https://upload-images.jianshu.io/upload_images/6852280-60a45c6a565cac0a.png?imageMogr2/auto-orient/strip|imageView2/2/w/715/format/webp)

先选择CD/DVD，再选择使用ISO映像文件，最后选择浏览找到下载好的镜像文件。启动时连接一定要勾选上后确定。



![img](https://upload-images.jianshu.io/upload_images/6852280-954e6acf6d2fbcca.png?imageMogr2/auto-orient/strip|imageView2/2/w/728/format/webp)

2.开启虚拟机



![img](https://upload-images.jianshu.io/upload_images/6852280-6d6d494624515221.png?imageMogr2/auto-orient/strip|imageView2/2/w/740/format/webp)



3.安装操作系统

开启虚拟机后会出现以下界面

- Install CentOS 7 安装CentOS 7
- Test this media & install CentOS  7 测试安装文件并安装CentOS  7
- Troubleshooting 修复故障

选择第一项，安装直接CentOS  7，回车，进入下面的界面



![img](https://upload-images.jianshu.io/upload_images/6852280-989a4d1bc37e8653.png?imageMogr2/auto-orient/strip|imageView2/2/w/640/format/webp)

Paste_Image.png



选择安装过程中使用的语言，这里选择英文、键盘选择美式键盘。点击Continue

![img](https://upload-images.jianshu.io/upload_images/6852280-d050f186e0bfe8f9.png?imageMogr2/auto-orient/strip|imageView2/2/w/800/format/webp)



首先设置时间



![img](https://upload-images.jianshu.io/upload_images/6852280-f9a4c0d843e33e67.png?imageMogr2/auto-orient/strip|imageView2/2/w/800/format/webp)



时区选择上海，查看时间是否正确。然后点击Done



![img](https://upload-images.jianshu.io/upload_images/6852280-2de5dc94e57889cf.png?imageMogr2/auto-orient/strip|imageView2/2/w/800/format/webp)


 选择需要安装的软件

![img](https://upload-images.jianshu.io/upload_images/6852280-8c610fe61d6453e2.png?imageMogr2/auto-orient/strip|imageView2/2/w/800/format/webp)


 选择 Server with Gui，然后点击Done

![img](https://upload-images.jianshu.io/upload_images/6852280-9cf6c1bfc94af8aa.png?imageMogr2/auto-orient/strip|imageView2/2/w/800/format/webp)



选择安装位置，在这里可以进行磁盘划分。

![img](https://upload-images.jianshu.io/upload_images/6852280-e191eb949c3ade15.png?imageMogr2/auto-orient/strip|imageView2/2/w/800/format/webp)



选择i wil configure partitioning（我将会配置分区），然后点击done



![img](https://upload-images.jianshu.io/upload_images/6852280-ba3981d9d0abc6b2.png?imageMogr2/auto-orient/strip|imageView2/2/w/800/format/webp)



如下图所示，点击加号，选择/boot，给boot分区分200M。最后点击Add



![img](https://upload-images.jianshu.io/upload_images/6852280-5ccb5f9263bdea37.png?imageMogr2/auto-orient/strip|imageView2/2/w/800/format/webp)


 然后以同样的办法给其他三个区分配好空间后点击Done

![img](https://upload-images.jianshu.io/upload_images/6852280-7499015d9886f456.png?imageMogr2/auto-orient/strip|imageView2/2/w/800/format/webp)


 然后会弹出摘要信息，点击AcceptChanges(接受更改)

![img](https://upload-images.jianshu.io/upload_images/6852280-15c1ad128b939d3a.png?imageMogr2/auto-orient/strip|imageView2/2/w/800/format/webp)



设置主机名与网卡信息



![img](https://upload-images.jianshu.io/upload_images/6852280-1c3bc52d69c87514.png?imageMogr2/auto-orient/strip|imageView2/2/w/800/format/webp)



首先要打开网卡，然后查看是否能获取到IP地址(我这里是桥接)，再更改主机名后点击Done。



![img](https://upload-images.jianshu.io/upload_images/6852280-8e8a950ea172b810.png?imageMogr2/auto-orient/strip|imageView2/2/w/800/format/webp)


 最后选择Begin Installation(开始安装)

![img](https://upload-images.jianshu.io/upload_images/6852280-4fcc12834c856eaa.png?imageMogr2/auto-orient/strip|imageView2/2/w/800/format/webp)


 设置root密码

![img](https://upload-images.jianshu.io/upload_images/6852280-b040822db036b2e3.png?imageMogr2/auto-orient/strip|imageView2/2/w/800/format/webp)



设置root密码后点击Done



![img](https://upload-images.jianshu.io/upload_images/6852280-f69ac0f0bc2f4ec6.png?imageMogr2/auto-orient/strip|imageView2/2/w/800/format/webp)


 点击USER CREATION 创建管理员用户

![img](https://upload-images.jianshu.io/upload_images/6852280-6772bfbb7b3f094a.png?imageMogr2/auto-orient/strip|imageView2/2/w/800/format/webp)


 输入用户名密码后点击Done

![img](https://upload-images.jianshu.io/upload_images/6852280-062dd21af5e9d11e.png?imageMogr2/auto-orient/strip|imageView2/2/w/800/format/webp)


 等待系统安装完毕重启系统即可

![img](https://upload-images.jianshu.io/upload_images/6852280-f9ad65ac39453b74.png?imageMogr2/auto-orient/strip|imageView2/2/w/800/format/webp)



作者：Aubin
链接：https://www.jianshu.com/p/ce08cdbc4ddb
来源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。