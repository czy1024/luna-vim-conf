#!/bin/bash
# to /etc/init.d/frpc sudo chmod 755 /etc/init.d/frpc
### BEGIN INIT INFO
# Provides:          frpc
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6 
# Short-Description: Start frpc at boot time
# Description:       Enable service provided by frpc.
### END INIT INFO
 
start() 
{
    /home/luna/Desktop/frp/frpc -c /home/luna/Desktop/frp/frpc.ini &
    exit 0;
}
 
stop() 
{
   killall /home/luna/Desktop/frp/frpc
}
 
case "$1" in
start)
    start
    ;;
 
stop)
    stop
    ;;
 
restart)
    stop
    start
    ;;
 
*)
    echo "Usage: $0 {start|stop|restart}"
    exit 0
    ;;
 
esac
exit 0