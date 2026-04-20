---
title: "TAREA: VLAN 2"
author: Hector.sH
date: "30.3.2026"
subject: "Aplicaciones Web"

titlepage: true
titlepage-background: ./portada.jpg
toc-own-page: true
titlepage-text-color: ffffff
page-background: ./watermark.jpg

header-includes:
  - \usepackage[export]{adjustbox}
  - \setkeys{Gin}{width=\linewidth,height=\textheight,keepaspectratio}

---

El estándar 802.1Q (o dot1q) es el protocolo que permite identificar a qué VLAN pertenece cada trama de datos.

Su funcionamiento se basa en insertar una "etiqueta" de 4 bytes en la cabecera Ethernet original. Esta etiqueta contiene el VLAN ID, un número que permite a los switches y routers saber exactamente qué tráfico pertenece a cada red lógica cuando comparten un mismo cable físico (enlace troncal).

Es fundamental para que el DHCP y el enrutamiento funcionen correctamente en redes segmentadas, ya que sin estas etiquetas el router no podría distinguir los paquetes de una subred de los de otra.