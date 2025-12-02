#!/bin/bash

echo "ESTE SCRIPT ESTA PENSADO PARA SU USO EN debNewBorn CON SU RED NAT"
echo ""

echo -n "Desea activar o desactivar la interfaz?[y/n] - "
read intOnOff

if [ $intOnOff = "y" ]; then
    VBoxManage controlvm debNewborn setlinkstate1 on
elif [ $intOnOff = "n" ]; then
    VBoxManage controlvm debNewborn setlinkstate1 off
else 
    echo "Nonvalid answer"
    exit 1
fi