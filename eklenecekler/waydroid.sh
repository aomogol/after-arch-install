#!/bin/bash
set -e
#######################################################
# Author    : Ahmet Önder Moğol
#######################################################

## 
## https://forum.garudalinux.org/t/ultimate-guide-to-install-waydroid-in-any-arch-based-distro-especially-garuda/15902


echo
tput setaf 3
echo "################################################################"
echo "###################  install "
echo "################################################################"
tput sgr0
echo

list=(
linux-headers
binder_linux-dkms
waydroid
waydroid-image-gapps

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
		yay -S --needed --noconfirm $1
    fi
}

###############################################################################
echo "Installation Complete "
###############################################################################
count=0

for name in "${list[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	func_install $name
done



sudo modprobe -a binder_linux
sudo systemctl enable --now waydroid-container
sudo waydroid init -s GAPPS -f
# sudo waydroid init -s GAPPS


## Uygulama kurmak için
## waydroid app install $path_to_apk

## Bak incele
## https://github.com/casualsnek/waydroid_script

# sudo pacman -S waydroid-script-git


## To upgrade Waydroid images, run:
## sudo waydroid upgrade

