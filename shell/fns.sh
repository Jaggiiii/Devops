#!/usr/bin/bash

condition_block(){
   if [ $? -ne 0 ]
    then
        echo "there was errro while updating"
    fi
}


release_file=/etc/os-release
logfile=/var/log/updater.log
errorlog=/var/log/updater_errors.log

if grep -q "Arch" $release_file
then
    # this host is based on the arc run the pacman update.
    sudo pacman -Syu 1>> $logfile 2>>$errorlog
    condition_block
fi

if  grep -q "Debian" $release_file || grep -q "Ubuntu" $release_file
then 
    # this host is based on debian or ubuntu.
    # run the apt version of the command
    sudo apt-get update 1>> $logfile 2>>$errorlog
    condition_block
    sudo apt  dist-upgrade 1>> $logfile 2>>$errorlog
    condition_block
fi
