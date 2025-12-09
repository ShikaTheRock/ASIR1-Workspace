#!/bin/bash

if [ $# -eq 2 ]; then
    if [ $(echo $3 | wc -c) -eq 4 ]; then
        if [ -e $1 ]; then
            chmod -R $3 $1
            if [ -d $1 ]; then
                echo "Se han configurado los permisos: "
                tree -pu $1
            elif [ -f $1 ]; then
                echo "Se han configurado los permisos: "$(ls -l $1 | awk -F " " {'print $1'} && ls -l $1 | awk -F " " {'print $3'})
            fi 
        else
            echo "la ruta no es valida"
            exit 2
        fi
    else
        echo "El formato octal es incorrecto, reviselo en 'man chmod'"
        exit 1
    fi
elif [ $# -eq 3 ]; then 
        if [ $(echo $3 | wc -c) -eq 4 ]; then
        if [ -e $1 ]; then
            chmod -R $3 $1
            chown -R $2 $1
            if [ -d $1 ]; then
                echo "Se han configurado los permisos: "
                tree -pu $1
            elif [ -f $1 ]; then
                echo "Se han configurado los permisos: "$(ls -l $1 | awk -F " " {'print $1'} && ls -l $1 | awk -F " " {'print $3'})
            fi 
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