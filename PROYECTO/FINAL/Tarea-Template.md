---
titlepage: true
titlepage-rule-height: 0
titlepage-background: ./portada.jpg
toc: true
toc-own-page: true
titlepage-text-color: ffffff
---

# Proyecto de Instalación de Telecomunicaciones
## Zamorano & Asociados — Nueva sede Paiporta
**Empresa instaladora:** Villanueva SL  
**Curso:** 2025-2026 | IES La Sénia  
**Fecha de redacción:** Abril 2026

---

## 1. Memoria Técnica

### 1.1 Descripción del edificio

El edificio donde se realizará la instalación es un adosado de dos plantas situado en Paiporta (Valencia). A continuación se describen las zonas relevantes con sus superficies según el plano facilitado por Zamorano & Asociados:

**Planta Baja:**
| Zona | Superficie |
|---|---|
| Garaje / Zona de desarrollo | 43,86 m² |
| Archivo (armario de comunicaciones) | 2,44 m² |
| Entrada | 5,97 m² |

**Primera Planta:**
| Zona | Superficie |
|---|---|
| Sala de trabajo / reuniones / cocina | 39,37 m² |
| Oficina 1 (diseño y contenido) | 12,94 m² |
| Oficina 2 (gerencia) | 6,09 m² |
| Archivo (primera planta) | 9,88 m² |
| Pasillo | 5,23 m² |
| Baño | 6,35 m² |
| Aseo | 3,48 m² |
| Terraza | 5,30 m² |
| Entrada | 2,13 m² |

---

### 1.2 Operadora de Internet

Tras comparar las principales operadoras disponibles en la zona de Paiporta, hemos decidido contratar el servicio de **Movistar Empresas** con su tarifa de fibra simétrica de **10 Gbps** (10000 Mbps de subida y bajada). Esta tarifa tiene un coste de **59,90 €/mes** con permanencia de 12 meses e incluye el router de la operadora sin coste adicional.

Esta velocidad es más que suficiente para las necesidades de la empresa, que requiere conexiones estables y de baja latencia para el desarrollo y prueba de videojuegos, además de las videoconferencias con equipos internacionales.

> El router de la operadora se instalará en el armario de comunicaciones ubicado en la zona de Archivo de planta baja.

---

### 1.3 Cableado estructurado

Para la instalación se utilizarán dos categorías de cable distintas:

- **Cable Cat 7 (backbone):** Para la interconexión entre la planta baja y la primera planta. Esta categoría soporta velocidades de hasta 10 Gbps y frecuencias de hasta 600 MHz, lo que garantiza que el enlace entre plantas no sea nunca un cuello de botella. Se utilizarán aproximadamente **25 metros** de este cable, que irá canalizado por canaleta empotrada en la pared.

- **Cable Cat 6A (horizontal):** Para todas las conexiones individuales de cada puesto de trabajo dentro de cada planta. Soporta 10 Gbps a 500 MHz y es perfecto para las distancias que hay en el interior del edificio. En total se estiman unos **280 metros** de Cat 6A repartidos entre las dos plantas.

---

### 1.4 Equipamiento por zonas

#### Planta Baja — Zona Archivo (Armario de Comunicaciones)

Esta es la zona más importante de toda la instalación, ya que aquí estará el núcleo de la red. El armario de comunicaciones será un **rack de 12U** de sobremesa, y contendrá los siguientes equipos:

| Equipo | Modelo / Especificaciones | Cantidad |
|---|---|---|
| Router operadora | Proporcionado por Movistar | 1 |
| Patch panel | 24 puertos Cat 6A | 1 |
| Switch gestionable (core) | TP-Link TL-SG3428 (24p GbE + 4p SFP+) | 1 |
| UPS | APC Back-UPS 950VA | 1 |
| Servidor / NAS | Synology DS923+ (4 bahías) + 4x HDD 4TB | 1 |

El switch gestionable nos permite crear las VLANs necesarias para separar la red de desarrollo, la WiFi de invitados y la red general de la empresa. El UPS protegerá todos estos equipos ante posibles cortes de luz, dando tiempo suficiente para un apagado controlado.

El NAS con 4 bahías configuradas en RAID 5 proporcionará un espacio útil de unos 12 TB para copias de seguridad y almacenamiento compartido en red (carpetas de usuario, recursos del proyecto, etc.).

