#!/bin/bash
pid=${1}
x=`wc -l /etc/passwd | cut -f1 -d" "`
i=1
while [ ${i} -le ${x} ]
do
    line=`head -${i} /etc/passwd | tail -1`
    user=`echo ${line} | cut -f1 -d:`
    userid=`echo ${line} | cut -f3 -d:`
    if [ ${userid} -gt ${pid} ];then
        userhome=`echo ${line} | cut -f6 -d:`
        echo $userhome
        # du -sh $username >> /tmp/result.log 文件大小写入result.log
        usermod -L $user 
    fi
    ((i=i+1))
done