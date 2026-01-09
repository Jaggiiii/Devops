#!/usr/bin/bash

# 1. Standard Output (stdout)
# Definition:
# stdout is the output stream where a program prints normal results.
# Stream number: "1"
# Default destination: Terminal screen
# Can be redirected to a file

# 2. Standard Error (stderr)
# Definition:
# stderr is the error stream used to print error messages.
# Stream number: "2"
# Default destination: Terminal screen
# Separate from stdout (very important!)

# 3. Standard Input (stdin)
# Definition:
# stdin is the input stream from which a program reads data.
# Stream number: "0"
# Default source: Keyboard
# Can also come from a file or another command


release_file = /etc/os-release
logfile=/var/log/updater.log
errorlog=/var/log/updater_errors.log

if grep -q "Arch" $release_file
then
    # this host is based on the arc run the pacman update.
    sudo pacman -Syu 1>> $logfile 2>>$errorlog
fi

if  grep -q "Debian" $release_file || grep -q "Ubuntu" $release_file
then 
    # this host is based on debian or ubuntu.
    # run the apt version of the command
    sudo apt update 1>> $logfile 2>>$errorlog
    if [ $? -ne 0 ]
    then
        echo "there was errro while updating"
        exit
    fi
    sudo apt -y dist-upgrade 1>> $logfile 2>>$errorlog