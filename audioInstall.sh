#!/bin/bash -x

if [ $EUID -ne 0 ]; then
    
    echo "Non sudoers are not allowed to install this"
    exit 1 

fi


### INTSTALL CONFIG ###

echo "Pon en orden las horas a las que deberan de sonar el timbre A EXCEPCION DE LAS 8!!! = "8:00" "8:55" "9:50" "10:45"
Aqui pon la url directa al archivo .mp3 de la cancion = http://shikatherock.neocities.org/icon.gif
Y aqui puedes ajustar el volumen si lo necesitas = 100" > /home/audio/.sirenaConfig

### INTSTALL SCRIPT ###

 apt install mpg123

echo "#####----- Variables -----#####
# ubicancion exacta del archivo de musica 
link=$(cat /home/audio/.sirenaConfig | head -n 2 | tail -n 1 | awk -F "=" '{print $2}')
file=$(echo $link | awk -F "/" '{print $NF}')
hours=$(cat /home/audio/.sirenaConfig | head -n 1 | tail -n 1 | awk -F "=" '{print $2}')
volume=$(cat /home/audio/.sirenaConfig | head -n 3 | tail -n 1 | awk -F "=" '{print $2}')
cp="true"
##### Transformacion de variables ppara el mpg123 #####
let mp3_vol=$volume*32768/100
# Va a por el archivo indicado en $link
wget -q $link
for op in $hours; do
    # Procede a reproducirlo
    # -f decide el volumen el maximo es 32768 (100%) con esa informacion apañatelas
    mpg123 -q --no-control -f -$mp3_vol $file
    echo $op
done" > /home/audio/audio.sh

chmod +x /home/audio/audio.sh

echo "0 8 * * * audio /home/audio/audio.sh" >> /etc/crontab