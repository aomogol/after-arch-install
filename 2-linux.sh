#!/bin/bash
#set -e
#######################################################
# Author    : Ahmet Önder Moğol
#######################################################
echo
tput setaf 3
echo "################################################################"
echo "################### Linux package install "
echo "################################################################"
tput sgr0
echo


list=(
linux-headers
dkms
devtools
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

#
# determine processor type and install microcode
# 
proc_type=$(lscpu | awk '/Vendor ID:/ {print $3}')
case "$proc_type" in
	GenuineIntel)
		echo "Installing Intel microcode"
		yay -S --needed --noconfirm intel-ucode
		proc_ucode=intel-ucode.img
		;;
	AuthenticAMD)
		echo "Installing AMD microcode"
		yay -S --needed --noconfirm amd-ucode
		proc_ucode=amd-ucode.img
		;;
esac	