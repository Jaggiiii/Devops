#!/usr/bin/bash

if [ -d /etc/pacman.d ]
then
    # this host is based on the arc run the pacman update.
    sudo pacman -Syu
fi

if [ -d /etc/apt ]
then 
    # this host is based on debian or ubuntu.
    # run the apt version of the command
    sudo apt update
    sudo apt dist-upgrade

fi