#!/bin/bash

cd /pystemon
pyton pystemon.py&

while true
do 
        for pid in $(ps -def | grep pyst | awk '{print $2}')
        do 
                renice -n 20 $pid 2>&1 > /dev/null 
        done; 

        # Kill if it's running for more than an hour (CPU TIME)
        for pid in $(ps -def | grep pyst | grep -v '00:' | awk '{print $2}')
        do
                kill $pid 2>&1 > /dev/null
                echo $(date) " - killed pystemon"
        done;

        for pid in $(ps -def | grep curl | awk '{print $2}')
        do 
                renice -n 20 $pid 2>&1 > /dev/null
        done; 

        # Kill if it's running for more than an hour (CPU TIME)
        for pid in $(ps -def | grep curl | grep -v '00:00' | awk '{print $2}')
        do
                kill $pid 2>&1 > /dev/null
                echo $(date) " - Killed curl"
        done;

        sleep 10; 
done;
