#!/bin/bash
#set -e
##################################################################################################################
# Written to be used on 64 bits computers
# Author 	: 	DarkXero
# Website 	: 	http://xerolinux.xyz
##################################################################################################################
tput setaf 3
echo "###############################################################################"
echo "#                         XeroLinux Firewall Enabler                          #"
echo "###############################################################################"
tput sgr0
echo
echo "Hello $USER, which Edition are you using ?"
echo
echo "########## Edition Selection ##########"
echo
echo "1.  XeroLinux KDE Plasma."
echo "2.  XeroLinux GNOME (GUFW)."
echo "3.  XeroLinux XFCE (FireJail)."
echo
echo "Type Your Selection. To Exit, just close Window."
echo

while :; do

read CHOICE

case $CHOICE in

    1 )
      echo
      echo "###########################################"
      echo "         Adding/Enabling Firewalld         "
      echo "###########################################"
			sleep 3
			sudo pacman -S --noconfirm plasma-firewall firewalld
			sudo systemctl enable --now firewalld
			sleep 3
      echo "###########################################"
      echo "   Done ! Check Status from KDE Settings   "
      echo "###########################################"
      sleep 6
      ;;

    2 )
      echo
      echo "############################################"
      echo "       Installing Firewall for Gnome        "
      echo "############################################"
			sleep 3
			sudo pacman -S --noconfirm gufw ufw
			sleep 3
      echo "###############################################"
      echo "  Done ! Configure Firewall From The Gufw App  "
      echo "###############################################"
      sleep 6
      ;;

    3 )
      echo
      echo "########################################"
      echo "      Installing Firewall for XFCE      "
      echo "########################################"
			sleep 3
			sudo pacman -S --noconfirm firejail firetools
			sleep 3
      echo "###############################################"
      echo "  Done ! Configure Firewall From FireJail App  "
      echo "###############################################"
      sleep 6
      ;;

    * )
      echo "#################################"
      echo "    Choose the correct number    "
      echo "#################################"
      ;;
esac
done
