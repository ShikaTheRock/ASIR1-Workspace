---
title: "TAREA - XML comprobacion"
author: Hector.sH
date: "23.9.2025"
subject: "Leng. Marcas"

titlepage: true
titlepage-background: ./portada.jpg
toc-own-page: true
titlepage-text-color: ffffff
page-background: ./watermark.jpg
---

# Comprobacion del codigo inical 

```xml
<?xm1 version="1.0" encoding="utf-8"?>
<padre>
  <hijo>
    <nombre>alumno 1</nombre>
    <apellidos>apl ap2</apellidos>
  </hijo>
  <hijo>
    <nombres>alumno 2</nombre>
    <apellidos>ap11 ap21</apellidos>
  </hijo>
</padre>
```


He visto principalmente 2 fallos, y uno que no sabria si colo carlo como tal, vamos a verlos

Primero:

```xml
<?xm1 version="1.0" encoding="utf-8"?>

```

Lo veis? Pone xm1 en lugar de xml, lo cambiamos

```xml
<?xm1 version="1.0" encoding="utf-8"?>

```
Segundo:

```xml
    <nombres>alumno 2</nombre>
```
Este es bastante menos obio que el anterior, pero sule ser de los errores que mas se pasan de vista, por si no lo veis, abre la etiqueta con nombreS y la acaba con nombre, vamos a retocarlo

```xml
    <nombre>alumno 2</nombre>
```
Tercero:

```xml
    <apellidos>apl ap2</apellidos>
```

Este era el que dudaba en si aceptar como error o no, en una linea posterior, los apellidos son ap11 y ap 21, haciendo referencia a que del apellido 1 es el segundo apellido 1 (ap11) pero enque pone apl, haciendo que no tuviera sentido, no afecta al xml como tal, pero lo cambiaremos

```xml
<?xml version="1.0" encoding="utf-8"?>
<padre>
  <hijo>
    <nombre>alumno 1</nombre>
    <apellidos>ap1 ap2</apellidos>
  </hijo>
  <hijo>
    <nombre>alumno 2</nombre>
    <apellidos>ap11 ap21</apellidos>
  </hijo>
</padre>

```

Asi quedaria el codigo con todos los cambios
