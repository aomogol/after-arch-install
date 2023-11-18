#!/bin/bash
#set -e
##################################################################################################################
# Written to be used on 64 bits computers
# Author 	: 	DarkXero
# Website 	: 	http://xerolinux.xyz
##################################################################################################################
tput setaf 3
echo "#################################################"
echo "#             XeroLinux Fixes/Tweaks            #"
echo "#################################################"
tput sgr0
echo
echo "Hello $USER, what would you like to do today ?"
echo
echo "################## Troubleshooting ##################"
echo
echo "1. Apply The Samba Share Fix."
echo "2. Clear Pacman Cache (Free Space)."
echo "3. Restart PipeWire/PipeWire-Pulse."
echo "4. Unlock Pacman DB (In case of error)."
echo "5. Enable The PipeWire Echo-Cancel Module."
echo "6. TKG Kernel/nVidia Scripts (Advanced use only)."
echo
echo "Type Your Selection. To Exit, just close Window."
echo

while :; do

read CHOICE

case $CHOICE in

    1 )
      echo
      sleep 2
      sh /usr/local/bin/smbfix
      sleep 2
      clear && sh /usr/share/xerowelcome/scripts/xerofix.sh

      ;;

    2 )
      echo
	  sleep 2
      sudo pacman -Scc
      sleep 2
      echo
      clear && sh /usr/share/xerowelcome/scripts/xerofix.sh

      ;;


    3 )
      echo
	  sleep 2
	  sh /usr/local/bin/rpipe
	  sleep 2
      clear && sh /usr/share/xerowelcome/scripts/xerofix.sh

      ;;

    4 )
      echo
	  sleep 2
	  sudo rm /var/lib/pacman/db.lck
	  sleep 2
      clear && sh /usr/share/xerowelcome/scripts/xerofix.sh

      ;;

    5 )
      echo
	  sleep 2
	  sh /usr/local/bin/pipecho
	  sleep 2
      clear && sh /usr/share/xerowelcome/scripts/xerofix.sh

      ;;

    6 )
      echo
	  sleep 2
	  sh /usr/local/bin/tkg
      echo
	  sleep 3
      clear && sh /usr/share/xerowelcome/scripts/xerofix.sh

      ;;
 
    * )
      echo "#################################"
      echo "    Choose the correct number    "
      echo "#################################"
      ;;
esac
done
