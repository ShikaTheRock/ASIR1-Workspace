---
title: "TAREA-1: Actividad 9-14"
author: Hector.sH
date: "25.9.2025"
subject: "Hardware"

titlepage: true
titlepage-rule-height: 0
titlepage-background: ./portada.jpg
toc-own-page: true
tov: true
titlepage-text-color: ffffff
page-background: ./watermark.jpg
---

# Ejercicio 9 : Monitorización básica de la RAM


## Ejecuta free -h y explica qué significan las columnas Mem, Swap y buff/cache.
```bash 
shikatherock@stargate:~$ LANG=C free -h
               total        used        free      shared  buff/cache   available
Mem:           4.5Gi       1.8Gi       509Mi        96Mi       2.2Gi       2.8Gi
Swap:          4.0Gi          0B       4.0Gi
```
* Muestra la cantidad total de memoria física y de intercambio (swap) libre y usada en el sistema, así como los buffers y cachés usados por el kernel.
La información se obtiene analizando /proc/meminfo. Las columnas mostradas son:

    - total
Memoria total utilizable (MemTotal y SwapTotal en /proc/meminfo).
Esto incluye la memoria física y la de intercambio menos algunos bits reservados y el código binario del kernel.

    - used
Memoria usada o no disponible (calculada como total - available).

    - free
Memoria no utilizada (MemFree y SwapFree en /proc/meminfo).

    - shared
Memoria usada (principalmente) por tmpfs (Shmem en /proc/meminfo).

    - buffers
Memoria utilizada por los buffers del kernel (Buffers en /proc/meminfo).

    - Cache
Memoria utilizada por la caché de páginas y slabs (Cached y SReclaimable en /proc/meminfo).


## Usa vmstat 1 5 y describe qué información proporciona sobre la memoria virtual.
```bash
shikatherock@stargate:~$ vmstat 1 5
procs -----------memory---------- ---swap-- -----io---- -system-- -------cpu-------
 r  b   swpd  libre   búf caché   si   so    bi    bo   in   cs us sy id wa st gu
 3  1      0 361336  69064 2458604    0    0   318   136 1182    3  3  2 95  0  0  0
 0  0      0 361336  69064 2458612    0    0     0     0  975  618  1  1 98  0  0  0
 0  0      0 361336  69064 2458612    0    0     0     0  901  465  1  1 99  0  0  0
 0  0      0 361336  69064 2458612    0    0     0     0 1550  911  1  1 98  0  0  0
 0  0      0 361600  69064 2458612    0    0     0     0  773  506  1  1 98  0  0  0
```
Segun el man:
Procs
       r: The number of runnable processes (running or waiting for run time).
       b: The number of processes blocked waiting for I/O to complete.

   Memory
       These are affected by the --unit option.
       swpd: the amount of swap memory used.
       free: the amount of idle memory.
       buff: the amount of memory used as buffers.
       cache: the amount of memory used as cache.
       inact: the amount of inactive memory.  (-a option)
       active: the amount of active memory.  (-a option)

   Swap
       These are affected by the --unit option.
       si: Amount of memory swapped in from disk (/s).
       so: Amount of memory swapped to disk (/s).

   IO
       bi: Kibibyte received from a block device (KiB/s).
       bo: Kibibyte sent to a block device (KiB/s).
System
       in: The number of interrupts per second, including the clock.
       cs: The number of context switches per second.

   CPU
       These are percentages of total CPU time.
       us: Time spent running non-kernel code.  (user time, including nice time)
       sy: Time spent running kernel code.  (system time)
       id: Time spent idle.  Prior to Linux 2.5.41, this includes IO-wait time.
       wa: Time spent waiting for IO.  Prior to Linux 2.5.41, included in idle.
       st: Time stolen from a virtual machine.  Prior to Linux 2.6.11, unknown.
       gu: Time spent running KVM guest code (guest time, including guest nice).

## Abre htop y ordena los procesos por uso de memoria. ¿Qué proceso consume más RAM en tu sistema?

![](/home/shikatherock/ASIR1-Workspace/HARDWARE/Practica2-BaseHardware/1.png)



# Ejercicio 10 : Memoria Virtual y Swap

