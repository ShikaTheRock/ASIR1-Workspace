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

!(/home/shikatherock/ASIR1-Workspace/HARDWARE/Practica2-BaseHardware/1.png)



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




