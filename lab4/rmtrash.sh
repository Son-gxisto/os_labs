#!/bin/bash
trash="/home/user/.trash"
log="/home/user/.trash.log"
numFile="/home/user/.numLink"
echo "args is :$1:"
if [[ $# -ne 1 ]]
 then
 echo "incorrect args"
 exit 1
fi

if [[ ! -f $1 ]] #|| [[ $1 -eq "" ]]
then
 echo "file not exists"
 exit 2
fi

if [ ! -d $homeTrash ]
 then
 mkdir "$trash"
fi

if [ ! -f $numFile ]
 then
 echo "1" > $numFile
fi

link=$(cat "$numFile" | head -1)
ln -T "$1" "$trash/$link"
#echo "link created"
rm $1
if [ ! -e $log ]
then
 touch $log
fi
echo "$PWD/$1:$link" >> $log
link=$(echo "$link + 1" | bc)
sed -i "1s/.*/$link/" "$numFile"
