#!/bin/bash
set -e
#######################################################
# Author    : Ahmet Önder Moğol
#######################################################
echo
tput setaf 3
echo "################################################################"
echo "###################  install "
echo "################################################################"
tput sgr0
echo

list=(
kdeconnect
gvfs
gvfs-smb
samba
avahi
traceroute
warpinator
nss-mdns
networkmanager-openvpn  
bind 
dnsdiag
netplan
localsend-bin
)
#ipscan-bin

func_install() {
	if pacman -Qi $1 &> /dev/null; then
		tput setaf 2
  		echo "###############################################################################"
  		echo "################## The package "$1" is already installed"
      	echo "###############################################################################"
      	echo
		tput sgr0
	else
    	tput setaf 3
    	echo "###############################################################################"
    	echo "##################  Installing package "  $1
    	echo "###############################################################################"
    	echo
    	tput sgr0
		#sudo pacman -S --noconfirm --needed $1
		yay -S --needed --noconfirm $1
    fi
}

###############################################################################
echo "Installation "
###############################################################################
count=0

for name in "${list[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	func_install $name
done

### AVAHI service enable
sudo systemctl enable avahi-daemon.service
