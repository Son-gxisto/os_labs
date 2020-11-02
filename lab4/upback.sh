#!/bin/bash
home="/home/user"
date=$(ls | grep -E "^Backup-[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}$" | sort -n | tail -1 | cut -d "-" -f 2,3,4)
if [[ ! -d "$home/restore" ]]
then
 mkdir "$home/restore"
fi
lines=$(ls "$home/Backup-$date")
for line in $lines
do
 lineWithDate=$(echo "$line" grep -oiE ".{1,}[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}")
 if [[ "$line" -ne "$lineWithDate" ]]
 then
  cp -R "$home/Backup-$date" "$home/restore"
 fi
done