#### Planta Baja — Garaje / Zona de Desarrollo (43,86 m²)

Aquí se instalarán **10 puestos de trabajo** para los desarrolladores de software. Cada puesto dispondrá de una **roseta doble Cat 6A** (dos tomas RJ-45), de modo que si una conexión falla el desarrollador puede usar la segunda sin interrumpir su trabajo.

Además, se instalará **1 punto de acceso WiFi** (AP) dedicado exclusivamente a la subred de desarrollo. Este AP estará en una VLAN separada del resto de la red de la empresa, de forma que los dispositivos móviles que usen los desarrolladores para probar sus aplicaciones no tengan acceso directo a los servidores ni a otras redes internas.

| Equipo | Modelo | Cantidad |
|---|---|---|
| Rosetas dobles Cat 6A | Simon 500 Cima | 10 |
| Punto de acceso WiFi | Ubiquiti UniFi U6-Lite | 1 |
| Switch de planta (PoE) | TP-Link TL-SG2218P (16p PoE+) | 1 |

---

#### Primera Planta — Oficina 2 / Gerencia (6,09 m²)

Despacho del gerente y del posible vicedirector creativo. Se instalarán **2 rosetas dobles Cat 6A** (4 tomas en total), tal y como indica el proyecto.

| Equipo | Cantidad |
|---|---|
| Rosetas dobles Cat 6A | 2 |

---

#### Primera Planta — Oficina 1 / Diseño y Contenido (12,94 m²)

En esta oficina trabajan los equipos de diseño gráfico y contenido narrativo. Habrá **5 puestos de trabajo**, por lo que se instalarán **5 rosetas dobles Cat 6A**.

Los equipos de esta zona necesitarán también tabletas digitales (tipo Wacom) que se conectarán por USB directamente a los ordenadores, por lo que no requieren tomas de red adicionales.

| Equipo | Cantidad |
|---|---|
| Rosetas dobles Cat 6A | 5 |

---

#### Primera Planta — Sala de Trabajo / Reuniones / Cocina (39,37 m²)

Esta es la zona más compleja en cuanto a conectividad, ya que tiene varias funciones distintas. Los equipos a instalar son:

| Equipo | Modelo | Cantidad |
|---|---|---|
| Roseta doble Cat 6A (PC 3D) | Simon 500 Cima | 1 |
| Roseta doble Cat 6A (impresora 3D) | Simon 500 Cima | 1 |
| Roseta doble Cat 6A (fotocopiadora) | Simon 500 Cima | 1 |
| Punto de acceso WiFi (invitados) | Ubiquiti UniFi U6-Lite | 1 |
| Televisión para videoconferencias | 65" 4K con entrada HDMI | 1 |
| Teléfonos IP | Grandstream GXP2160 | 2 |

El **AP de invitados** estará en una VLAN completamente aislada, sin acceso a ningún recurso interno de la empresa. Los invitados solo tendrán salida a internet.

Los **teléfonos IP** se conectarán de forma inalámbrica a través de este mismo AP pero en su propia VLAN de voz (VoIP), con QoS configurado en el switch para priorizar el tráfico de voz y evitar cortes en las videoconferencias.

La **fotocopiadora multifunción** estará conectada a la red local mediante cable, de modo que cualquier equipo de la empresa pueda imprimir en ella.

---

#### Primera Planta — Switch de planta

Para gestionar todos los equipos de la primera planta se instalará un switch en el archivo de esa misma planta (9,88 m²), que actuará como punto de distribución.

| Equipo | Modelo | Cantidad |
|---|---|---|
| Switch gestionable (PoE) | TP-Link TL-SG2218P (16p PoE+) | 1 |
| Patch panel | 24 puertos Cat 6A | 1 |
| Armario rack pared 6U | Genérico | 1 |

---

### 1.5 Diagrama lógico de la red

