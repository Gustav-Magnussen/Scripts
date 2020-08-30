#!/bin/bash

IP=$(ip address | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | sed -n '2 p')
SUB=$(echo $IP | rev | cut -d. -f2- | rev)

MASK=$(ip -o -f inet addr show | awk '/scope global/ {print $4}' | cut -d/ -f2)

if [[ $MASK == "24" ]]; then
    for numb in {1..254}; do :
        echo $(ping -c 1 $SUB.$numb) 
    done
    
elif [[ $MASK == "16" ]]; then
    SUB2=$(echo $SUB | rev | cut -d. -f2- | rev)
    for numb1 in {1..254}; do
        for numb2 in {1..254}; do 
        echo $(ping -c 1 $SUB2.$numb1.$numb2) 
        done
        
    done
fi
