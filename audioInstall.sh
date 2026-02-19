#!/bin/bash -x

#####///// Variables \\\\\#####

# ubicancion exacta del archivo de musica 
link=(https://shikatherock.neocities.org/icon.gif)
file=$(echo $link | awk  -F "/" '{print $NF}')


# Va a por el archivo indicado en $link
wget -q $link

# Procede a reproducirlo
# -f decide el volumen el maximo es 32768 (100%) con esa informacion apañatelas
mpg123 -f -12000 $file