```
INTERNET (Movistar 1Gbps)
        |
   [Router Movistar]
        |
   [Switch Core 24p + 4SFP] -- [UPS] -- [NAS 4 bahías]
        |                 |
        | (Cat7/Fibra)    ----- VLAN 10: Red corporativa
        |                       VLAN 20: WiFi invitados
        |                       VLAN 30: WiFi devs (PB)
        |                       VLAN 40: VoIP
        |
   |---------------------------------------|
   |                                       |
[Switch PoE PB]                    [Switch PoE P1]
   |                                       |
   |-- 10x Rosetas dobles (Garaje)         |-- 5x Rosetas dobles (Ofic. 1)
   |-- AP WiFi Devs (VLAN 30)              |-- 2x Rosetas dobles (Ofic. 2)
                                           |-- 3x Rosetas dobles (Sala trabajo)
                                           |-- AP WiFi Invitados (VLAN 20)
```

---

### 1.6 Resumen de materiales

| Material | Cantidad total |
|---|---|
| Cable Cat 7 (backbone) | 25 m |
| Cable Cat 6A (horizontal) | 280 m |
| Rosetas dobles Cat 6A | 22 uds |
| Patch panel 24p Cat 6A | 2 uds |
| Switch gestionable PoE 16p | 2 uds |
| Switch core 24p + 4SFP | 1 ud |
| Router Movistar | 1 ud (operadora) |
| AP Ubiquiti UniFi U6-Lite | 2 uds |
| UPS 950VA | 1 ud |
| NAS Synology DS923+ | 1 ud |
| HDD 4TB (para NAS) | 4 uds |
| Rack 12U sobremesa | 1 ud |
| Armario rack pared 6U | 1 ud |
| Teléfonos IP Grandstream | 2 uds |
| Televisión 65" 4K | 1 ud |
| Canaletas y accesorios | — |

---

## 2. Planificación de Mano de Obra

### 2.1 Personal necesario

Para llevar a cabo este proyecto, el equipo de Villanueva SL estará compuesto por:

| Rol | Nombre | Responsabilidad |
|---|---|---|
| Jefe de proyecto / Técnico senior | Selva Twitch | Coordinación, configuración de red, armario |
| Técnico de instalaciones | Hector Selva | Cableado estructurado, rosetas, canaletas |
| Técnico de soporte | HSelva 217 | Montaje equipos, pruebas, documentación |

### 2.2 Fases del proyecto y estimación de horas

El proyecto se divide en 5 fases principales:

#### Fase 1 — Replanteo y preparación (2 días / 16 h)
- Visita al edificio para comprobar medidas reales
- Marcaje de recorridos de cableado y ubicaciones de rosetas
- Pedido de materiales

| Tarea | Responsable | Horas |
|---|---|---|
| Visita de replanteo | Hector + Selva | 4h |
| Documentación y pedido | Hector | 4h |
| Coordinación con Zamorano & Asociados | Hector | 4h |
| Preparación de herramientas y materiales | HSelva | 4h |

#### Fase 2 — Instalación de canaletas y cableado (3 días / 24 h)
- Instalación de canaletas por todas las zonas
- Tendido de cable Cat 6A horizontal
- Tendido de cable Cat 7 de backbone entre plantas

| Tarea | Responsable | Horas |
|---|---|---|
| Montaje de canaletas PB | Selva + HSelva | 8h |
| Montaje de canaletas P1 | Selva + HSelva | 8h |
| Tendido de cable Cat 6A | Selva | 6h |
| Tendido de cable Cat 7 (backbone) | Hector + HSelva | 2h |

#### Fase 3 — Instalación de rosetas y armarios (2 días / 16 h)
- Montaje e identificación de rosetas dobles
- Montaje del rack 12U en planta baja
- Montaje del armario 6U en primera planta
- Crimpado y certificación de los patch panels

| Tarea | Responsable | Horas |
|---|---|---|
| Instalación rosetas PB (10 uds) | Selva | 4h |
| Instalación rosetas P1 (7 uds) | Selva | 3h |
| Montaje racks y patch panels | Hector + HSelva | 5h |
| Etiquetado según TIA-606 | HSelva | 4h |

#### Fase 4 — Instalación y configuración de equipos activos (3 días / 24 h)
- Instalación de switches, UPS, NAS y router
- Configuración de VLANs, QoS y seguridad
- Configuración de puntos de acceso WiFi
- Configuración del NAS y carpetas compartidas

| Tarea | Responsable | Horas |
|---|---|---|
| Instalación física de equipos activos | Hector + HSelva | 6h |
| Configuración de switches y VLANs | Hector | 8h |
| Configuración APs y WiFi | Hector | 4h |
| Configuración NAS | Hector + HSelva | 4h |
| Instalación teléfonos IP | HSelva | 2h |

