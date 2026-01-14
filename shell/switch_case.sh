#!/usr/bin/bash

finish=0
while [ $finish -ne 1 ] 
do

        echo "what is your favourite distribution ?"

        echo  "1-Arch"
        echo  "2-centoS"
        echo  "3-Debian"
        echo  "4-Ubuntu"
        echo  "5-Mint"
        echo  "6-Something else  "
        echo  "7-Exit the scripting "

        read distro;

        case $distro in
            1) echo "Arch is a rolling release" ;;
            2) echo "CentoS is popular on servers";;
            3) echo "Debian is a Commuint Distribution";;
            4) echo "Ubuntu is popular on both servers and computers.";;
            5) echo "Mint is popular on desktops and laptops";;
            6) echo "you didn't enter a appropriate prompt " ;;
            7) finish=1
        esac
done

echo "exited the script"



