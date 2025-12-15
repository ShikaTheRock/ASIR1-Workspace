#!/bin/bash 

host=$(hostname)
echo "Hostname=$host"

for op in $(ip a | grep ^[0-9]: |awk -F " " {'print $2'} | tr ':' ' '); do
    ip -echo a | grep $op | head -n1 | grep -oq "state UP "  
    if [ $? -eq 0 ]; then
        state=$(ip -echo a | grep $op | head -n1 | grep -o "state UP ")
        ip=$(ip -echo a | grep $op | head -n2 | tail -n1 | awk -F " " {'print $4'})
        gateway=$(ip r | grep $op | grep $(echo $ip | awk -F "/" {'print $1'}) | grep "default via" | awk -F " " {'print $3'} )
        mac=$(ip link show $op | grep link/ether | awk -F " " {'print $2'})
        dyna=$(ip -echo a | grep $op | head -n2 | tail -n1 | grep -o "dynamic")
        if [ $? -eq 0 ]; then
            echo "Interfaz: $op - $state= $ip | GW=$gateway | MAC=$mac [ Is Dynamic. ]"
        else
            echo "Interfaz: $op - $state= $ip | GW=$gateway | MAC=$mac [ Is Static. ]"
        fi
    fi
done
