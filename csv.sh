#!/bin/bash

#Pick csv

#Create users

if [ $# -eq 1 ]; then
    if [ -f $1 ]; then
        for op in $(cat $1 | cut -d ':' -f1); do
            echo $op
        done
    fi
else
    echo pataat
    exit 
fi