---
title: "TAREA: SAI"
author: Hector.sH
date: "10.11.2025"
subject: "Redes"

titlepage: true
titlepage-background: ./portada.jpg
toc-own-page: true
titlepage-text-color: ffffff
page-background: ./watermark.jpg
---

# Tarea sai

Existen tres tipos de SAI: SAI off line , SAI Interactivo y SAI on line . Busca en Internet una definición y para qué tarea es más apropiada cada uno de ellos.

Un SAI es un Sistema de Alimentación Ininterrumpida,  son dispositivos que se utilizan  para proporcionar protección contra problemas eléctricos y cortes de corriente también son conocidos por sus siglas en Ingles UPS (Uninterruptible Power Supply). Existen tres tecnologías que diferencian el  nivel de protección que nos ofrece un SAI,  Off-Line, Interactiva o In-Line y On-Line.

## Sais Off-Line

Un SAI dotado con tecnología Off-Line suministra la corriente eléctrica sin ningún filtro a los dispositivos conectados,  este tipo de tecnología carece de AVR (Regulador de voltaje). El SAI  Off-Line solamente empezará a funcionar cuando detecte un fallo de corriente eléctrica, es en este momento preciso cuando el SAI conmuta a modo baterías, es decir se comenzará a suministrar la energía que ha ido almacenando en sus baterías a los dispositivos conectados. Estos Sais necesitan un tiempo de conmutación (normalmente 2-10 ms) para pasar a modo baterías, es preciso tener este dato en cuenta a la hora de conectar dispositivos sensibles que pudieran verse afectados en el proceso de conmutación,  es impórtate indicar que este tipo de Sais son solo recomendables para las zonas que disponen de una red estable ya que al no realizar ningún filtrado de la corriente, solo protegen ante un corte de suministro eléctrico.

## Sais Interactivos In-Line

Un SAI Interactivo o In-Line ofrece una protección eléctrica intermedia, su tecnología es similar a la de los Sais Off-Line pero incorpora una serie de filtros activos como microprocesador que controla las fluctuaciones de la red eléctrica en ±15%, regulando la tensión de salida (efecto Buck/Boos AVR Integrado) habitualmente este tipo de Sais devuelven una onda pseudo-sinusoidal o sinusoidal pura dependiendo del modelo , este proceso de filtrado y mejora de la corriente que llega a los dispositivos conectados al SAI se realiza sin que entren a funcionar las baterías, por lo que la protección con un SAI interactivo es superior aún sin sufrir apagones. Al igual que los SAI Off-line tienen un pequeño tiempo de conmutación en el que no hay suministro eléctrico, normalmente de 2-10 ms, es por este motivo por el que se tiene que tener especial cuidado a la hora de conectar dispositivos sensibles que pudieran verse afectados en el tiempo de conmutación a modo baterías.

## Sais OnLine

Por último está el SAI On-Line, que realiza una doble conversión de la energía eléctrica que recibe, transformándola en continua y después a alterna de nuevo, eliminando de esta manera todos los problemas que pueda tener. Un Sai On-Line siempre proporciona energía eléctrica directamente desde sus baterías mientras estas se van cargando de la red, y esto es lo que garantiza que la protección contra cualquier problema de la red eléctrica sea total. Debido a su alta fiabilidad, la tecnología On-Line ocupa el sector profesional en el mercado de SAIS y está generalmente destinada a proteger servidores, equipos industriales o cualquier instalación informática que por su importancia o coste necesite la seguridad de no verse afectados por problemas derivados de la red eléctrica.