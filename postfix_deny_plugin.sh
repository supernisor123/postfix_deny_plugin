#!/bin/bash


dir=/var/spool/postfix/deny
if [ ! -d "$dir" ];
then
 mkdir $dir
echo "creating deny folder"
fi
date_dir=$(echo `date +'%Y-%m-%d'`)
date_d=$dir/"$date_dir"

if [ ! -d "$date_d" ]; then
mkdir "$date_d"
echo "creating date folder"
fi

cmd=($(mailq | grep -B 1 -A 1 -E 'deny your IP Address'| sed 's/--//g'))
while  [ -n "$cmd" ]; do
echo $cmd
cmd=($(mailq | grep -B 1 -A 1 -E 'deny your IP Address'| sed 's/--//g'))
cmd[0]=`echo "${cmd[0]}"|sed  's/!//g'`
echo ${cmd[0]} 
file=/var/spool/postfix/hold/${cmd[0]}
if [ -f "$file" ];then
	echo "move to deny folder"
	mv $file $date_d/${cmd[0]}
fi
done