## Lista los dispositivos de swap activos con cat /proc/swaps.
```bash
shikatherock@stargate:~$ cat /proc/swaps
Filename				Type		Size		Used	Priority
/swap.img               file		4194300		256	    -2
```
## Crea un archivo de swap de 1GB en /swapfile usando fallocate y mkswap, actívalo con swapon y verifica que aparece en free -h.
```bash
sudo fallocate -l 1G /swapfile
chmod 0600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

free -h
               total       usado       libre  compartido   búf/caché  disponible
Mem:           4,5Gi       1,7Gi       1,1Gi        25Mi       1,7Gi       2,8Gi
Inter:         5,0Gi          0B       5,0Gi

```
## Desactiva el swap temporalmente con swapoff /swapfile y observa cómo afecta al rendimiento del sistema.

```bash
shikatherock@stargate:~$ sudo swapoff /swapfile

```

Va mas o menos igual

# Ejercicio 11 : Uso de Memoria por Proceso

```bash
shikatherock@stargate:~$ ps aux --sort=-%mem | head
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
shikath+    2861  5.5 10.7 11664604 510580 ?     Sl   10:00   1:45 /snap/firefox/6836/usr/lib/firefox/firefox
shikath+    3372  2.1  9.8 2992372 467160 ?      Sl   10:00   0:41 /snap/firefox/6836/usr/lib/firefox/firefox -contentproc -isForBrowser -prefsHandle 0:44777 -prefMapHandle 1:274876 -jsInitHandle 2:223368 -parentBuildID 20250919050651 -sandboxReporter 3 -chrootClient 4 -ipcHandle 5 -initialChannelId {f03181b2-822a-417c-8212-17e807e946e1} -parentPid 2861 -crashReporter 6 -crashHelper 7 -greomni /snap/firefox/6836/usr/lib/firefox/omni.ja -appomni /snap/firefox/6836/usr/lib/firefox/browser/omni.ja -appDir /snap/firefox/6836/usr/lib/firefox/browser 9 tab
shikath+    3375  1.2  6.5 2707392 308776 ?      Sl   10:00   0:24 /snap/firefox/6836/usr/lib/firefox/firefox -contentproc -isForBrowser -prefsHandle 0:44777 -prefMapHandle 1:274876 -jsInitHandle 2:223368 -parentBuildID 20250919050651 -sandboxReporter 3 -chrootClient 4 -ipcHandle 5 -initialChannelId {740ce0ee-4e83-4cbf-8730-38c08066e6ee} -parentPid 2861 -crashReporter 6 -crashHelper 7 -greomni /snap/firefox/6836/usr/lib/firefox/omni.ja -appomni /snap/firefox/6836/usr/lib/firefox/browser/omni.ja -appDir /snap/firefox/6836/usr/lib/firefox/browser 10 tab
shikath+    3155  0.6  4.1 19644056 198948 ?     Sl   10:00   0:11 /snap/firefox/6836/usr/lib/firefox/firefox -contentproc -isForBrowser -prefsHandle 0:39946 -prefMapHandle 1:274876 -jsInitHandle 2:223368 -parentBuildID 20250919050651 -sandboxReporter 3 -chrootClient 4 -ipcHandle 5 -initialChannelId {1c0911f4-722c-4950-bc1d-5b2122b26a0f} -parentPid 2861 -crashReporter 6 -crashHelper 7 -greomni /snap/firefox/6836/usr/lib/firefox/omni.ja -appomni /snap/firefox/6836/usr/lib/firefox/browser/omni.ja -appDir /snap/firefox/6836/usr/lib/firefox/browser 3 tab
shikath+    3285  0.7  3.9 2674324 185104 ?      Sl   10:00   0:14 /snap/firefox/6836/usr/lib/firefox/firefox -contentproc -isForBrowser -prefsHandle 0:50108 -prefMapHandle 1:274876 -jsInitHandle 2:223368 -parentBuildID 20250919050651 -sandboxReporter 3 -chrootClient 4 -ipcHandle 5 -initialChannelId {c6abd968-28ec-4c21-b2c9-97ec04c5023d} -parentPid 2861 -crashReporter 6 -crashHelper 7 -greomni /snap/firefox/6836/usr/lib/firefox/omni.ja -appomni /snap/firefox/6836/usr/lib/firefox/browser/omni.ja -appDir /snap/firefox/6836/usr/lib/firefox/browser 7 tab
shikath+    3458  0.2  3.8 2679948 183796 ?      Sl   10:01   0:04 /snap/firefox/6836/usr/lib/firefox/firefox -contentproc -isForBrowser -prefsHandle 0:44777 -prefMapHandle 1:274876 -jsInitHandle 2:223368 -parentBuildID 20250919050651 -sandboxReporter 3 -chrootClient 4 -ipcHandle 5 -initialChannelId {0a69072d-ff5f-480f-b3f6-0020137e253d} -parentPid 2861 -crashReporter 6 -crashHelper 7 -greomni /snap/firefox/6836/usr/lib/firefox/omni.ja -appomni /snap/firefox/6836/usr/lib/firefox/browser/omni.ja -appDir /snap/firefox/6836/usr/lib/firefox/browser 12 tab
shikath+    3426  0.7  3.2 2553256 152168 ?      Sl   10:00   0:14 /snap/firefox/6836/usr/lib/firefox/firefox -contentproc -isForBrowser -prefsHandle 0:44777 -prefMapHandle 1:274876 -jsInitHandle 2:223368 -parentBuildID 20250919050651 -sandboxReporter 3 -chrootClient 4 -ipcHandle 5 -initialChannelId {bdc5c499-aa0b-40a2-a7d8-6486ba768e20} -parentPid 2861 -crashReporter 6 -crashHelper 7 -greomni /snap/firefox/6836/usr/lib/firefox/omni.ja -appomni /snap/firefox/6836/usr/lib/firefox/browser/omni.ja -appDir /snap/firefox/6836/usr/lib/firefox/browser 11 tab
shikath+    3192  0.2  3.1 2517000 147512 ?      Sl   10:00   0:04 /snap/firefox/6836/usr/lib/firefox/firefox -contentproc -isForBrowser -prefsHandle 0:40052 -prefMapHandle 1:274876 -jsInitHandle 2:223368 -parentBuildID 20250919050651 -sandboxReporter 3 -chrootClient 4 -ipcHandle 5 -initialChannelId {819d250a-a0bb-4a94-9b4e-87ddb2bf6923} -parentPid 2861 -crashReporter 6 -crashHelper 7 -greomni /snap/firefox/6836/usr/lib/firefox/omni.ja -appomni /snap/firefox/6836/usr/lib/firefox/browser/omni.ja -appDir /snap/firefox/6836/usr/lib/firefox/browser 5 tab
shikath+    2587  0.4  2.4 1032540 116628 ?      Sl   10:00   0:08 xfwm4 --replace
```

