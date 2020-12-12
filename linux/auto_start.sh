# 修改配置文件后需要重加载配置
sudo systemctl daemon-reload

#加入到系统启动中
update-rc.d xxxx defaults 
# 从系统启动中删除
update-rc.d xxxx remove
#启动命令
service xxxx start
service xxxx stop
# 设置服务开启启动

systemctl is-enabled servicename.service #查询服务是否开机启动

systemctl enable *.service #开机运行服务

systemctl disable *.service #取消开机运行

systemctl start *.service #启动服务

systemctl stop *.service #停止服务

systemctl restart *.service #重启服务

systemctl reload *.service #重新加载服务配置文件

systemctl status *.service #查询服务运行状态