#!/bin/bash

date=`date -d "+0 day $1" +%Y%m%d`
enddate=`date -d "+1 day $2" +%Y%m%d`


while [[ $date < $enddate  ]]
do
    echo $date
    date=`date -d "+1 day $date" +%Y%m%d`
done
