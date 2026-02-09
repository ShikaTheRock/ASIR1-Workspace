cat /sys/class/power_supply/BAT1/uevent

powerprofilesctl set performance

brightnessctl s 254

redshift -O 1000

sudo modprobe -r uvcvideo

echo "SUBSYSTEMS=="usb", DRIVERS=="usb", ATTRS{product}=="Usb Mouse", ACTION=="add", RUN+="/usr/local/sbin/touchpadswitch.sh 1"
SUBSYSTEMS=="usb", DRIVERS=="usb", ATTRS{product}=="Usb Mouse", ACTION=="remove", RUN+="/usr/local/sbin/touchpadswitch.sh 0"" >> /etc/udev/rules.d/90-touchpad-off.rules

echo "
#!/bin/bash
 
USER=`ps -ef | grep /usr/bin/x-session-manager | grep -v grep | cut -f 1 -d " "`
 
if [ "$USER" = "" ]
then
    exit 0
fi
 
if [ $# -eq 0 ]
then
    echo "Falta parametro, 0 - Activar. 1 - Desactivar" 1>&2
    exit 1
fi
 
DISPLAY=localhost:0.0
export DISPLAY
 
su - $USER -c "/usr/bin/synclient TouchpadOff=$1"
" >> /usr/local/sbin/touchpadswitch.sh


xinput list

eecho "Tomamos nombre del raton"

xinput set-button-map logitech-g152 3 2 1

