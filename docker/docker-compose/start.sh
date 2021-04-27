#!/bin/bash
```bash
-f, --file FILE 指定使用的 Compose 模板文件，默认为 docker-compose.yml，可以多次指定；

-p, --project-name NAME 指定项目名称，默认将使用所在目录名称作为项目名；

--x-networking 使用 Docker 的可拔插网络后端特性；

--x-network-driver DRIVER 指定网络后端的驱动，默认为 bridge；

--verbose 输出更多调试信息；

-v, --version 打印版本并退出；
```

docker-compose 命令 --help                    获得一个命令的帮助
docker-compose up -d nginx                    构建启动nignx容器
docker-compose exec nginx bash                登录到nginx容器中
docker-compose down                           此命令将会停止 up 命令所启动的容器，并移除网络
docker-compose ps                             列出项目中目前的所有容器
docker-compose restart nginx                  重新启动nginx容器
docker-compose build nginx                    构建镜像 
docker-compose build --no-cache nginx         不带缓存的构建
docker-compose top                            查看各个服务容器内运行的进程 
docker-compose logs -f nginx                  查看nginx的实时日志
docker-compose images                         列出 Compose 文件包含的镜像
docker-compose config                         验证文件配置，当配置正确时，不输出任何内容，当文件配置错误，输出错误信息。 
docker-compose events --json nginx            以json的形式输出nginx的docker日志
docker-compose pause nginx                    暂停nignx容器
docker-compose unpause nginx                  恢复ningx容器
docker-compose rm nginx                       删除容器（删除前必须关闭容器，执行stop）
docker-compose stop nginx                     停止nignx容器
docker-compose start nginx                    启动nignx容器
docker-compose restart nginx                  重启项目中的nignx容器
docker-compose run --no-deps --rm php-fpm php -v   在php-fpm中不启动关联容器，并容器执行php -v 执行完成后删除容器