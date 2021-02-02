# My Linux Setup

## Create a new user
```bash
adduser --disabled-password <your_username>
usermod -aG sudo <your_username>
su - <your_username>
```
And then update `.ssh/authorized_keys` with your ssh public key.

## Install zsh
```bash
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

replace the theme with agnoster

## Setup my system

### centos 8

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/czy1024/luna-linux-conf/master/centos/install_start.sh)"
```

### ubuntu 20

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/czy1024/luna-linux-conf/master/ubuntu/install_start.sh)"
```

and so on....
## Optional link

| items          | items-src                        | items Guide                                        |
| -------------- | -------------------------------- | -------------------------------------------------- |
| ali            | [ali](./ali)                     | Java code Guide                                    |
| apt-yum        | [apt-yum](./apt-yum)             | Mirrors and some suggestions                       |
| brew           | [brew](./brew)                   | mac's brew                                         |
| centos         | [centos](./centos)               | initial centos                                     |
| chrome         | [chrome](./chrome)               | My chrome bookmark                                 |
| cmder          | [cmder](./cmder)                 | windows cmder config                               |
| consul         | [consul](./consul)               | consul ‘s config and start                         |
| cute           | [cute](./cute)                   | A simple http file server                          |
| dingding       | [dingding](./dingding)           | DingTalk Intranet penetration                      |
| docker         | [docker](./docker)               | install docker for centos and ubuntu               |
| Elastic search | [elasticsearch](./elasticsearch) | install elasticsearch for windows and docker       |
| Frp            | [frp](./frp)                     | frp Intranet penetration                           |
| git            | [git](./git)                     | some simple scripts and command for git            |
| haproxy        | [haproxy](./haproxy)             | A network proxy supporting tcp and httpd           |
| hashcat        | [hastcat](./hastcat)             | A tool for cracking hash codes                     |
| host           | [host](./host)                   | Domain mapping                                     |
| httpd          | [httpd](./httpd)                 | apache server config                               |
| idea           | [idea](./idea)                   | idea Crack renewal                                 |
| kibana         | [kibana](./kibana)               | install kibana for windows and docker              |
| macos          | [macos](./macos)                 | start macOS                                        |
| maven          | [maven](./maven)                 | some simple config for maven                       |
| mongodb        | [mongodb](./mongodb)             | install mongodb for ubuntu and docker              |
| mysql          | [mysql](./mysql)                 | install mysql for windows and docker               |
| nacos          | [nacos](./nacos)                 | install nacos for windows and docker               |
| navicat        | [navicat](./navicat)             | My navicat connetion                               |
| nginx          | [nginx](./nginx)                 | install nginx for centos docker ubuntu and windows |
| node.js        | [node.js](./node.js)             | install node.js for centos and ubuntu              |
| nssm           | [nssm](./nssm)                   | Windows service install and start                  |
| picgo          | [picgo](./picgo)                 | pic for auto upload                                |
| postman        | [postman](./postman)             | My api config for json file                        |
| proxy          | [proxy](./proxy)                 | Some software for porxy                            |
| python         | [python](./python)               | install pyhton                                     |
| rabbitMq       | [rabbitMq](./rabbitMq)           | install rabbitMq for docker  and windows           |
| rdp            | [rdp](./rdp)                     | My remote desktop config file                      |
| redis          | [redis](./redis)                 | install redis for docker ubuntu and windows        |
| splash         | [splash](./splash)               | Web crawler                                        |
| ssh            | [ssh](./ssh)                     | install ssh                                        |
| ssl            | [ssl](./ssl)                     | ssl create                                         |
| tomcat         | [tomcat](./tomcat)               | install tomcat for docker ubuntu and windows       |
| ubuntu         | [ubuntu](./ubuntu)               | initial centos and some script                     |
| uc-free        | [uc-free]()                      | Soft routing                                       |
| v2ray          | [v2ray](./v2ray)                 | v2ray script and config                            |
| redis          | [redis](./redis)                 | install redis for docker ubuntu and windows        |
| vnc            | [vnc](./vnc)                     | install vnc for  ubuntu , centos and windows       |
| zookeeper      | [zookeeper](./zookeeper)         | install zookeeper for docker  and windows          |
| zsh            | [zsh](./zsh)                     | install zsh , Solve the theme garbled              |


## 目录结构

.
├── LICENSE
├── README.md
├── _config.yml
├── ali
│   └── ali-code-style.xml
├── apt-yum
│   ├── apt
│   │   ├── apt-ubuntu2010.txt
│   │   ├── source.list.2010
│   │   └── ubuntu-apt.sh
│   ├── readme.md
│   └── yum
│       ├── CentOS-Base.repo.centos7
│       ├── CentOS-Base.repo.centos8
│       └── centos-yum.txt
├── brew
│   ├── readme.md
│   ├── source.sh
│   ├── start.sh
│   ├── �\216\237�\225\234�\203\217.sh
│   └── �\233��\206\205�\225\234�\203\217.sh
├── centos
│   ├── fire_wall.sh
│   ├── install_start.sh
│   ├── readme.md
│   └── static_ip.sh
├── chrome
│   ├── bookmarks_12_23_20.html
│   ├── bookmarks_2021_1_15.html
│   ├── bookmarks_2021_1_17.html
│   ├── bookmarks_2021_1_18.html
│   ├── bookmarks_2021_1_19.html
│   └── bookmarks_2021_1_26.html
├── cmder
│   └── cmder_1_29.xml
├── consul
│   ├── docker
│   │   ├── docker-consul-cluster.sh
│   │   └── docker-consul-only.sh
│   ├── readme.md
│   └── windows
│       └── start.bat
├── cute
│   ├── chfs
│   ├── chfs-linux-amd64-2.0.zip
│   ├── chfs-mac-amd64-2.0.zip
│   ├── chfs-windows-x64-2.0.zip
│   ├── chfs.ini
│   ├── cute
│   │   ├── chfs.exe
│   │   ├── chfs.ini
│   │   ├── dinghttp
│   │   │   ├── ding.cfg
│   │   │   ├── ding.exe
│   │   │   ├── ding.lnk
│   │   │   ├── run.bat
│   │   │   ├── winsw.exe
│   │   │   └── winsw.xml
│   │   ├── nssm.exe
│   │   ├── run.bat
│   │   ├── winsw.exe
│   │   └── winsw.xml
│   ├── gui-chfs-windows.zip
│   └── readme.md
├── deploy.bat
├── deploy.sh
├── dingding
│   ├── auto_start.sh
│   ├── pierced-master
│   │   ├── linux
│   │   │   ├── ding
│   │   │   ├── ding.cfg
│   │   │   └── ding.sh
│   │   ├── mac_64
│   │   │   ├── ding
│   │   │   ├── ding.cfg
│   │   │   └── ding.sh
│   │   └── windows_64
│   │       ├── ding.cfg
│   │       ├── ding.exe
│   │       └── ding.sh
│   ├── readme.md
│   └── windows
│       └── dinghttp.zip
├── docker
│   ├── centos
│   │   └── docker-centos.sh
│   ├── docker-start.sh
│   ├── mac.sh
│   ├── readme.md
│   └── ubuntu
│       └── docker-ubuntu.sh
├── elasticsearch
│   ├── docker
│   │   ├── docker-elastic-ik.sh
│   │   └── docker-elastic-noplugs.sh
│   ├── elasticsearch.yml
│   ├── readme.md
│   └── windows
│       ├── elasticsearch.yml
│       ├── jvm.options
│       ├── log4j2.properties
│       └── start-elastic.sh
├── frp
│   ├── frpc.ini
│   ├── frpc_luna_collage.ini
│   ├── frpc_luna_mac.ini
│   ├── linux
│   │   ├── auto_start.sh
│   │   ├── auto_start_frp.sh
│   │   └── frp_linux.tar.gz
│   ├── readme.md
│   └── windows
│       └── frp.zip
├── git
│   ├── git.sh
│   ├── gitstart.sh
│   └── readme.md
├── haproxy
│   ├── docker
│   │   ├── docker-haproxy.sh
│   │   └── haproxy.cfg
│   ├── haproxy.cfg
│   ├── readme.md
│   └── ubuntu
│       ├── haproxy.cfg
│       └── ubuntu-haproxy.sh
├── hashcat
│   ├── hashcat.txt
│   └── readme.md
├── host
│   ├── hosts
│   └── readme.md
├── httpd
│   ├── docker
│   │   ├── docker-httpd.sh
│   │   ├── httpd-dav.conf
│   │   └── httpd.conf
│   ├── httpd.sh
│   ├── readme.md
│   ├── ubuntu
│   │   ├── apache2.conf
│   │   ├── httpd.sh
│   │   ├── luna.com.conf
│   │   └── prots.conf
│   └── windows
│       ├── apache-httpd.zip
│       ├── httpd\ copy.conf
│       ├── httpd-dav.conf
│       └── httpd.conf
├── idea
│   └── IDEA2020.2.3.zip
├── kibana
│   ├── docker
│   │   └── docker-kibana.sh
│   ├── kibana.yml
│   └── windows
│       └── kibana-origin.yml
├── macos
│   └── readme.md
├── maven
│   ├── apache-maven-3.6.3-bin.zip
│   └── settings.xml
├── mongodb
│   ├── apt-mongodbsh
│   └── docker-mongoDB.sh
├── mysql
│   ├── docker
│   │   └── docker-mysql.sh
│   ├── readme.md
│   └── windows
│       ├── linux_my.conf
│       ├── my.ini
│       └── mysql-start.sh
├── nacos
│   ├── application.properties
│   ├── docker
│   │   ├── docker-nacos-cluster.sh
│   │   └── docker-nacos-standalone.sh
│   ├── docker-compose
│   │   ├── env
│   │   │   ├── mysql.env
│   │   │   └── nacos-hostname.env
│   │   └── nacos_cluster
│   │       ├── init.d
│   │       │   └── custom.properties
│   │       └── luna-cluster-hostname.yaml
│   └── readme.md
├── naviact
│   ├── 2020_11_15.ncx
│   ├── 2020_12_14.ncx
│   ├── 2020_12_5.ncx
│   ├── 2021_1_11.ncx
│   ├── 2021_1_22.ncx
│   └── 2021_2_3.ncx
├── nginx
│   ├── docker
│   │   ├── default-http-server.conf
│   │   └── docker-nginx.sh
│   ├── html
│   │   ├── 404.html
│   │   ├── 50x.html
│   │   └── index.html
│   ├── luna-nginx.conf
│   ├── nginx.conf
│   ├── nginx.conf.default
│   ├── readme.md
│   ├── start.sh
│   └── windows
│       └── nginx.zip
├── node.js
│   ├── centos
│   │   └── npm.sh
│   ├── npm.txt
│   └── ubuntu
│       └── npm.sh
├── nssm
│   ├── nssm-2.24.zip
│   └── nssm.md
├── picgo
│   └── picgo_data.json
├── postman
│   ├── api.postman_collection.json
│   ├── elasticsearch.postman_collection.json
│   ├── fusion-message.postman_collection.json
│   ├── fusion-user.postman_collection.json
│   ├── luna-commons.postman_collection.json
│   └── wednesday.postman_collection.json
├── proxy
│   ├── Qv2ray-refs.tags.v1.99.6-linux.AppImage
│   ├── ShadowsocksR.rar
│   ├── ShadowsocksX-NG-R8.dmg
│   ├── ShadowsocksX-NG.1.9.4.zip
│   ├── google.crx
│   ├── googleShangWang.zip
│   ├── v2ray-linux-64.zip
│   ├── v2rayN-Core.zip
│   └── �\217米�\220\203windows_amd64.rar
├── python
│   └── brew-python.sh
├── rabbitMq
│   ├── docker
│   │   └── docker-rabbitMq.sh
│   └── readme.md
├── rdp
│   ├── f.xicc.cc_22311.rdp
│   ├── f.xicc.cc_3913.rdp
│   ├── f.xicc.cc_3924.rdp
│   ├── f.xicc.cc_3927.rdp
│   ├── f.xicc.cc_3929.rdp
│   ├── luna-collage.rdp
│   ├── siodao-luna-7.rdp
│   ├── suidao-luna-4\ 1.rdp
│   ├── suidao-luna-4.rdp
│   ├── suidao-luna-collage.rdp
│   └── winserver-3928.rdp
├── redis
│   ├── centos
│   │   └── redis.sh
│   ├── docker
│   │   └── docker-redis.sh
│   ├── readme.md
│   ├── redis.conf
│   ├── start.sh
│   └── ubuntu
│       └── redis.sh
├── setup.sh
├── splash
│   └── docker-splash.sh
├── ssh
│   ├── get-ssh.sh
│   └── sshd_config
├── ssl
│   └── ssl-generate.sh
├── tmux.sh
├── tomcat
│   ├── docker-tomcat.sh
│   ├── readme.md
│   ├── server.xml
│   └── ssl.sh
├── ubuntu
│   ├── auto_start.sh
│   ├── install_start.sh
│   ├── java.sh
│   ├── lockuser_if_userid_gt_x.sh
│   ├── parctice.sh
│   ├── port_do.sh
│   ├── readme.md
│   ├── sougou.sh
│   ├── static_ip.sh
│   ├── ufw.sh
│   ├── uncrontab_if_user_gt_x.sh
│   ├── vm_tools.sh
│   └── windows
│       └── readme.md
├── uc-free
│   ├── BreedEnter.exe
│   ├── WinPcap_4_1_3.exe
│   └── 路�\224��\233�件
│       └── RT-N14U-GPIO-1-RY1-64M2_3.4.3.9-099_16M.trx
├── v2ray
│   ├── Qv2ray-install.sh
│   └── config.json
├── vnc
│   ├── readme.md
│   ├── vnc.sh
│   ├── vnc_install.sh
│   ├── vnc_start.sh
│   ├── vnc_tightvncserver.sh
│   └── vncserver
├── zookeeper
│   ├── docker
│   │   ├── docker-zookeeper-cluster.sh
│   │   └── docker-zookeeper-only.sh
│   └── windows
│       ├── log4j.properties
│       ├── zoo.cfg
│       └── zookeeper.cmd
└── zsh
    ├── centos
    │   └── centos_zsh_oh__my_zsh_install.sh
    ├── install.sh
    ├── readme.md
    ├── ubuntu
    │   └── ubuntu_zsh_oh__my_zsh_install.sh
    ├── windows
    │   └── PowerlineSymbols.otf
    └── zsh_start.sh




