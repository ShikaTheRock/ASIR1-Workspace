---
title: "TAREA: ARP"
author: Hector.sH
date: "30.1.2026"
subject: "Aplicaciones Web"

titlepage: true
titlepage-background: ./portada.jpg
toc-own-page: true
titlepage-text-color: ffffff
page-background: ./watermark.jpg
---

# Ejercicio 1

## a) Crea una Red NAT en VirtualBox de clase C (con su máscara por defecto), que te permita comunicarte con el clan Harkonnen. Adjunta una captura de la configuración de la Red NAT.

![nat red config](swappy-20260130_114418.png)

## b) En una máquina virtual en Linux, modifica la configuración de red para asignarle mediante configuración estática una dirección IP, máscara y puerta de enlace del rango de la Red NAT que has creado. Añade además los DNS de Conselleria. Adjunta una captura con el fichero de configuración y otra tras utilizar el comando correspondiente para ver que, efectivamente, se ha aplicado la configuración. Además, realiza un ping a alguna web externa para ver que todo funciona correctamente y adjunta también la prueba

![netplan config](image.png)

![pings](swappy-20260130_122318.png)


# Ejercicio 2

## a) Modifica la configuración anterior para que la máquina virtual tenga configuración de red dinámica. A continuación cambia el modo de Red de esa máquina virtual en VirtualBox a “Adaptador puente”. Adjunta capturas donde se aprecien los cambios.

![netplan dhcp config](swappy-20260130_130306.png)

## b) Comprueba la dirección IP y la máscara que ha recibido la máquina. ¿Con qué facciones puedes comunicarte ahora? Adjunta captura donde se vea la configuración recibida y contesta a la pregunta.

![ip a](swappy-20260130_130349.png)

* No podria comunicarme con ninguna faccion. Estoy solo. En el espacio

## c) Ahora debes modificar la máquina virtual para establecer una configuración de red estática compatible con la anterior. A partir de la configuración dinámica obtenida, pon una dirección IP del mismo rango pero con el último byte con el valor 100 + el valor del último byte de tu equipo físico. Ejemplo: si tu equipo físico es el 192.168.4.108, ahora debes poner como último byte 208. Si utilizas un portátil en vez de un ordenador del aula, súmale 40 en vez de 200. Comprueba primero si esa dirección está disponible. Adjunta captura/s donde se aprecie lo siguiente

![ip a + ping](swappy-20260204_094810.png)

![netplan](swappy-20260204_095001.png)

# Ejercicio 3
## a) Se han oído rumores acerca de ciertos miembros de algunas facciones muy bien valorados y, por supuesto, quieres contactar con ellos para que te presten su servicio. Se trata de las hermanas 12 y 14 de las Bene Gesserit y de los guerreros 10 y 15 de los Sardaukar. Comprueba en la tabla arp de tu máquina virtual si aparecen estos guerreros/hermanas. Adjunta una captura de la comprobación

Pues no aparecen, no

