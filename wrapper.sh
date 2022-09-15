#!/bin/bash
# Wrapper for create bash-script of Debian
#Manuals:
#1) If need to install depencies:
#  sudo apt-get install -y jq
#2) Change and Move this file to /usr/local/bin
#3) Give permission to run:
#   chmod +x your_script_name


function get_data(){

    echo "first-$1-last";
}


if [ ! -t 0 ] && [ -p /dev/stdin ]; then

    for elem in $(cat /dev/stdin)
    do
        result=$(get_data "$elem");
        echo $result;
    done

else

    count=1
    while [ -n "$1" ]
    do
        elem=$1
        if [ "$elem" == "" ];
        then
            echo 'error: empty elem';
        else
            result=$(get_data "$1");
            echo $result;
        fi
    shift
    done

fi
