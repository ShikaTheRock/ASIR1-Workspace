#!/bin/bash

if [ $# -eq 2 ]; then
    if [ $(echo $1 | wc -c) -eq 4 ]; then
        if [ -f $2 ]; then
            chmod $1 $2
            echo "Se han configurado los permisos: "$(ls -l $2 | awk -F " " {'print $1'})
        else
            echo "la ruta no es valida"
            exit 2
        fi
    else
        echo "El formato octal es incorrecto, reviselo en 'man chmod'"
        exit 1
    fi
else
    echo no hay suficientes argumentos
    exit 3
fi
exit 0