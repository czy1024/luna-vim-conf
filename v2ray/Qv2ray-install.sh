#!/bin/bash
scp ~/Downloads/Qv2ray.AppImage  root@192.168.1.108:/home/luna/Qv2ray

sudo curl -x 192.168.1.106:10822 -LJO  https://github.com/Qv2ray/Qv2ray/releases/download/v2.6.3/Qv2ray.v2.6.3.linux-x64.AppImage
    