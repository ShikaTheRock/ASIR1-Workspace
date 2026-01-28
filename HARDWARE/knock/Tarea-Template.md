---
title: "Toc toc, Quien es?"
author: Hector.sH
date: "22.1.2026"
subject: "hardware"

titlepage: true
titlepage-rule-height: 0
titlepage-background: ./portada.jpg
toc-own-page: true
toc: true
titlepage-text-color: ffffff
page-background: ./watermark.jpg
---

# Instalar knockd

```bash
sudo pacman -S knockd
```

# Configurar knockd

```bash
sudo nano /etc/knockd.conf
```

```
[options]
    UseSyslog

[openSSH]
    sequence    = 1999,2000,2001
    seq_timeout = 10
    command     = /usr/bin/iptables -A INPUT -s %IP% -p tcp --dport 22 -j ACCEPT
    tcpflags    = syn

[closeSSH]
    sequence    = 2001,2000,1999
    seq_timeout = 10
    command     = /usr/bin/iptables -D INPUT -s %IP% -p tcp --dport 22 -j ACCEPT
    tcpflags    = syn
```

# Asegurar que SSH está cerrado por defecto

```bash
sudo iptables -A INPUT -p tcp --dport 22 -j DROP
```

# Configurar la interfaz de red

Yo tengo un error que no me permite usar el archivo "/etc/conf.d/knockd" 

Asi que editare el servicio (Aun sabiendo que si lo actualizo se desvanecera) (I use Arch btw)

```bash
sudo nano /usr/lib/systemd/system/knockd.service
```

```                  
[Unit]
Description=Port-Knocking Daemon
After=network.target

[Service]
ExecStart=/usr/bin/knockd -i wlan0

[Install]
WantedBy=multi-user.target
```

```bash
sudo systemctl daemon-reexec
sudo systemctl restart knockd
```

# Activar el servicio


```bash
sudo systemctl enable knockd
sudo systemctl start knockd
```

Verifica:

```bash
sudo systemctl status knockd
```

# Bloq cada 5 intentos

```bash
sudo nano /etc/nftables.conf
```

Añade esto en el nftables:

```
table inet filter {

    set knock_allowed {
        type ipv4_addr
        timeout 30s
    }

    set knock_blocked {
        type ipv4_addr
        timeout 5m
    }

    chain input {
        type filter hook input priority 0;
        policy drop;

        # IPs bloqueadas por fallos
        ip saddr @knock_blocked drop

        # Permitir SSH solo a IPs autorizadas
        ip saddr @knock_allowed tcp dport 22 accept

        # Contar knocks fallidos
        tcp dport {1999,2000,2001} ct state new counter

        # SSH normal
        ct state established,related accept
        iif lo accept
    }
}
```


Edita ```/etc/knockd.conf```

```
[openSSH]
sequence = 1999,2000,2001
seq_timeout = 10
command = /usr/sbin/nft add element inet filter knock_allowed { %IP% }
tcpflags = syn
```

Ahora añadimos esto tambien en nftables

```
set knock_attempts {
    type ipv4_addr
    flags dynamic
    timeout 60s
}

chain input {
    ...

    # Registrar intentos de knock
    tcp dport {1999,2000,2001} add @knock_attempts { ip saddr }

    # Si una IP aparece demasiadas veces → bloquear
    ip saddr @knock_attempts limit rate over 5/minute add @knock_blocked { ip saddr }

    ...
}
```


Ver IPs permitidas
```bash
sudo nft list set inet filter knock_allowed
```

Ver IPs bloqueadas
```bash
sudo nft list set inet filter knock_blocked
```

