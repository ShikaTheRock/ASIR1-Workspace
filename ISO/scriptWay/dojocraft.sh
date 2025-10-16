#!/bin/bash

#set -x

if [ -d laSenia/ ]; then
  rm -rf laSenia/
fi

mkdir -p laSenia/dptoBio/aula21/
mkdir -p laSenia/dptoBio/aula22/
mkdir -p laSenia/dptoBio/aula23/

mkdir -p laSenia/dptoInf/aula23/
mkdir -p laSenia/dptoInf/aulaInf01/
mkdir -p laSenia/dptoInf/aulaInf02/

mkdir -p laSenia/dptoMat/aula21/
mkdir -p laSenia/dptoMat/aula23/

if [ -d ./laSenia ]; then
echo "El objeto 'laSenia' existe y es un directorio."
else
echo "El objeto 'laSenia' no existe y es un directorio."
fi

if [ -d laSenia/dptoBio/aula21/ ] && [ -d laSenia/dptoBio/aula22/ ] && [ -d laSenia/dptoBio/aula23/ ]; then
echo "El departamento de bilogia esta lleno"
else
echo "El departamento de bilogia esta vacio"
fi 

if [ -d laSenia/dptoInf/aula23/ ] && [ -d laSenia/dptoInf/aulaInf01/ ] && [ -d laSenia/dptoInf/aulaInf02/ ]; then
echo "El departamento de informatica esta lleno"
else
echo "El departamento de informatica esta vacio"
fi

if [ -d laSenia/dptoMat/aula21/ ] && [ -d  laSenia/dptoMat/aula23/ ]; then
echo "El departamento de matematicas esta lleno"
else
echo "El departamento de matematicas esta vacio"
fi
