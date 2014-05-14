#!/bin/bash -e
inp=$1
outfile=/tmp/data
lc=`cat $inp  | wc -l`
i=1
echo "{" > $outfile
while read line
do
key=`echo $line | cut -d: -f1`
cmd=`echo $line | cut -d: -f1 --complement`
echo $key
out=`eval $cmd`
echo $out
echo "------------------\n"

if [ $i -lt $lc ]
then
   echo "\t\"${key}\":\"${out}\"," >> $outfile
fi
i=`expr $i + 1`
done < $inp
echo "\t\"${key}\":\"${out}\"" >> $outfile
echo "}" >> $outfile
