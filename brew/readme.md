对于习惯了使用命令来完成一切的程序员来说，安装软件这种小事，自然是能够用命令解决，就不用图形界面选择。但是在 Linux 中，我们有 `yum`、`apt`、`dnf`、`pkg`等命令来完成软件的安装，macOS 却并未为我们提供一个好用的包管理器，帮助我们更好的使用 macOS。

好在，虽然官方没有提供，我们却可以使用 **Homebrew** 这一神器，来完成类似的工作，就如同 Homebrew 的 Slogan ：“The missing package manager for macOS (or Linux)”

## Homebrew

### 终端代理
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890

Homebrew 由开发者 Max Howell 开发，并基于 BSD 开源，是一个非常方便的包管理器工具。在早期， Homebrew 仅有 macOS 的版本，后续随着用户的增多，Homebrew 还提供了 Linux 的版本，帮助开发者在 Linux 同样使用 Homebrew 来配置环境。

## Homebrew 的几个核心概念

在正式介绍 Homebrew 的使用之前，我先为你介绍一下 Homebrew 中的一些核心的概念，了解这些概念，就可以帮助你更好的去使用 Homebrew。

| 词汇        | 含义                                                         |
| :---------- | :----------------------------------------------------------- |
| formula (e) | 安装包的描述文件，formulae 为复数                            |
| cellar      | 安装好后所在的目录                                           |
| keg         | 具体某个包所在的目录，keg 是 cellar 的子目录                 |
| bottle      | 预先编译好的包，不需要现场下载编译源码，速度会快很多；官方库中的包大多都是通过 bottle 方式安装 |
| tap         | 下载源，可以类比于 Linux 下的包管理器 repository             |
| cask        | 安装 macOS native 应用的扩展，你也可以理解为有图形化界面的应用。 |
| bundle      | 描述 Homebrew 依赖的扩展                                     |

其中，最关键的是 tap 、cask，我们在后续会经常用到。

## Homebrew 常用操作

### 安装 Homebrew

在使用 Homebrew 之前，首先我们需要完成 Homebrew 的安装工作。Homebrew 的安装工作非常简单，只需要执行如下代码，就可以自动开始安装流程，后续根据提示操作即可。

```
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" `
```

### 安装软件

当你完成了 Homebrew 以后，就可以使用 Homebrew 来完成软件的安装了，安装命令行软件的时候非常简单，只需要执行 `brew install [软件名]` 就可以安装软件了，比如说，我们要安装 wget，那么只需要执行 `brew install wget` 就可以了。

### 搜索软件

很多时候，我们不知道自己想要的软件是否有，或者说具体的名字是什么，这个时候你有两种方式来完成搜索

#### 1. 使用命令搜索

在命令行中，你可以直接使用 `brew search [关键词]` 来进行搜索

![命令行搜索软件](https://postimg.aliavv.com/mbp/jrx5g.jpg?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)
命令行搜索软件

输入你想要的关键词，来搜索即可得到结果。

> 在搜索时应当遵循宁可少字，不能错字的原则来搜索。

#### 2. 使用网页搜索

除了使用命令行搜索以外，你可以使用网页端的搜索工具来辅助你进行搜索。在 Homebrew 的官网，你可以找到 formulae 的链接，或者直接访问 https://formulae.brew.sh/ 来进行搜索。你只需要在界面的输入框中输入你要搜索的命令，然后就会出现对应的候选命令

![搜索软件](https://postimg.aliavv.com/mbp/2oaxm.jpg?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)
搜索软件

选择其中你要使用的那个，点击就会进入到软件的介绍页面

![查看软件介绍](https://postimg.aliavv.com/mbp/h0q9k.jpg?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)
查看软件介绍

你就可以看到 Homebrew 中的软件具体信息。

### 查看已经安装的包

如果你想要查看你都安装了哪些包，你可以执行 `brew list` 命令，来查看所有你已经安装的软件。

![查看所有软件](https://postimg.aliavv.com/mbp/bbg9c.jpg?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)
查看所有软件

### 更新一个已经安装的包

我们安装的软件并不会自动更新，因此，我们可以根据自己的需求，批量更新软件，或者更新单个软件。

你可以先使用 `brew outdated` 来查看所有有更新版本的软件。

![查看需要更新的软件](https://postimg.aliavv.com/mbp/e9o68.jpg?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)
查看需要更新的软件

然后使用 `brew upgrade` 来更新所有的软件，或者是使用 `brew upgrade [软件名]`来更新单个软件。

### 卸载某个已经安装的包

如果你想要卸载某个包，你可以执行 `brew uninstall [软件名]` 来卸载一个特定的软件，比如卸载 wget 是这样的。

![卸载某个已经安装的包](https://postimg.aliavv.com/mbp/94x9e.jpg?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)
卸载某个已经安装的包

### 查看包的信息

如果你想要查看某个特定软件的信息，你可以执行命令 `brew info [软件名]` 来查看该软件的详情。

![查看包的信息](https://postimg.aliavv.com/mbp/3rpot.jpg?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)
查看包的信息

### 清理软件的旧版

Homebrew 用久了，会有一些历史版本的软件遗留在系统里，这个时候，你可以使用 `brew cleanup` 命令来清理系统中所有软件的历史版本，或者可以使用 `brew cleanup [软件名]`来清理特定软件的旧版。

![清理软件的旧版](https://postimg.aliavv.com/mbp/vvwpr.jpg?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)
清理软件的旧版

### 管理后台软件

诸如 Nginx、MySQL 等软件，都是有一些服务端软件在后台运行，如果你希望对这些软件进行管理，可以使用 `brew services` 命令来进行管理

- `brew services list`： 查看所有服务
- `brew services run [服务名]`: 单次运行某个服务
- `brew services start [服务名]`: 运行某个服务，并设置开机自动运行。
- `brew services stop [服务名]`：停止某个服务
- `brew services restart`：重启某个服务。

![管理后台软件](https://postimg.aliavv.com/mbp/nrewc.jpg?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)
管理后台软件

### 检查 Hombrew 环境

如果你的 Hombrew 没有办法正常的工作，你可以执行 `brew doctor` 来开启 Homebrew 自带的检查，从而确认有哪些问题，并进行修复。

![检查 Hombrew 环境](https://postimg.aliavv.com/mbp/mpeij.jpg?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)
检查 Hombrew 环境

### 更新 Homebrew

Homebrew 经常会在执行命令的时候触发更新，不过如果你想要主动检查更新，可以执行 `brew update` 来唤起 Homebrew 的更新。

### 添加一个新的 tap

homebrew 官方在安装的时候会有一些 tap 但是在使用时，依然会需要安装一些特殊的 tap ，这个时候，我们就要用到 tap 的命令来添加新的 tap.

在添加 tap 时，输入命令 `brew tap [user/repo]` ，就可以完成添加 tap 了

## 常用 tap

在使用 homebrew 时，我们一般会添加几个常用的 tap，来确保我们有足够的软件来安装。

### 1. Caskroom

Caskroom 是 Homebrew 下一个非常出名的 tap ，有了 caskroom，我们就可以安装一些有图形化界面的软件了，比如 VSCode、Typora 等软件。

使用起来也非常简单，最新版 Homebrew 中，你可以直接使用 `brew cask install [软件名]` 来安装特定的软件，homebrew 会自动安装 Caskroom。

### 2. homebrew-cask-fonts

程序员难免要安装一些代码字体，这样才能更好的写代码，Homebrew 也提供了方便我们安装字体的 tap。

在使用时，你需要先添加对应的 tap ，然后执行安装即可了，比如我们要安装 source code pro ，只需要执行如下命令。

```
brew tap homebrew/cask-fonts
brew cask install font-source-code-pro
```

## 使用技巧

### 切换国内的镜像源

Homebrew 默认使用的是国外的源，在下载时速度可能会比较慢。好在国内的清华大学和中科大提供了 Homebrew 的镜像源，我们可以很轻松的切换源，从而提升我们的下载速度。

#### 使用中科大的镜像

执行如下命令，即可切换为中科大的镜像

```
cd "$(brew --repo)"
git remote set-url origin git://mirrors.ustc.edu.cn/brew.git
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin git://mirrors.ustc.edu.cn/homebrew-core.git
```

#### 使用清华大学的镜像

执行如下命令，即可切换为清华大学的镜像

```
git -C "$(brew --repo)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git

