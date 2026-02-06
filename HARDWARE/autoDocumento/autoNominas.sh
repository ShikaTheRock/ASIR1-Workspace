#!/bin/bash

date_now=$(date "+%F-%H-%M-%S")

echo -n "Introduzca el id del usuario a despedir: "
read idUsr
echo "Perfecto! Despidiendo al usuario... $idUsr"
echo "---
title: "Carta de despido"
author: $idUsr
date: "$date_now"

titlepage: true
titlepage-rule-height: 0
titlepage-background: ./portada.jpg
titlepage-text-color: ffffff
page-background: ./watermark.jpg
---
" > NombreDelAeropuerto.md

cat exportComplete.csv | while read line;do

    echo $line | awk -F "," '{print $1}' | grep -q ^$idUsr$

    if [ $? -eq 0 ]; then
        user=$(echo $line | awk -F "," '{print $2}' )

        ipv4=$(echo $line | awk -F "," '{print $5}' )

        file=$(echo $line | awk -F "," '{print $7}' )

        deleg=$(echo $line | awk -F "," '{print $8}' )

        echo "
# Estimado $user:



Tras varios meses revisando cautelosamente su historial, hemos detectado un uso indebido de las TIC proviniendo desde su ip: $ipv4

Pues se ha detectado el archivo no permitido $file

Lastimosamente esto es una falta grave y quedas destituido de empleo  y sueldo en la delegacion de $deleg

Buenas tardes." >> NombreDelAeropuerto.md

    fi


done





