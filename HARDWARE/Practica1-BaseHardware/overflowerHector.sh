#!/bin/bash

base=$(uname -m | awk -F "_" '{print $2}')
value=$(echo 2^$base | bc)
value=$(echo $value^$value | bc)
echo $value

