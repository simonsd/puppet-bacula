#!/bin/bash

#############################################################################################
# This script will connect to bconsole and cleanup all jobs which are waiting for execution #
#############################################################################################

jobIds=`echo 'status dir running' | bconsole | fgrep 'is waiting' | awk '{print $1}'`
for i in $jobIds
do
    if [ -z `echo "$i" | grep '^[0-9]\+$'` ]
    then
        echo "Error: job ID $i is not a number!"
    else
        echo "Killing waiting Bacula job $i"
        echo "cancel jobid=$i" | bconsole
    fi
done