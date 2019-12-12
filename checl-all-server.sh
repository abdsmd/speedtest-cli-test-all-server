#!/bin/bash
list="list.txt"
rm -rf $list
touch $list
chmod 777 $list
speedtest-cli --list > $list
while IFS= read -r line
do
        N=$(echo $line | cut -d')' -f2-4 )
        A=$(echo $line | cut -d')' -f1 )
if  [  -z "${A##[0-9]*}" ]
then
        echo "Testing - $N [$A] : "
        speedtest-cli --server $A --simple
        echo ""
fi
done < "$list"
