---
title: "TAREA-1: Motores de busqueda"
author: Hector.sH
date: "17.9.2024"
subject: "Aplicaciones Web"

titlepage: true
titlepage-rule-height: 0
titlepage-background: ./portada.jpg
toc: true
toc-own-page: true
titlepage-text-color: ffffff
page-background: ./watermark.jpg
---


# 1 Tarea 01: Bash comandos básicos
Realiza una o varias capturas de pantalla donde se muestren los comandos utilizados.

## 1. Crea un directorio llamado “mi_directorio”.
```bash
mkdir mi_directorio
```
## 3. Copia “mi_archivo.txt” al directorio principal de tu usuario.
```bash
cp ./mi_directorio/mi_archivo.txt ./mi_archivo.txt
```
## 4. Muestra el contenido de “mi_archivo.txt” en la terminal.
```bash
cat ./mi_archivo.txt
```
## 5. Renombra “mi_archivo.txt” a “nuevo_archivo.txt”.
```bash
mv mi_archivo.txt nuevo_archivo.txt
```
## 6. Crea otro directorio llamado “otro_directorio”.
```bash
mkdir otro_directorio
```
## 7. Mueve “nuevo_archivo.txt” al directorio “otro_directorio”.
```bash
mv nuevo_archivo.txt otro_directorio/
```
## 8. Cambia el directorio actual al directorio “otro_directorio”.
```bash
cd otro_directorio/
```
## 9. Muestra la ruta completa del directorio actual.
```bash
pwd
```
## 10. Lista los archivos y directorios en “otro_directorio”.
```bash
ls -la
```
## 11. Crea un archivo vacío llamado “archivo_vacio.txt” en “otro_directorio”.
```bash
touch archivo_vacio.txt
```
## 12. Copia “archivo_vacio.txt” al directorio principal de tu usuario.
```bash
cp archivo_vacio.txt ../archivo_vacio.txt
```
## 13. Muestra el contenido de “archivo_vacio.txt” en la terminal.
```bash
cat ../archivo_vacio.txt
```
## 14. Elimina “archivo_vacio.txt” del directorio principal de tu usuario.
```bash
rm ../archivo_vacio.txt
```
## 15. Cambia el nombre del directorio “otro_directorio” a “nuevo_directorio”.
```bash
cd ..
mv -r otro_directorio/ nuevo_directorio/
```
## 16. Cambia el directorio actual de nuevo al directorio principal de tu usuario.

Lo he hecho en la anterior con el cd ..

## 17. Elimina el directorio “mi_directorio” y su contenido.
```bash
rm -rf mi_directorio
```
## 18. Crea un nuevo archivo llamado “registro.txt” en el di.0rectorio principal de tu usuario.
```bash
touch $HOME/registro.txt
```
## 19. Agrega una línea de texto al archivo “registro.txt”.
```bash
echo "pepino" >> registro.txt
```
## 20. Muestra las primeras 5 líneas de “registro.txt”.
```bash
head -n 5 registro.txt
```
## 21. Agrega otra línea de texto al final de “registro.txt”.
```bash
echo patata >> registro.txt
```
## 22. Muestra las últimas 5 líneas de “registro.txt”.
```bash
tail -n 5 registro.txt
```
## 23. Busca todas las instancias de una palabra específica en “registro.txt”.
```bash
cat registro.txt | grep patata 
```
## 24. Muestra el número total de líneas en “registro.txt”.
```bash
cat registro.txt | wc -l
```
## 25. Muestra el número total de palabras en “registro.txt”
```bash
cat registro.txt | wc
```
## 26. Cambia los permisos de “registro.txt” para que solo el propietario pueda escribir en él.
```bash
chmod 007 registro.txt
```
## 27. Cambia el propietario de “registro.txt” a otro usuario en tu sistema.
```bash
chown hector:hector registro.txt
```
## 28. Crea un directorio llamado “respaldos” en el directorio principal de tu usuario.
```bash
mkdir respldos
```

## 29. Copia “registro.txt” al directorio “respaldos”.
```bash
cp registro.txt respaldos
```
## 30. Elimina “registro.txt” del directorio principal de tu usuario.
```bash
rm registro.txt
```
