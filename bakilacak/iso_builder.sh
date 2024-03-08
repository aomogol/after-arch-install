#!/bin/bash
#set -e
##################################################################################################################
# Written to be used on 64 bits computers
# Author 	: 	DarkXero
# Website 	: 	http://xerolinux.xyz
##################################################################################################################
tput setaf 3
echo "###############################################################################"
echo "#                            XeroLinux ISO Builder                            #"
echo "###############################################################################"
tput sgr0
echo
echo "Hello $USER, which ISO would you like to build today ?"
echo
#echo "Please close this window, thanks..."
echo "########## Edition Selection ##########"
echo
echo "1.  XeroLinux KDE Plasma."
echo "2.  XeroLinux GNOME Spin."
echo "3.  XeroLinux XFCE  Spin."
echo
echo "Type Your Selection. To Exit, just close Window."
echo

while :; do

read CHOICE

case $CHOICE in

    1 )
      echo
#      echo "Option currently unavailable. Will be back once optimized for Gnome 45..."
     echo "###########################################"
     echo "      Building XeroLinux KDE Flagship      "
     echo "###########################################"
     echo
     sleep 3
     cd ~ && git clone https://github.com/xerolinux/xero_iso.git
     sleep 3
     echo
     cd ~/xero_iso/ && ./build.sh
     sleep 3
     echo
     cd ~ && rm -rf ~/xero_iso/
     echo "###########################################"
     echo "      Done ! Check Home Folder for ISO     "
     echo "###########################################"
     sleep 3
     clear && sh /usr/share/xerowelcome/scripts/iso_builder.sh

      ;;

    2 )
      echo
#      echo "Option currently unavailable. Will be back once optimized for Gnome 45..."
     echo "###########################################"
     echo "       Building XeroLinux Gnome Spin       "
     echo "###########################################"
     echo
     sleep 3
     cd ~ && git clone https://github.com/xerolinux/xero_g_iso.git
     sleep 3
     echo
     cd ~/xero_g_iso/ && ./build.sh
     sleep 3
     echo
     cd ~ && rm -rf ~/xero_g_iso/
     echo "###########################################"
     echo "      Done ! Check Home Folder for ISO     "
     echo "###########################################"
     sleep 3
     clear && sh /usr/share/xerowelcome/scripts/iso_builder.sh

      ;;

    3 )
            echo
#      echo "Option currently unavailable. Will be back once optimized for Gnome 45..."
     echo "###########################################"
     echo "        Building XeroLinux XFCE Spin       "
     echo "###########################################"
     echo
     sleep 3
     cd ~ && git clone https://github.com/xerolinux/xero_xfce_iso.git
     sleep 3
     echo
     cd ~/xero_xfce_iso/ && ./build.sh
     sleep 3
     echo
     cd ~ && rm -rf ~/xero_xfce_iso/
     echo "###########################################"
     echo "      Done ! Check Home Folder for ISO     "
     echo "###########################################"
     sleep 3
     clear && sh /usr/share/xerowelcome/scripts/iso_builder.sh

      ;;

    * )
      echo "#################################"
      echo "    Choose the correct number    "
      echo "#################################"
      ;;
esac
done
