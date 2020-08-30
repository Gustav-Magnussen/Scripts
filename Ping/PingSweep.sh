#!/bin/bash

IP=$(ip address | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | sed -n '2 p')
SUB=$(echo $IP | rev | cut -d. -f2- | rev)

for numb in {1..254}; do :
    echo $(ping -c $SUB.$numb) 
done
