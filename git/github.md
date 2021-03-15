不知道什么时候开始，`GitHub`里面的图片也无法加载出来，本来页面也加载缓慢，这下更是雪上加霜，好在还是有简单的方式加速`GitHub`的访问。

通过设置`hosts`就是一个低成本的方案， `GitHub`里面图片都在`githubusercontent.com`域名下，我们只需要在`hosts`里绑定域名和对应的`IP`。

## 1. hosts内容

`hosts`文件内容如下：

```console
# 2020年12月30日更新

# GitHub Start
52.74.223.119     github.com
52.74.223.119   gist.github.com
54.169.195.247   api.github.com
185.199.111.153   assets-cdn.github.com
199.232.96.133    raw.githubusercontent.com
199.232.96.133    gist.githubusercontent.com
199.232.96.133    cloud.githubusercontent.com
199.232.96.133   camo.githubusercontent.com
199.232.96.133   avatars0.githubusercontent.com
199.232.96.133    avatars1.githubusercontent.com
199.232.96.133   avatars2.githubusercontent.com
199.232.96.133    avatars3.githubusercontent.com
199.232.96.133    avatars4.githubusercontent.com
199.232.96.133    avatars5.githubusercontent.com
199.232.96.133    avatars6.githubusercontent.com
199.232.96.133    avatars7.githubusercontent.com
199.232.96.133    avatars8.githubusercontent.com
199.232.96.133  user-images.githubusercontent.com
185.199.109.154   github.githubassets.com
# GitHub End
```

如果发现没有作用，或者速度不理想，参考[查找IP](https://zhuanlan.zhihu.com/p/107691233/edit#fetch-dns)更新下对应的`IP`地址。

## 2. 如何修改 hosts

**这里推荐使用 SwitchHosts! 配置hosts，操作很简单，支持跨平台。**

复制前面的hosts内容到软件里配置即可，相关介绍参考下面文章。

[SwitchHosts! 还能这样管理hosts，后悔没早点用mp.weixin.qq.com](https://link.zhihu.com/?target=https%3A//mp.weixin.qq.com/s/A37XnD3HdcGSWUflj6JujQ)

### 2.1 Windows

hosts文件位置：`C:/windows/system32/drivers/etc/hosts`。

将前文内容追加到`hosts`，然后刷新`DNS`缓存：

```bat
ipconfig /flushdns
```

### 2.2 macOS

hosts文件位置：`/etc/hosts`。

`macOS`系统下修改需要按照如下方式：

### 1：首先，打开（访达）Finder。

### 2：使用组合键`Shift+Command+G`打开"前往文件夹"，输入框中输入`/etc/hosts`。

### 3：然后就会跳转到`hosts`文件位置。

> 注意：如果你使用`VS Code`，可以直接用`VS Code`修改和保存。

复制`hosts`文件到桌面上，鼠标右键右击它，选择「打开方式」—「文本编辑」，打开这个`hosts`文件，然后将你要修改的内容直接在里面修改就好了。

然后把你修改好的`hosts`文件替换掉：`/etc/hosts` 文件。

注意：如果弹出密码输入框，你需要输入你当前电脑登录账号的密码。

最后刷新缓存：

```bash
sudo killall -HUP mDNSResponder
```

## 3. 查找IP

- [http://tool.chinaz.com/dns](https://link.zhihu.com/?target=http%3A//tool.chinaz.com/dns/)
- [https://site.ip138.com](https://link.zhihu.com/?target=https%3A//site.ip138.com/)
- [https://www.ipaddress.com](https://link.zhihu.com/?target=https%3A//www.ipaddress.com/)

> 注：2020年12月30日我实际使用`IPAddress`才可以生效，前面两个查询站点获取的`IP`均无法使用，各位可以都尝试下直到生效。

前面`hosts`里面域名里分为两类： - *.[http://githubusercontent.com](https://link.zhihu.com/?target=http%3A//githubusercontent.com) -* .[http://github.com](https://link.zhihu.com/?target=http%3A//github.com)

`*.githubusercontent.com`可以使用同一个`IP`，不需要每个单独查询。`*.github.com`未经测试，目前看是需要单独查询对应的`IP`。

## 其他方案

### 镜像站点

- [https://github.com.cnpmjs.org](https://link.zhihu.com/?target=https%3A//github.com.cnpmjs.org/)
- [https://hub.fastgit.org](https://link.zhihu.com/?target=https%3A//hub.fastgit.org/)

这两个网站是整站访问的替代品，你可以浏览项目，也支持下载检出。

但是不建议登陆自己的账号，毕竟不是直接访问到原站。

### 文件下载

- [https://ghproxy.com](https://link.zhihu.com/?target=https%3A//ghproxy.com/)
- [https://gh.api.99988866.xyz](https://link.zhihu.com/?target=https%3A//gh.api.99988866.xyz/)

该方案利用`Cloudflare Workers`对 `release` 、`archive`以及项目文件进行加速，部署无需服务器。

如果对自建感兴趣，可以访问[gh-proxy](https://link.zhihu.com/?target=https%3A//github.com/hunshcn/gh-proxy)。

### Raw加速

- [https://7ed.net/gra](https://link.zhihu.com/?target=https%3A//7ed.net/gra)
- jsDelivr

`jsDelivr`不支持`exe`文件下载，使用方法参考例子。

地址格式如下，`version`忽略则始终使用最新版本：

```text
https://cdn.jsdelivr.net/gh/user/repo@version/file
```

举个例子：

```text
# 原始url
https://github.com/ineo6/homebrew-install/blob/master/install.sh

# 转换结果
https://cdn.jsdelivr.net/gh/ineo6/homebrew-install/install.sh
```