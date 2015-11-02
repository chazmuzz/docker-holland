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

## Install the default config if none was provided
if [ ! -e /etc/holland/holland.conf ]; then
	echo 'Creating default holland.conf'
	cp /etc/holland.orig/holland.conf /etc/holland/holland.conf
fi

if [ ! -d /etc/holland/backupsets ]; then
	echo 'Creating default backupsets'
	cp -r /etc/holland.orig/backupsets /etc/holland/backupsets
fi

if [ ! -d /etc/holland/providers ]; then
	echo 'Creating default providers'
	cp -r /etc/holland.orig/providers /etc/holland/providers
fi

## Loop forever but sleep until 3am
while [[ true ]]; do
	echo '--------------------------------------------------------------------------------'

	# Change the default config to log to stdout rather than a log file
	sed -i 's/\/var\/log\/holland\/holland\.log/\/dev\/stdout/g' /etc/holland/holland.conf

	/usr/sbin/holland backup

	sleep_until 'tomorrow 3:00'
	
	echo '--------------------------------------------------------------------------------'
done
