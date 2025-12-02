---
title: "TAREA-11: ¿A QUÉ SUBRED PERTENECE UN HOST?"
author: Hector.sH
date: "26.9.2025"
subject: "REDES"

titlepage: true
titlepage-background: ./portada.jpg
toc-own-page: true
toc: false
titlepage-text-color: ffffff
page-background: ./watermark.jpg
---

Si un nodo/host de una red tiene la dirección 172.16.45.14/30, ¿cuál es la dirección de la subred a la cual pertenece ese nodo? Explica razonadamente.

+ D - 172.16.45.12/30

**Porque?**

La /30 nos permite tocar los dos ultimas bits del .14 osea que el binario quedaria asi (E negrita los que no podemos tocar)

**000011**10 

Como podeis ver delos dos que nos quedan solo podemos sacar las siguientes variables: 12(00),13(01),14(10),15(11)

Y e la lista que se nos ha dado, solo coincide uno de esos, el .12
