#!/bin/bash

#Escribe un comando para listar todos las lineas que contienen la palabra “Mario” en el contenido del fichero “personajes.txt”

cat personajes.txt | grep "Mario"

#  Crea un comando que cuente cuántas veces aparece la palabra “Peach” en un archivo llamado “personajes.txt”.

cat personajes.txt | grep -o Peach | wc -l

# Utiliza un comando para mostrar el contenido del archivo “niveles.txt” y ordénalo alfabéticamente.

cat niveles.txt | sort -r

# Redirige la lista de power-ups de Mario, del archivo “items.txt” a un nuevo archivo llamado “powerups.txt”

cat items.txt | grep Power-Up >> powerups.txt

# Filtra y muestra solo los enemigos de Mario de un archivo llamado “personajes.txt”.

cat personajes.txt | grep -e "enemig" -e "villan"

# Cuenta cuántas monedas aparecen en un archivo de texto llamado “items.txt”.

cat items.txt | grep -e "Moneda" -e "moneda" | wc -l

#  Crea un archivo llamado “enemigos.txt” que contenga una lista de los enemigos de Mario.

cat personajes.txt | grep -e "enemig" -e "villan" >> enemigos.txt

# Usa un comando para encontrar y mostrar las líneas que contienen la palabra “estrella” en un archivo llamado “powerups.txt”.

cat powerups.txt | grep "estrella"

# Escribe un comando que muestre el contenido del archivo “niveles.txt” y que solo muestre las líneas que contienen la palabra “castillo”.

cat niveles.txt | grep "castillo"

# Cuenta cuántas veces aparece la palabra “hongo” en un archivo llamado “items.txt”.

cat items.txt | grep -o -e "hongo" -e "Hongo" | wc 

#  Encuentra y muestra las líneas que contienen la palabra “Bowser” en un archivo llamado “personajes.txt”.

cat personajes.txt | grep "Bowser"

# Utiliza un comando para agregar el texto “Nuevo power-up: Super Hoja” al final de un archivo llamado “powerups.txt”

echo Nuevo power-up: Super Hoja >> powerups.txt

# Filtra y muestra solo los nombres de los personajes que comienzan con la letra “L” en un archivo llamado “personajes.txt”

cat personajes.txt | grep ^L

# Redirige la lista de enemigos de Mario a un nuevo archivo llamado “enemigos_mario.txt”.

cat enemigos.txt >> enemigos_mario.txt

# Encuentra y muestra las líneas que contienen la palabra “princesa” en un archivo llamado “personajes.txt”.

cat personajes.txt | grep princesa

# Cuenta cuántas veces aparece la palabra “fuego” en un archivo llamado “items.txt”

cat items.txt | grep -o fuego | wc







