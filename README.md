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
| ali            | ./ali           | Java code Guide                              |
| -------------- | --------------- | -------------------------------------------- |
| apt-yum        | ./apt-yum       | Mirrors and some suggestions                 |
| brew           | ./brew          | mac's brew                                   |
| centos         | ./centos        | initial centos                               |
| chrome         | ./chrome        | My chrome bookmark                           |
| cmder          | ./cmder         | windows cmder config                         |
| consul         | ./consul        | consul ‘s config and start                   |
| cute           | ./cute          | A simple http file server                    |
| dingding       | ./dingding      | DingTalk Intranet penetration                |
| docker         | ./docker        | install docker for centos and ubuntu         |
| Elastic search | ./elasticsearch | install elasticsearch for windows and docker |
| Frp            | ./frp           | frp Intranet penetration                     |
| git            | ./git           | some simple scripts and command for git      |
| haproxy        | ./haproxy       | A network proxy supporting tcp and httpd     |
| hashcat        | ./hastcat       | A tool for cracking hash codes               |
| host           | ./host          | Domain mapping                               |
| httpd          | ./httpd         | apache server config                         |
| idea           | ./idea          | idea Crack renewal                           |
| kibana         | ./kibana        | install kibana for windows and docker        |
| macos          | ./macos         | start macOS                                  |
| maven          | ./maven         | some simple config for maven                 |
| mongodb        | ./mongodb       | install mongodb for ubuntu and docker        |
| mysql          | ./mysql         | install mysql for windows and docker |
| nacos          | ./nacos         | install nacos for windows and docker |
| navicat        | ./navicat       | My navicat connetion |
| nginx          | ./nginx         | install nginx for centos docker ubuntu and windows |
| node.js        | ./node.js       | install node.js for centos and ubuntu  |
| nssm           | ./nssm          | Windows service install and start |
| picgo          | ./picgo         | pic for auto upload |
| postman        | ./postman       | My api config for json file |
| proxy          | ./proxy         | Some software for porxy |
| pyhton         | ./pyhton        | install pyhton   |
| rabbitMq       | ./rabbitMq      | install rabbitMq for docker  and windows |
| rdp            | ./rdp           | My remote desktop config file |
| redis          | ./redis         | install redis for docker ubuntu and windows |
| splash         | ./splash        | Web crawler |
| ssh            | ./ssh           | install ssh |
| ssl            | ./ssl           | ssl create |
| tomcat         | ./tomcat        | install tomcat for docker ubuntu and windows |
| ubuntu         | ./ubuntu        | initial centos and some script |
| uc-free        | ./uc-free       | Soft routing |
| v2ray          | ./v2ray         | v2ray script and config |
| redis          | ./redis         | install redis for docker ubuntu and windows |
| vnc            | ./vnc           | install vnc for  ubuntu , centos and windows |
| zookeeper      | ./zookeeper     | install zookeeper for docker  and windows |
| zsh            | ./zsh           | install zsh , Solve the theme garbled |















