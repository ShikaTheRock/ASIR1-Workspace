#!/bin/bash

#divides the nimber into each peatrted character
letterBox=$(grep -o . <<<"$1")
one=0
zero=0
for op in $letterBox; do 

  if [ $op = "1" ]; then
    let one="$one+1"
  elif [ $op = "0" ]; then
    let zero="$zero+1"
  elif [ $op = "-" ]; then
    usseless=0
  else
    echo "Numero no valido, el formato debera de ser: XXX-XXXXXX como primer argumento y 1 o 0 como bit de paridad"
    exit 1
  fi

done

let parTest="$one%2"

if [ $parTest -eq 0 ]; then
  if [ $2 = $parTest ]; then
    pepino=$(sed 's/-/0/' <<< $1)
    echo $((2#$pepino)) | bc
  else
    pepino=$(sed 's/-/1/' <<< $1)
    echo $((2#$pepino)) | bc
  fi
else
  if [ $2 = $parTest ]; then
    pepino=$(sed 's/-/0/' <<< $1)
    echo $((2#$pepino)) | bc
  else
    pepino=$(sed 's/-/1/' <<< $1)
    echo $((2#$pepino)) | bc
  fi 
fi


