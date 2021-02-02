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







