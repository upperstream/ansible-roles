#!/bin/sh
### BEGIN INIT INFO
# Provides:wg0
# Required-Start:    $network
# Required-Stop:     $network
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: WireGuard VPN service
### END INIT INFO

interface="wg0"
description="wg-quick on $interface"

case "$1" in
	start)
		echo "Starting $description"
		/usr/bin/wg-quick up $interface
		echo "$description started"
		;;
	status)
		/usr/bin/wg show $interface
		;;
	stop)
		echo "Stopping $description"
		/usr/bin/wg-quick down $interface
		echo "$description stopped"
		;;
	restart)
		echo "Restarting $description"
		/usr/bin/wg-quick down $interface
		sleep 1
		/usr/bin/wg-quick up $interface
		echo "$description restarted"
		;;
	*)
		echo "Usage: $0 {status|start|stop|restart}"
		exit 1
		;;
esac
exit 0
