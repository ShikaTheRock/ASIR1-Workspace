#!/bin/bash


while read line; do
	echo $line | grep VLC$
done < exportComplete.csv
