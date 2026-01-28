#!/bin/bash -x

echo escriba el nombre o PID del proceso
read proc

if [[ "$proc" =~ ^[0-9]+$ ]]; then
    lstest=$(ls /proc/$proc 2> /dev/null) 
    if [ $? -eq 0 ]; then
        echo ""
        echo $(ps aux | awk -F " " '{print $2, $11}' | grep $proc) ha muerto.
        kill $(ps aux | awk -F " " '{print $2, $11}' | grep $proc | awk -F " " '{print $1}')
        
    else
        echo "FATAL ERROR PROCESS DOES NOT EXIST"
        exit 200
    fi
else
    lstest=$(ps aux | awk -F " " '{print $2, $11}' | grep $proc) 
    if [ $? -eq 0 ]; then
        echo ""
        kill $(ps aux | awk -F " " '{print $2, $11}' | grep $proc | awk -F " " '{print $1}')
        echo $lstest ha muerto.
    else
        echo "FATAL ERROR PROCESS DOES NOT EXIST"
        exit 200
    fi
fi