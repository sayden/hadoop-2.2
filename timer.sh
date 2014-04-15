#! /bin/bash

STARTTIME=$(date +%s)

if [ $# -eq 0 ]; then
	echo 'Not enough arguments'
else 
	case $1 in
		-sa) start-dfs.sh;start-yarn.sh
			;;
		-ka) stop-dfs.sh;stop-yarn.sh
			;;
		-sd) start-dfs.sh
			;;
		-sy) start-yarn.sh
			;;
		-ky) stop-yarn.sh
			;;
		-kd) stop-dfs.sh
			;;
		-lsm) hdfs dfsadmin -safemode leave
			;;
		-wordcount) hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.4.0.jar wordcount /rime/pg4300.txt /rime/output
			;;
		-restart) stop-dfs.sh; stop-yarn.sh;start-dfs.sh;start-yarn.sh
	esac
fi

#start-dfs.sh
#start-yarn.sh
#hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-2.4.0.jar wordcount /rime /rime/output

#stop-yarn.sh
#stop-dfs.sh

ENDTIME=$(date +%s)
echo "It takes $[$ENDTIME - $STARTTIME] seconds to complete this task..."
