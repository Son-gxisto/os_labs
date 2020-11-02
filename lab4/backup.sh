#!/bin/bash
home="/home/user"
cd $home
mkdir "/home/user/Backup-1960-1-1" 2>/dev/null
curDate=$(date +%Y-%m-%d)
lastBackup=$(ls | grep -E "^Backup-[0-9]{4}-[0-9]*-[0-9]*{2}" | sort -n | tail -1 | cut -d "-" -f 2,3,4)
#echo $lastBackup
last=$(date -d "$lastBackup" +%d | bc)
cur=$(date -d "$curDate" +%d | bc)
cur=$(($cur - $last))
cd "$home/source"
lines=$(ls)
report="/home/user/backup-report"
if [[ $cur -gt 7 ]]
then
 dir="$Backup-$curDate"
 mkdir $dir
 lines=$(ls)
 for line in "$lines"
  do
  cp -r "$home/source/$line" "$home/$dir"
 done
 echo "directory was created: $dir" > "/home/user/backup-report"
 echo $lines >> "$report"
else
 dir="$home/Backup-$lastBackup"
 tmp1="/home/user/newFiles"
 tmp2="/home/user/changedFiles"
 touch $tmp1
 touch $tmp2
 for line in $lines
 do
  if [[ -f "$dir/$line" ]]
  then
   size1=$(ls -l "$home/source/$line" | awk '{print($5)}')
   size2=$(ls -l "$dir/$line" | awk '{print($5)}')
   if [[ "$size1" -ne "$size2" ]]
   then
	cat "$dir/$line" > "$dir/$line.$curDate"
	cp -R "$home/source/$line" "$dir"
	echo "added2 $line $line.$curDate" >> "$tmp2"
   fi
  else
   cp -r "$home/source/$line" "$dir"
   echo "added $line" >> "$tmp1"
  fi
 done
 echo "$dir was changes:" >> "$report"
 cat "$tmp1" >> "$report"
 cat "$tmp2" >> "$report"
 rm $tmp1
 rm $tmp2
fi
