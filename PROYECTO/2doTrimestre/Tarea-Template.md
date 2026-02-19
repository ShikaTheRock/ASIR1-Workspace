---
titlepage: true
titlepage-rule-height: 0
titlepage-background: ./portada.jpg
toc: true
toc-own-page: true
titlepage-text-color: ffffff
page-background: ./watermark.jpg
---

# Memoria técnica  
## Proyecto de instalación de telecomunicaciones  
Zamorano & Asociados – Sede empresa de desarrollo de videojuegos (Paiporta)  

---

# 1. Introducción

En este documento se explica el diseño de la instalación de red para la nueva sede de una empresa de desarrollo de videojuegos en Paiporta.

La idea es montar una red rápida, estable y que permita trabajar en equipo sin cortes. También se ha pensado en que se pueda ampliar en el futuro sin tener que rehacer todo.

---

# 2. Conexión a Internet

Se va a contratar fibra DIGI PRO de 10 Gbps simétrica con IP fija.

## Características

- 10 Gbps de subida y bajada  
- IP fija pública para VPN y acceso remoto  
- Baja latencia  
- Router de DIGI en modo bridge  

## Precio aproximado

- Entre 120 y 150 EUR al mes  
- Instalación incluida  

Esto permite subir proyectos grandes, usar repositorios y hacer pruebas online sin saturar la red.

---

# 3. Direccionamiento IP

Red privada usada:

192.168.10.0/24

Segmentación por VLAN:

VLAN 10 - Desarrollo - 192.168.10.0/26 - GW 192.168.10.1  
VLAN 20 - Administración/Diseño - 192.168.10.64/27 - GW 192.168.10.65  
VLAN 30 - WiFi desarrolladores - 192.168.10.96/27 - GW 192.168.10.97  
VLAN 40 - WiFi invitados - 192.168.10.128/27 - GW 192.168.10.129  
VLAN 50 - Servidores/NAS - 192.168.10.160/28 - GW 192.168.10.161  
VLAN 60 - VoIP/Videoconf - 192.168.10.176/28 - GW 192.168.10.177  

NAS: 192.168.10.162

---

# 4. Armario de comunicaciones (CPD)

Dentro del rack van:

- Router DIGI (bridge)  
- Router/Firewall principal  
- Switch core 10 Gbps  
- Patch panel  
- NAS de 4 discos  
- SAI  

El switch core es el switch principal que une toda la red y conecta las dos plantas a 10 Gbps.

## Esquema del rack
```
+-----------------------------+
| RACK 19"                    |
+-----------------------------+
| Patch Panel                 |
| Switch CORE 10Gb            |
| Router / Firewall           |
| NAS / Servidor              |
| SAI (UPS)                   |
+-----------------------------+
```
---

# 5. Topología de red
```
Forma de estrella jerárquica:

           INTERNET
              |
       Router DIGI (bridge)
              |
     Router / Firewall principal
              |
        Switch CORE 10 Gbps
           /           \
          /             \
 Switch Planta Baja   Switch Planta 1
```

Entre plantas se usa cable Cat6A a 10 Gbps.

---

# 6. Cableado estructurado

- Cat 6 para puestos (1 Gbps)  
- Cat 6A para backbone entre plantas (10 Gbps)  
- Rosetas dobles en cada puesto  

---

# 7. Planta baja - Desarrollo

Entre 8 y 10 puestos con dos tomas RJ45 cada uno.

IPs de ejemplo:

Dev-01 - 192.168.10.10  
Dev-02 - 192.168.10.11  
Dev-03 - 192.168.10.12  

## Esquema

PUESTOS DESARROLLO

```
[PC1]--+--[Roseta doble]--+
[PC2]--+--[Roseta doble]--+
[PC3]--+--[Roseta doble]--+
[PC4]--+--[Roseta doble]--+---- Switch Planta Baja ---- CORE
[PC5]--+--[Roseta doble]--+
[PC6]--+--[Roseta doble]--+
[PC7]--+--[Roseta doble]--+
[PC8]--+--[Roseta doble]--+
```
## WiFi desarrolladores

```
SSID: DEV-LAB  
VLAN 30  
Rango: 192.168.10.100 - 126  

        ))))))))))  WiFi DEV-LAB
             |
        Punto de acceso
             |
        Switch Planta Baja
```
---

# 8. Primera planta

## Oficina 2 - Gerencia
```
Gerencia - 192.168.10.70  
Dirección - 192.168.10.71  

[PC Gerencia]--[Roseta doble]--+
                               +---- Switch Planta 1
[PC Dirección]--[Roseta doble]-+
```
---

## Oficina 1 - Diseño

5 puestos en VLAN 20

```
[PC1]--[Roseta doble]--+
[PC2]--[Roseta doble]--+
[PC3]--[Roseta doble]--+---- Switch Planta 1 ---- CORE
[PC4]--[Roseta doble]--+
[PC5]--[Roseta doble]--+
```
---

## Sala de trabajo

Equipos:

PC 3D - 192.168.10.80  
Impresora 3D - 192.168.10.81  
Fotocopiadora - 192.168.10.82  
Teléfono IP - 192.168.10.180  

WiFi invitados:

VLAN 40  
Rango: 192.168.10.130+  
```
SALA DE TRABAJO

           ))))))))))  WiFi invitados
                |
[PC 3D]----------+
[Impresora 3D]---+
[Fotocopiadora]--+---- Switch Planta 1 ---- CORE
[Teléfono IP]----+
```
---

# 9. Servidor NAS

IP: 192.168.10.162  
VLAN 50  

Funciones:

- Carpeta compartida  
- Copias de seguridad  
- DNS interno  

Configurado en RAID 5 con 4 discos.

---

# 10. Seguridad

- Firewall entre VLANs  
- WiFi invitados aislado  
- VPN para acceso remoto  
- WPA3 en WiFi  
- SAI con autonomía de 20-30 minutos  

---

# 11. Escalabilidad

Permite:

- Añadir más puestos  
- Más puntos WiFi  
- Subir a 2.5 Gbps en puestos  
- Añadir más servidores  

El backbone a 10 Gbps evita cuellos de botella.

---

# 12. Conclusión

La red propuesta es rápida, está separada por VLAN, tiene NAS central y WiFi diferenciada para usuarios e invitados.

Está preparada para crecer en el futuro y cumple lo necesario para una empresa de desarrollo de videojuegos.
