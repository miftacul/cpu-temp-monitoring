#!/usr/bin/bash
thresholdWarn=$1
cpuTemps=`sensors coretemp-isa-0000 | grep C | cut -d ':' -f2|awk -p '{print $1}' | sed 's/\(+\)\([0-9][0-9]\)\(\..*\)/\2/'`
for cpuTemp in $cpuTemps
do
	if [ $cpuTemp -gt $thresholdWarn ];
	then
		notify-send -u normal CPU WARNING	
		break;
	fi
done
