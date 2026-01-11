# Conocer el driver del módulo
sudo lspci -v | grep -A 20 Network

Si no funciona con el driver que figura en el comando, usad el driver nl80211,
el cual funciona en la mayoria de las interfaces Wi-Fi

# Configuracion del bridge
sudo brctl addbr br2
sudo brctl addif br2 wlo1
sudo ip addr add 192.168.35.1/24 dev br2
sudo ip link set br2 up

# Iniciar hostapd
/etc/init.d/hostapd start

O

sudo systemctl enable hostapd.service
sudo systemctl start hostapd.service

Si no inicia, probad con este:
sudo hostapd -dd -t -f /var/log/wifiverde.log /etc/hostapd/hostapd.conf

# Reiniciar el servicio de hostapd
/etc/init.d/
sudo systemctl restart hostapd.service

# Detener el servicio de hostapd
sudo systemctl stop hostapd.service

# Si da algun error con el codigo del pais, usad el comando
# sudo /usr/bin/iw reg set ES

# Creacion del servidor DHCP

Para crear el servidor DHCP, necesitamos instalar herramientas como dnsmasq

sudo apt install dnsmasq

Luego configuramos el fichero de configuracion como en la imagen

# Iniciar DNSMASQ

sudo systemctl start dnsmasq.service

# Reiniciar DNSMASQ

sudo systemctl restart dnsmasq.service

# Parar DNSMASQ

sudo systemctl stop dnsmasq.service

# NAT

Para que pueda salir a internet, usamos los siguientes comandos:

sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -o eno2 -j MASQUERADE
sudo iptables -A FORWARD -i br2 -o eno2 -j ACCEPT
sudo iptables -A FORWARD -i eno2 -o br2 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables-save

Si queremos que los cambios sean persistentes, debemos instalar:

sudo apt install iptables-persistent

Y realizar el comando a continuación:

sudo iptables-save | sudo tee /etc/iptables/rules.ipv4




