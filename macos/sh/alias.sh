# Mac 终端设置命令别名
# 进入根目录
cd ~  

# 创建bash文件
touch .bash_profile

# 编辑
vim .bash_profile

# 使文件生效
source .bash_profile

# 查看现有别名
alias

# 创建命令别名之前先测试命令名是否已存在
# 例如测试 foo
type foo 
bash: type: foo: not found
# 输出 not found 说明未存在

# 为多个命令的组合设置别名
alias hcgd='hexo clean&&hexo g&&hexo d'