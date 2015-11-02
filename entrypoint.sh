#!/bin/bash

# Exit the script on Ctrl+C to exit the while true loop
trap ctrl_c INT
function ctrl_c() {
    echo "** Trapped CTRL-C"
    exit
}

# http://superuser.com/a/483464
function sleep_until {
	seconds=$(( $(date -d "$*" +%s) - $(date +%s) ))
	echo "Sleeping until $*"
	sleep $seconds
}

while [[ true ]]; do
	echo '--------------------------------------------------------------------------------'
	date
	/usr/sbin/holland backup
	sleep_until 'tomorrow 3:00'
	echo '--------------------------------------------------------------------------------'
done
