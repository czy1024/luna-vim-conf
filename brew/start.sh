brew --version 
#或者
brew -v 
#显示brew版本信息
brew install <formula> 
#安装指定软件
brew unistall <formula 
#卸载指定软件
brew list  
#显示所有的已安装的软件
brew search text 
#搜索本地远程仓库的软件，已安装会显示绿色的勾
brew search /text/ 
#使用正则表达式搜软件
brew list text
#链接app到系统
brew tap beeftornado/rmtree
#这一步更新时间可能比较长，请耐心等待。结束后执行如下命令即可完全卸载软件。

brew rmtree git
brew cleanup