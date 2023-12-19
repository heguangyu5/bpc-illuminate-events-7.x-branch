#!/bin/bash

[[ "$1" == "" ]] && {
    echo "Usage: ./bpc-prepare.sh src.list"
    exit
}

rm -rf ./Illuminate/Events/
mkdir ./Illuminate/Events/

echo "placeholder-events.php" > ./Illuminate/src.list

for i in `cat $1`
do
    if [[ "$i" == \#* ]]
    then
        echo $i
    else
        echo "Events/$i" >> ./Illuminate/src.list
        filename=`basename -- $i`
        if [ "${filename##*.}" == "php" ]
        then
            echo "phptobpc $i"
            phptobpc $i > ./Illuminate/Events/$i
        else
            echo "cp       $i"
            cp $i ./Illuminate/Events/$i
        fi
    fi
done
cp bpc.conf Makefile ./Illuminate/
