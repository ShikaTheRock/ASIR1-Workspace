---
title: "TAREA: GNS3 Switches 2"
author: Hector.sH
date: "19.1.2026"
subject: "Aplicaciones Web"

titlepage: true
titlepage-background: ./portada.jpg
toc-own-page: true
toc: true
titlepage-text-color: ffffff
page-background: ./watermark.jpg
---

# ```interface bridge mac-address print```

Muestra las MAC que se han configurado para el bridge

# ```interface bridge host print```

Lo mismo que arriba pero las han pillado de manera dinamica

# ```interface bridge mac-address add mac-address=00:11:22:33:44:55 interface=ether2```

 Añade una MAC estática, obligando al bridge a tirar todo el tráfico hacia esa MAC por ether2.

# ```interface bridge mac-address remove [número_de_entrada]```

Elimina una MAC estática de la tabla del bridge