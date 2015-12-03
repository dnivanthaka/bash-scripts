#!/bin/bash
#--------------------------------------------------
# A script to back up files into a remote server.
# Author: Dinusha N. Amerasinghe
#--------------------------------------------------
DATETIME=`date +'%Y-%m-%d %H:%M:%S'`
SRCDIR="/home/dinusha/Test"
DESTDIR="/home/dinusha/Documents/Temp"
DESTHOST="192.248.22.150"
LOGFILE="rsync-backup.log"

if [ -e "${LOGFILE}" ]
then
	echo "Logfile found."
else
	echo "Logfile not found and will be created."
fi

# Check if the remote host is alive
UNREACHABLE=`ping -c 8 ${DESTHOST} | grep -m 4 Unreachable -c`
if [ ${UNREACHABLE} -eq 0 ]
then
	echo "Host ${DESTHOST} is reachable"
	output=`rsync -avhk ${SRCDIR} ${DESTDIR} | grep 'sent'`
	echo ${DATETIME} "--" ${output} >> "${LOGFILE}"
else
	#echo ${UNREACHABLE}
	echo "Host ${DESTHOST} is unreachable"
	echo ${DATETIME} "--" "${DESTHOST} Unreachable" >> "${LOGFILE}"
fi

