#!/bin/bash
input="list.txt"
while IFS= read -r line
do
        N=$(echo $line | cut -d')' -f2-4 )
        A=$(echo $line | cut -d')' -f1 )
        echo "Testing - $N [$A] : "
        speedtest-cli --server $A --simple
        echo ""
done < "$input"
