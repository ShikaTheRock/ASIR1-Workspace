#!/bin/bash

lscpu | grep L1d | awk -F "(" '{print $1}'
lscpu | grep L1i | awk -F "(" '{print $1}'
lscpu | grep L2  | awk -F "(" '{print $1}'
lscpu | grep L3  | awk -F "(" '{print $1}'