#### Fase 5 — Pruebas, certificación y entrega (2 días / 16 h)
- Pruebas de conectividad en todos los puestos
- Verificación de VLANs y aislamiento de redes
- Pruebas de velocidad y latencia
- Entrega de documentación al cliente

| Tarea | Responsable | Horas |
|---|---|---|
| Test de conectividad por puesto | Selva + HSelva | 6h |
| Pruebas de segmentación de red | Hector | 4h |
| Pruebas de velocidad y VoIP | Hector | 2h |
| Documentación final y entrega | Hector | 4h |

---

### 2.3 Cronograma

El proyecto tiene una duración estimada de **12 días laborables**, comenzando el **5 de mayo de 2026** y finalizando el **20 de mayo de 2026**.

```
SEMANA 1 (05/05 – 09/05)
|-- Lunes 05/05:     Fase 1 — Replanteo y preparación (día 1)
|-- Martes 06/05:    Fase 1 — Documentación y pedidos (día 2)
|-- Miércoles 07/05: Fase 2 — Canaletas y cableado PB (día 1)
|-- Jueves 08/05:    Fase 2 — Canaletas y cableado P1 (día 2)
|-- Viernes 09/05:   Fase 2 — Backbone y remates (día 3)

SEMANA 2 (12/05 – 16/05)
|-- Lunes 12/05:     Fase 3 — Rosetas y armarios (día 1)
|-- Martes 13/05:    Fase 3 — Patch panels y etiquetado (día 2)
|-- Miércoles 14/05: Fase 4 — Equipos activos físico (día 1)
|-- Jueves 15/05:    Fase 4 — Configuración VLANs y APs (día 2)
|-- Viernes 16/05:   Fase 4 — NAS, VoIP, remates (día 3)

SEMANA 3 (19/05 – 20/05)
|-- Lunes 19/05:     Fase 5 — Pruebas y certificación (día 1)
|-- Martes 20/05:    Fase 5 — Documentación y entrega 
```

**Hitos clave:**
- **06/05/2026** — Confirmación del pedido de materiales
- **12/05/2026** — Cableado completado al 100%
- **16/05/2026** — Red completamente configurada
- **20/05/2026** — Entrega oficial del proyecto

**Total de horas estimadas por trabajador:**

| Trabajador | Horas totales |
|---|---|
| Hector Selva (técnico senior) | 38h |
| Selva Twitch (técnico instalaciones) | 33h |
| HSelva 217 (técnico soporte) | 25h |
| **TOTAL** | **96h** |

---

## 3. Normativas y Estándares

### 3.1 Normativas ISO aplicables

Para esta instalación hay que cumplir varias normativas. Las más importantes son:

- **ISO/IEC 11801:2017** — Esta es la norma principal para el cableado estructurado genérico en edificios. Define los requistos de los cables, conectores, patch panels y la forma en la que se tienen que instalar. Nosotros seguiremos los requisitos para una instalacion de Clase EA (Cat 6A).

- **ISO/IEC 14763-2** — Norma que define cómo se ha de planificar e instalar el cableado de comunicaciones. Incluye cosas como las radios de curvatura mínimos del cable, la separación respecto a cables eléctricos y cómo etiquetar la instalación.

- **ISO/IEC 14763-3** — Complementa a la anterior y establece los procedimientos de prueba para verificar que el cableado instalado cumple con los requisitos de la categoría declarada. Todas las tomas de la instalación serán testadas con un certificador de cables.

- **ISO 9001:2015** — Sistema de gestión de calidad. Aunque como empresa pequeña no estamos certificados todavía, aplicamos sus principios en la documentación del proyecto y en la trazabilidad de los trabajos realizados.

- **ISO/IEC 27001:2022** — Seguridad de la información. La segmentación de la red en VLANs y el aislamiento de la red de invitados están alineados con los principios de esta norma, que el cliente debería valorar implementar en el futuro.

---

### 3.2 Tasa de Reciclaje

Todos los equipos electrónicos que se retiren durante la instalación (si los hubiera) o los embalajes y restos de cable se gestionarán conforme al **Real Decreto 110/2015**, que regula los residuos de aparatos eléctricos y electronicos (RAEE) en España.

