#!/bin/bash


function priorities(){
    while true
    do 
        # Renice for pystemon
        for pid in $(ps -def | grep pyst | grep -v grep | awk '{print $2}')
        do 
            renice -n 20 $pid 2>&1 > /dev/null 
        done; 

        for pid in $(ps -def | grep curl | grep -v grep |  awk '{print $2}')
        do 
            renice -n 20 $pid 2>&1 > /dev/null
        done; 

        # Kill if it's running for more than an hour (CPU TIME)
        for pid in $(ps -def | grep curl | grep -v '00:00' | grep -v grep | awk '{print $2}')
        do
            kill $pid 2>&1 > /dev/null
            echo $(date) " - Killed curl"
        done;

        sleep 10; 
    done;
}

priorities&

while true
do
    python pystemon.py
    echo '[-] Pystemon died'
    sleep 5
done

