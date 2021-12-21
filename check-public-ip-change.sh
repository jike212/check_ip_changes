#!/bin/bash

HOSTNAME=`hostname`
RUN_DIR=$HOME/check_ip_changes
LAST_IP_FILE="last_public_ip"

source $RUN_DIR/config.sh

if [ ! -e $RUN_DIR/$LAST_IP_FILE ];
    then
        touch $RUN_DIR/$LAST_IP_FILE;
fi

# read last ip from file
while read ip; do last_ip=$ip; done < $RUN_DIR/$LAST_IP_FILE;

# get current ip
current_ip=$(curl ipinfo.io/ip);

# if public ip has changed send e-mail informing
if [[ "$current_ip" != "$last_ip" ]];
    then
        echo -e "Subject: New IP Change: ${current_ip}\nNew IP is ${current_ip}" | msmtp testuser@test.com
        # save current ip to file
        echo $current_ip > $RUN_DIR/$LAST_IP_FILE;
fi

exit 0
