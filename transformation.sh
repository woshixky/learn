#!/bin/bash
bian=$1
a=`sed -n '$=' $bian `
for i in `seq 1 $a` ;do
    q=`sed -r -n "${i}p" $bian`
    ./translate.sh "$q"
done