Los residuos generados se entregarán a un punto limpio autorizado o a un gestor de residuos homologado. En concreto:

- **Cables y conectores sobrantes:** Reciclaje de cobre en gestor autorizado.
- **Embalajes de cartón y plástico:** Contenedores de reciclaje municipales.
- **Equipos electrónicos obsoletos:** Punto SIGFITO o punto limpio del Ayuntamiento de Paiporta.

Estimamos que se generarán aproximadamente **15-20 kg de residuos** entre recortes de cable, embalajes y materiales sobrantes.

---

### 3.3 Medidas de Sostenibilidad (Para los profesores que les gusta apagar los servidores)

Hemos tenido en cuenta varias medidas para que la instalación sea lo más sostenible posible:

**Eficiencia energética:**
- Los switches seleccionados (TP-Link TL-SG2218P) disponen de tecnología **Green Ethernet (IEEE 802.3az)**, que reduce automáticamente el consumo cuando los puertos no están en uso o detectan cables cortos.
- Los APs Ubiquiti UniFi U6-Lite tienen un consumo máximo de solo **12W**, muy por debajo de otros modelos equivalentes.
- El NAS Synology permite configurar horarios de hibernación de los discos duros fuera del horario laboral, reduciendo el consumo eléctrico significativamente.

**Longevidad de la instalación:**
- Usar Cat 6A en lugar de Cat 6 supone una inversión inicial algo mayor pero garantiza que la instalacion no quedará obsoleta en varios años, evitando tener que rehacerla.
- Todos los equipos activos seleccionados tienen un mínimo de 3 años de garantía del fabricante y repuestos disponibles, lo que reduce la generación de residuos electrónicos a largo plazo.

**Reducción de desplazamientos:**
- La posibilidad de gestionar todos los equipos de red de forma remota (mediante el controlador UniFi y el software de Synology) reduce la necesidad de desplazamientos físicos al edificio para labores de mantenimiento rutinario.

---

## 4. Presupuesto Detallado

### 4.1 Tipo de empresa

**Villanueva SL** es una Sociedad de Responsabilidad Limitada (SL) constituida en Valencia, con CIF ficticio B-98765432. Como SL, el IVA aplicable a todos los servicios es del **21%**. En el presupuesto que se detalla a continuación todos los precios se muestran primero sin IVA y el total final incluye el IVA correspondiente.

---

### 4.2 Permisos municipales

Para llevar a cabo los trabajos de obra menor (instalación de canaletas empotradas y paso de cables por paredes) en Paiporta, es necesario solicitar una **licencia de obras menores** en el Ayuntamiento de Paiporta.

Según la ordenanza fiscal del Ayuntamiento de Paiporta (Ordenanza nº 5 sobre el ICIO), el impuesto de construcciones, instalaciones y obras se calcula como el **4% del presupuesto de ejecución material** de la obra, que en nuestro caso corresponde a la parte de obra civil (canaletas y cajas empotradas), estimada en unos **800 €**.

| Concepto | Importe |
|---|---|
| Tasa tramitación licencia obra menor | 60,00 € |
| ICIO (4% sobre 800€ presupuesto obra) | 32,00 € |
| **Total permisos** | **92,00 €** |

---

### 4.3 Costes de Dominio y Hosting

Para la web corporativa de Villanueva SL:

| Concepto | Coste anual |
|---|---|
| Dominio .es (netlinksolutions.es) | 8,99 €/año |
| Hosting compartido (SiteGround Start) | 71,88 €/año |
| Certificado SSL (incluido en hosting) | 0,00 € |
| **Total dominio + hosting (año 1)** | **80,87 €** |

---

### 4.4 Costes de Materiales

#### Cableado y conectividad pasiva

| Material | Ud. | Precio/ud. | Total |
|---|---|---|---|
| Cable Cat 7 S/FTP (bobina 25m) | 1 | 45,00 € | 45,00 € |
| Cable Cat 6A U/FTP (bobina 305m) | 1 | 145,00 € | 145,00 € |
| Roseta doble Cat 6A (Simon 500) | 22 | 8,50 € | 187,00 € |
| Patch panel 24p Cat 6A | 2 | 42,00 € | 84,00 € |
| Latiguillos Cat 6A 0,5m (patch) | 30 | 3,50 € | 105,00 € |
| Latiguillos Cat 6A 2m (puesto trabajo) | 22 | 5,00 € | 110,00 € |
| Canaleta PVC 40x25mm (metro) | 60 | 2,80 € | 168,00 € |
| Canaleta PVC 60x40mm (metro) | 20 | 4,50 € | 90,00 € |
| Accesorios canaleta (esquinas, tapas…) | 1 (lote) | 45,00 € | 45,00 € |
| Cajas de empotrar y accesorios | 1 (lote) | 30,00 € | 30,00 € |
| **Subtotal cableado pasivo** | | | **1.009,00 €** |