Ahora mataremos el navegador

```bash
pmap -x 2861 
```
* RSS es la cantidad de memoria ram que esta usando el proceso
* TTY en en qe terminal se esta ejecutando



smem ofrece una visión más precisa del consumo de memoria.

Con las opciones:

    -r -> reporta la memoria en forma legible y resumida.

    -k -> usa kilobytes como unidad.

# Ejercicio 12 : Optimización y Liberación de Memoria

```bash
shikatherock@stargate:~$ free -h
               total       usado       libre  compartido   búf/caché  disponible
Mem:           4,5Gi       1,8Gi       720Mi        99Mi       2,0Gi       2,7Gi
Inter:         5,0Gi          0B       5,0Gi

```
-Esto libera pagecache

```bash
echo 3 | sudo tee /proc/sys/vm/drop_caches
```

```bash
               total       usado       libre  compartido   búf/caché  disponible
Mem:           4,5Gi       1,8Gi       2,1Gi       104Mi       637Mi       2,8Gi
Inter:         5,0Gi          0B       5,0Gi

```

- Ahora hay mucho mas espacio libre

# Ejercicio 13 : Simulación de Fuga de memoria

## Script en Bash

```bash
#!/bin/bash
# Script que simula fuga de memoria añadiendo datos a un array infinito

memleak=()

while true; do
    memleak+=("leak_leak_leak")
done
```

```bash
PID USER   PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
5693 user   20   0  850000 830000   2000 R  99.9 41.2   0:25.43 bash
```

```bash
kill -9 5693
```

# Ejercicio 14: Análisis de Archivos de Configuración

```bash
shikatherock@stargate:~$ cat /proc/sys/vm/swappiness
60
```
* Es un archivo en el kernel de Linux que contiene un valor numérico entre 0 y 100 que controla la agresividad con la que el sistema utiliza el espacio de intercambio (swap) en comparación con la memoria RAM

```bash
sudo echo 10 > /proc/sys/vm/swappiness
```
```bash
shikatherock@stargate:~$ /proc/sys/vm/swappiness
10
```


