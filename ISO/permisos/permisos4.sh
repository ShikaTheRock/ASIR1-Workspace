#!/bin/bash

if [ $# -eq 3 ]; then
    if [ $(echo $3 | wc -c) -eq 4 ]; then
        if [ -e $1 ]; then
            ubs=$(find $1 -name *$2)
            for op in $(echo $ubs); do
                #ubi=$(echo $op | awk -F "/" '{print $NF}')
                chmod $3 $op
                echo "Configurando... $op"
                echo "Se han configurado los permisos: "
                ls -l $op | awk -F " " {'print $1'}
                echo "Se ha configurado el usuario: "
                ls -l $op | awk -F " " {'print $3'}
            done
        else
            echo "la ruta no es valida"
            exit 2
        fi
    else
        echo "El formato octal es incorrecto, reviselo en 'man chmod'"
        exit 1
    fi
else
    echo "no hay suficientes argumentos (O demasiados)"
    exit 3
fi
exit 0