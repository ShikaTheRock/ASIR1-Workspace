---
title: "TAREA: Topologias"
author: Hector.sH
date: "27.10.2025"
subject: "Aplicaciones Web"

titlepage: true
titlepage-background: ./portada.jpg
toc-own-page: true
titlepage-text-color: ffffff
page-background: ./watermark.jpg
---


## TAREA 03

¿Qué topología crees tú que es la más adecuada para la red local de un centro educativo?
Explica el por qué razonadamente.

1. Escalabilidad:

En una escuela, el número de dispositivos (computadoras, impresoras, proyectores, etc.) puede aumentar con el tiempo. La topología de estrella permite añadir dispositivos con facilidad sin afectar a los demás equipos. Simplemente se conectan nuevos dispositivos al concentrador o switch central. Esto es clave, porque las necesidades de la red en un centro educativo pueden crecer con el tiempo.

2. Facilidad de mantenimiento:

La topología de estrella es fácil de mantener. Si hay un problema con un dispositivo específico, solo se necesita revisar esa conexión, ya que cada dispositivo está directamente conectado a un punto central. Esto facilita la solución de problemas sin afectar a toda la red, lo cual es crucial en un entorno educativo donde la red debe estar funcionando la mayor parte del tiempo.

3. Resiliencia:

En la topología de estrella, si uno de los dispositivos falla, solo ese dispositivo se ve afectado. La red seguirá funcionando normalmente porque los demás dispositivos no están directamente conectados entre sí. Esto ofrece una mayor resiliencia frente a fallos, algo importante en un entorno donde se necesita garantizar que la mayoría de los estudiantes y personal puedan acceder a la red en todo momento.

4. Facilidad de control:

Con la topología de estrella, el punto central (como un switch o router) facilita la gestión de la red. El administrador de la red puede gestionar fácilmente el tráfico, controlar el acceso a Internet, y resolver problemas de forma centralizada. Esto también ayuda a mantener la seguridad, ya que todo el tráfico pasa por un único punto.

5. Rendimiento:

La topología de estrella, si se usa con switches de buena calidad, puede proporcionar un alto rendimiento porque cada dispositivo tiene una conexión dedicada al switch, reduciendo la posibilidad de colisiones de datos (que pueden ocurrir en topologías como bus o anillo).

6. Costo:

Aunque la topología de estrella puede requerir más cables en comparación con una topología de bus, el costo de los switches hoy en día es relativamente bajo. Además, los beneficios en términos de facilidad de mantenimiento y expansión superan los costos adicionales.

Alternativas:

Aunque la topología de estrella es generalmente la mejor opción, también podrías considerar:

Topología Mixta: Si el centro educativo es muy grande y tiene diferentes edificios, puede ser útil combinar estrella con otras topologías (como bus o anillo) en ciertos segmentos de la red para optimizar la conectividad entre diferentes partes del campus. Sin embargo, esto agregaría complejidad.

Topología de bus: Puede ser más barata de implementar, pero a medida que la red crece, puede haber más colisiones y problemas de rendimiento. Además, si el cable principal falla, toda la red se vería afectada.