#!/bin/bash
if [[ $# -ne 1 ]]
then
 echo "incorrect arguments"
 exit 1
fi
home="/home/user"
log="$home/.trash.log"
lines=$(grep -h "$1" "$log")
for line in $lines
do
 name=$(echo $line | awk -F ":" '{print($1)}')
 echo "recovery $name? [y/n]"
 read ans
 if [[ $ans == "y" ]]
  then
   uFileName="$name"
   if [[ ! -d $(dirname $uFileName) ]]
    then
     echo "directory $(dirname $uFileName) not exists, directory setted to home"
     uFileName="$home/$1"
   fi
   while [[ -e $uFileName ]]
   do
    echo "file already exists, choose another name"
    read uFileName
    uFileName="$home/$uFileName"
   done
    trashFile=$(echo $line | awk -F ":" '{print($2)}')
    ln "$home/.trash/$trashFile" $uFileName
#    rm $uFileName
    exit 0
  fi
done
