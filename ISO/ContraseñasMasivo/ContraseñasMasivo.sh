#!/bin/bash

is_equal(){
    echo ${equal[@]} | grep -q $1
    if [ $? -eq 0 ]; then
        echo "" > /dev/null
    else
        equal=("${equal[@]}" $1)
    fi 
}

echo "Razas: "

for op in $(cat rivendel.csv); do
    razas=$(echo $op | awk -F ',' {'print $2'} )
    if [ "$razas" = "Raza" ]; then
        echo "" > /dev/null
    elif ! [ -z $razas ]; then
        is_equal $razas
    fi 
done

for op in "${equal[@]}"; do
    echo "$op"
done
