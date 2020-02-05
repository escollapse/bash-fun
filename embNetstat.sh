#!/bin/bash
#
# "embedded-device netstat"
#
# embNetstat.sh
#	watered-down version of netstat for when
#	netstat, lsof, etc are not available
#
# ./embNetstat.sh [tcp | udp]
#
# giving credit where credit is due, i adopted this from andreisid.  he has good milk:
#	https://www.commandlinefu.com/commands/view/15313/check-open-ports-without-netstat-or-lsof
#	https://www.commandlinefu.com/commands/by/andreisid
#
# **************
# * escollapse *
# * CISSP, PT+ *
# *  20200204  *
# **************
#

case "$1" in
	"tcp")
		echo "Open TCP Ports:"
		declare -a array=($(tail -n +2 /proc/net/$1 | cut -d':' -f3 | cut -d' ' -f1))\
			&& ((for port in ${array[@]}; do echo $((0x$port)); done) | sort -n)
		;;
	"udp")
		echo "Open UDP Ports:"
		declare -a array=($(tail -n +2 /proc/net/$1 | cut -d':' -f3 | cut -d' ' -f1))\
			&& ((for port in ${array[@]}; do echo $((0x$port)); done) | sort -n)
		;;
	*)
		echo "Usage: $0 [tcp | udp]"
		;;
esac
