#!/bin/bash

if [ $# -eq 2 ]; then
    if [ $(echo $2 | wc -c) -eq 4 ]; then
        if [ -e $1 ]; then
            chmod -R $2 $1
            echo "Se han configurado los permisos: "
            tree -p $1
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