#!/bin/bash
set -e
#######################################################
# Author    : Ahmet Önder Moğol
#######################################################
echo
tput setaf 3
echo "################################################################"
echo "################### bluetooth install "
echo "################################################################"
tput sgr0
echo

list=(
bluez
bluez-utils 
bluedevil
blueman
)

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

sudo systemctl enable bluetooth --now

sudo sed -i 's/'#AutoEnable=false'/'AutoEnable=true'/g' /etc/bluetooth/main.conf

if ! grep -q "load-module module-switch-on-connect" /etc/pulse/system.pa; then
    echo 'load-module module-switch-on-connect' | sudo tee --append /etc/pulse/system.pa
fi

if ! grep -q "load-module module-bluetooth-policy" /etc/pulse/system.pa; then
    echo 'load-module module-bluetooth-policy' | sudo tee --append /etc/pulse/system.pa
fi

if ! grep -q "load-module module-bluetooth-discover" /etc/pulse/system.pa; then
    echo 'load-module module-bluetooth-discover' | sudo tee --append /etc/pulse/system.pa
fi
echo "################################################################"