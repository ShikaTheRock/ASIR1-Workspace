#!/bin/bash

while read line; do 
  echo $line | grep -q ^ls
  if [ $? = 0 ]; then
    echo $line | grep -q ^lscpu*
    if [ $? = 0 ]; then
      echo $line >> lscpucache.log
    else
      echo $line >> lspcinfo.log
    fi
  else
    echo $line >> SOstartinfo.log 
  fi
done < dmesg.log
