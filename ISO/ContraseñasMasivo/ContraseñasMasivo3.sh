#!/bin/bash

csvuser=0

name_adapt(){
    echo $1 | awk -F " " {'print $1'} | tr '[:upper:]' '[:lower:]'
}

create_user() {
    sudo useradd -c "$1" -s "/usr/bin/bash" -d "/home/$3/$2" -m $2
    if ! [ -d /etc/skel/Equipaje ]; then
        mkdir /etc/skel/Equipaje
    fi
    echo "sauron" | passwd -s $2
}

is_user_up(){
    cat /etc/passwd | grep -q $1
}

csv_user(){
    let csvuser=$csvuser+1
}



if ! [ $EUID -eq 0 ]; then
    echo "Only sudo"
    exit 1
fi

while read line; do
    name=$(echo $line | awk -F "," {'print $1'})
    new_name=$(name_adapt "$name") 
    raza=$(echo $line | awk -F "," {'print $2'})
    is_user_up $new_name
    if [ $? -eq 0 ]; then
        echo "$new_name ya existe!!"
    else
        if [ "$new_name" != "nombre" ]; then
            create_user "$name" "$new_name" "$raza"
            csv_user
        fi
    fi

done < rivendel.csv 

echo "El numero de lineas del fichero es de :  $(cat rivendel.csv | wc -l)"

echo "El numero de usuarios actual es de: $(cat /etc/passwd | wc -l)"

echo "Se han creado $csvuser usuarios."

