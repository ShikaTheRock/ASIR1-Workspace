#!/bin/bash -x

if [ $EUID -ne 0 ]; then
    
    echo "Non sudoers are not allowed to install this"
    exit 1 

fi


### INTSTALL CONFIG ###

aplay -l

echo "LEE LOS DISPOSITIVOS Y COMPRUEBA CUAL ES POR EL QUE DEBE SALIR EL AUDIO, DESPUES INTODUCE EL ID DE TARJETA Y EL DISPOSITIVO EN EL SIGUIENTE FORMATO: [id_tarj],[id_disp]"
read id_audio

cat > /home/audio/.sirenaConfig <<'EOF'
hours="13:07"
link="https://shikatherock.x10.mx/timbre.mp3"
volume="100"
# HOURS es un array de horas, introduce ahi la lista de horas que debera sonar 
# LINK es el link con la ubicacion exacta del timbre, por desgracia hasta hacer pruebas, solo contamos con que el timbre se llame de una manera y tenga un determinado formato
# VOLUME por si fuera necesario cambiar el volumen desde ahi.
# Estoy cansado, llevo una semana entera pegandome con este script, os pido como favor que no pongais letras ni valores float, donde claramente no estan destinados a ir, si alguien desea porseguir esto para que lo combruebe, pues bienvenido sera, pero por el momento esa es mi contribucion al instituto
EOF

echo "id_audio=$id_audio" >> /home/audio/.sirenaConfig

### INTSTALL SCRIPT ###

 apt install mpg123

cat > /home/audio/audio.sh <<'EOF'
#!/bin/bash
#####----- Variables -----#####

source /home/audio/.sirenaConfig

# ubicancion exacta del archivo de musica 
file=$(basename "$link")
#Esto le da el porcentaje de volumen 32768 es 100% por eso la regla de 3
let mp3_vol=$volume*32768/100


cp="true"
##### Transformacion de variables ppara el mpg123 #####

# Va a por el archivo indicado en $link
mkdir -p /home/audio/sirenas
wget -q -P /home/audio/sirenas "$link"

# He tenido que tirar un poco de chatgpt PORQUE ME ESTABA VOLVIENDO LOCO *L O C O* #

for h in $hours; do
    IFS=":" read -r hh mm <<< "$h"

    # Timestamp objetivo de hoy a esa hora
    target=$(date -d "$(date +%F) $hh:$mm:00" +%s)
    now=$(date +%s)

    sleep_seconds=$((target - now))

    # Si ya pasó la hora, saltar
    if [ "$sleep_seconds" -le 0 ]; then
        echo "La hora $h ya pasó, se salta"
        continue
    fi

    echo "Esperando $sleep_seconds segundos hasta $h"
    sleep "$sleep_seconds"

    echo "Sonando timbre a las $h"
    #mpg123 -q --no-control -f -"$mp3_vol" "/home/audio/sirenas/$file"
    /usr/bin/mpg123 -o alsa -a hw:$id_audio --no-control -f -"$mp3_vol" "/home/audio/sirenas/$file"
done
EOF

chmod +x /home/audio/audio.sh

echo "06 13 * * * shika /home/audio/audio.sh >> /home/shika/timbre.log 2>&1" >> /etc/crontab

sudo service cron reload
sudo systemctl restart cron.service