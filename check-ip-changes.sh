#!/bin/bash

RUN_DIR=$HOME/check_ip_changes

$RUN_DIR/check-private-ip-change.sh
$RUN_DIR/check-public-ip-change.sh

exit 0
