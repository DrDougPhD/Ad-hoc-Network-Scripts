#!/usr/bin/env bash
# What is MTR?
#   mtr combines the functionality of the 'traceroute' and 'ping' programs in a single network diagnostic tool.
#   Source: http://www.bitwizard.nl/mtr/
#
# Output format
#   user@source:~/Ad-hoc-Network-Scripts$ latency.sh destination.server
#   Start: Sat Nov 26 11:48:01 2016
#   HOST: server                      Loss% Drop   Rcv   Snt   Last  Best   Avg  Wrst  StDev Gmean  Jttr Javg Jmax Jint
#     1.|-- first.gateway              0.0%    0    60    60    3.0   1.6   3.0   4.0    0.2   3.0   0.0  0.2  1.4  4.7
#     2.|-- destination.server         0.0%    0    60    60    3.0   2.2   3.2   8.1    0.7   3.1   0.0  0.5  5.1  4.0
#
# Units
#   Last/Best/Avg/Wrst:   milliseconds
#   Jttr/Javg/Jmax/Jint:  
#
addr="$1"
if [ -z $addr ]
then
	echo "Usage: bash latency.sh IP_ADDRESS"
	exit 1
fi

mtr --order "LDRS NBAW VG JMXI" --report --report-cycles 60 "$addr"
