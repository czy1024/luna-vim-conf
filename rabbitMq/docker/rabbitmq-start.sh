#!/bin/bash

# 1.服务启动相关
	systemctl start|restart|stop|status rabbitmq-server

# 2.管理命令行  用来在不使用web管理界面情况下命令操作RabbitMQ
	rabbitmqctl  help  # 可以查看更多命令

# 3.插件管理命令行
	rabbitmq-plugins enable|list|disable 
