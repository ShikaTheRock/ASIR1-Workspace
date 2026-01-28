#!/bin/bash

# Get top 3 proceso con mayor cpu ussage

top1=$(ps aux | sort -nrk 3,3 | head -n 1 | awk -F " " '{print $11}')
top1id=$(ps aux | sort -nrk 3,3 | head -n 1 | awk -F " " '{print $2}')

top2=$(ps aux | sort -nrk 3,3 | head -n 2| tail -n 1 | awk -F " " '{print $11}')
top2id=$(ps aux | sort -nrk 3,3 | head -n 2| tail -n 1 | awk -F " " '{print $2}')

top3=$(ps aux | sort -nrk 3,3 | head -n 3| tail -n 1 | awk -F " " '{print $11}')
top3id=$(ps aux | sort -nrk 3,3 | head -n 3| tail -n 1 | awk -F " " '{print $2}')

echo "Bienbenido a proc.sh tu administrador de procesos cli de confianza!!"
echo ""
echo "Los procesos que mas estan cosumiendo ahora mismo son:"
echo "$top1id - $top1"
echo "$top2id - $top2"
echo "$top3id - $top3"
echo ""
echo "Cual es el proceso que sesea usted investigar? [pulse q para salir]"
read proc

if [ "$proc" = q ]; then
    exit 0
elif [[ "$proc" =~ ^[0-9]+$ ]]; then
    lstest=$(ls /proc/$proc 2> /dev/null) 
    if [ $? -eq 0 ]; then
        echo ""
        echo "Nombre del proceso: $(ls -l /proc/$proc/exe | awk -F "->" '{print $2}')"
        echo "Nombre del usuario: $(ls -ld /proc/$proc/ | awk -F " " '{print $3}')"
        echo "Estado: $(cat /proc/$proc/status | grep "State" | awk -F " " '{print $2}')"

    else
        echo "FATAL ERROR PROCESS DOES NOT EXIST"
        exit 200
    fi
else
    echo "Value not suported"
    exit 100
fi