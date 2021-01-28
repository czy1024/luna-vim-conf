#!/bin/bash

docker pull haproxy

sudo mkdir -p ~/haproxy/etc/haproxy

echo "8084 /status admin:admin"
sudo cat > ~/haproxy/etc/haproxy/haproxy.cfg <<EOF

global
		log         127.0.0.1 local2
		chroot      /usr/local/etc/haproxy    #锁定运行目录
		pidfile     /var/run/haproxy.pid
		maxconn     4000                      #每个haproxy进程的最大并发连接数,要考虑到ulimit -n的大小限制
		user        root                      #运行haproxy的用户
		group       root                      #运行haproxy的用户组
		daemon
		#nbproc 2                  #开启的haproxy进程数，与CPU保持一致
		#nbthread  4              #指定每个haproxy进程开启的线程数，默认为每个进程一个线程
		#cpu-map 1 0              #绑定haproxy 进程至指定CPU
		#cpu-map 2 1
		#cpu-map 3 2
		#cpu-map 4 3
		#maxsslconn  100000        #SSL每个haproxy进程ssl最大连接数
		maxconnrate  100000        #每个进程每秒最大连接数
		spread-checks  3           #后端server状态check随机提前或延迟百分比时间，建议2-5(20%-50%)之间

defaults
        log 127.0.0.1 local0 err #[err warning info debug]
        mode http                #默认的模式mode { tcp|http|health }，tcp是4层，http是7层，health只会返回OK
        retries 2                #两次连接失败就认为是服务器不可用，也可以通过后面设置
        option redispatch        #当serverId对应的服务器挂掉后，强制定向到其他健康的服务器
        option abortonclose      #当服务器负载很高的时候，自动结束掉当前队列处理比较久的链接
        option dontlognull       #日志中不记录负载均衡的心跳检测记录
        maxconn 4096             #默认的最大连接数
        timeout connect 5000ms   #连接超时
        timeout client 30000ms   #客户端超时
        timeout server 30000ms   #服务器超时
        #timeout check 2000      #=心跳检测超时

########统计页面配置########  
listen admin_status  
		bind 0.0.0.0:8888                #监听端口  
		mode http                        #http的7层模式  
		option httplog                   #采用http日志格式  
		#log 127.0.0.1 local0 err  
		maxconn 10  
		stats refresh 30s                #统计页面自动刷新时间  
		stats uri /status                #统计页面url  
		stats realm Haproxy \ statistic  #统计页面密码框上提示文本  
		stats auth admin:admin           #统计页面用户名和密码设置  
		stats hide-version               #隐藏统计页面上HAProxy的版本信息  
EOF

docker run -d --name haproxy \
	-p 8082:80 -p 8083:443 -p 8084:8888\
	-v ~/haproxy/etc/haproxy:/usr/local/etc/haproxy/ \
	--privileged=true \
	--restart always \
	haproxy
	
# 修改生效	 
# docker kill -s HUP haproxy
docker exec -it haproxy cat /usr/local/etc/haproxy/haproxy.cfg