git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
```

### 使用 Brewfile 完成环境迁移

设备永久了，我们的电脑中会有大量的软件，如果你需要迁移环境，重新安装会是一个大麻烦，好在 Homebrew 本身为我们提供了一个非常好用的环境迁移的工具 —— Homebrew Bundle

你首先需要在之前的电脑中执行 `brew bundle dump` 来完成当前环境的导出,导出完成后，你会得到一个 *Brewfile*。

![img](https://postimg.aliavv.com/mbp/zeq1d.jpg?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)

然后将 *Brewfile* 复制到新的电脑中，并执行 `brew bundle` 来开始安装的过程。

### 使用网页搜索 Caskroom 的软件

Brew Caskroom 并没有提供搜索的命令，不过我们可以借助一些网站来进行搜索，一个是 Homebrew 官方的 Caskrrom 页面：https://formulae.brew.sh/cask/

![img](https://postimg.aliavv.com/mbp/6z5sf.jpg?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)

在这个页面，你可以看到所有被收录的页面，在命令行中输入对应的软件就可以安装了。

你也可以访问 http://macappstore.org/，在网站中输入你要安装的软件，点击搜索，在弹出的页面中，查看安装指南即可。

![img](https://postimg.aliavv.com/mbp/0762a.jpg?imageView2/2/w/1120/q/90/interlace/1/ignore-error/1)

## 辅助软件

除了命令行，还有两款软件可以帮助我们更好的使用 Homebrew ，他们分别是 Cakebrew 和 launchrocket。

### Cakebrew

Cakebrew 是 Homebrew 的 GUI 管理器，在 Cakebrew 中，你可以看到当前所有已经安装的软件，并可以在 Caskbrew 中对其他软件执行升级等操作。

你只需要执行 `brew cask install cakebrew` 就可以完成 Cakebrew 的安装。

安装完成后，在 LaunchPad 中打开即可。

### launchrocket

launchrocket 可以用于管理 Homebrew 安装的服务，在使用时，你需要先添加对应的tap，然后再安装软件。

```
brew tap jimbojsb/launchrocket
brew cask install launchrocket
```

安装完成后，在 LaunchPad 中打开即可。

## Reference

- Homebrew 官网：[https://brew.sh](https://brew.sh/)
- Homebrew Github：https://github.com/Homebrew/brew
- Homebrew 的 Manpage 说明书：https://docs.brew.sh/Manpage