#### Equipos activos de red

| Equipo | Ud. | Precio/ud. | Total |
|---|---|---|---|
| Switch core TP-Link TL-SG3428 | 1 | 280,00 € | 280,00 € |
| Switch PoE TP-Link TL-SG2218P | 2 | 220,00 € | 440,00 € |
| AP Ubiquiti UniFi U6-Lite | 2 | 99,00 € | 198,00 € |
| UPS APC Back-UPS 950VA | 1 | 135,00 € | 135,00 € |
| Rack 12U sobremesa | 1 | 95,00 € | 95,00 € |
| Armario rack pared 6U | 1 | 65,00 € | 65,00 € |
| Regleta de enchufes para rack (1U) | 2 | 22,00 € | 44,00 € |
| Organizador de cables para rack (1U) | 2 | 15,00 € | 30,00 € |
| **Subtotal equipos activos de red** | | | **1.287,00 €** |

#### Servidor y almacenamiento

| Equipo | Ud. | Precio/ud. | Total |
|---|---|---|---|
| NAS Synology DS923+ (4 bahías) | 1 | 499,00 € | 499,00 € |
| HDD Seagate IronWolf 4TB | 4 | 89,00 € | 356,00 € |
| **Subtotal servidor/almacenamiento** | | | **855,00 €** |

#### Equipos de comunicación

| Equipo | Ud. | Precio/ud. | Total |
|---|---|---|---|
| Teléfono IP Grandstream GXP2160 | 2 | 89,00 € | 178,00 € |
| Televisión 65" 4K (sala reuniones) | 1 | 599,00 € | 599,00 € |
| **Subtotal comunicación** | | | **777,00 €** |

#### TOTAL MATERIALES

| Categoría | Subtotal |
|---|---|
| Cableado y conectividad pasiva | 1.009,00 € |
| Equipos activos de red | 1.287,00 € |
| Servidor y almacenamiento | 855,00 € |
| Equipos de comunicación | 777,00 € |
| **TOTAL MATERIALES (sin IVA)** | **3.928,00 €** |

---

### 4.5 Costes de Mano de Obra

El precio/hora de cada técnico según la categoría profesional:

| Categoría | Precio/hora |
|---|---|
| Técnico senior (Jefe de proyecto) | 35,00 €/h |
| Técnico de instalaciones | 28,00 €/h |
| Técnico de soporte | 25,00 €/h |

| Trabajador | Horas | Precio/h | Total |
|---|---|---|---|
| Hector Selva (senior) | 38h | 35,00 € | 1.330,00 € |
| Selva Twitch (instalaciones) | 33h | 28,00 € | 924,00 € |
| HSelva 217 (soporte) | 25h | 25,00 € | 625,00 € |
| **TOTAL MANO DE OBRA (sin IVA)** | **96h** | | **2.879,00 €** |

---

### 4.6 Resumen y Total del Proyecto

| Concepto | Importe (sin IVA) |
|---|---|
| Permisos municipales (Ayto. Paiporta) | 92,00 € |
| Dominio y Hosting (año 1) | 80,87 € |
| Materiales | 3.928,00 € |
| Mano de obra | 2.879,00 € |
| **BASE IMPONIBLE** | **6.979,87 €** |
| IVA (21%) | 1.465,77 € |
| **TOTAL PROYECTO (con IVA)** | **8.445,64 €** |

> **Nota:** Este presupuesto tiene una validez de 30 días desde su fecha de emisión. No se incluye la cuota mensual de la operadora (59,90 €/mes con Movistar), ya que es un contrato directo entre la empresa cliente y la operadora.

---

*Documento elaborado por Villanueva SL para el Proyecto Intermodular 2025-2026 — IES La Sénia*
