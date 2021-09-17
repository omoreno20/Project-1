#!/bin/bash

DATE=$1
TIME=$2


FILE="${DATE}_Dealer_schedule"
echo $FILE 

hour=`echo $TIME | awk '{print $1}'`
md=`echo $TIME | awk '{print $2}'`
grep $md $FILE | grep $hour | awk '{print $1 " " $2 " " $5 " " $6}'
