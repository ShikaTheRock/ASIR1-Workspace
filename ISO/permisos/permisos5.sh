#!/bin/bash

if [ $(hostgame) = Empleado ];  then
    umask 022
elif [ $(hostgame) = ServidorWeb ];  then
    umask 007
elif [ $(hostgame) = BaseDatos ];  then
    umask 644
fi

exit 0