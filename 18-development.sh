#!/bin/bash
#set -e
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
github-cli 
github-desktop-bin
github-backup
go  
clang 
cmake
python 
python-setuptools
python-pip 
python-pipx
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



# echo "################### development tools "

#nodejs npm
#ninja pkgconf gtk3

#### development add-ons
#node-gyp perl-xml-parser

# echo "################### Java"
# yay -S --needed --noconfirm jre11-openjdk jdk11-openjdk jre11-openjdk-headless
# flutter 8 yada 10 versiyonu istiyor
#archlinux-java status
#sudo archlinux-java set java-8-openjdk


# echo "################### Android tools & Scrcpy Install "
# plugin your device with a usb cable
# keep it awake at all times so you see the message you need to noconfirm
# on your android device make sure you find the settings
# enable usb debugging on your android
# https://www.howtogeek.com/129728/how-to-access-the-developer-options-menu-and-enable-usb-debugging-on-android-4.2/
# then start scrcpy in a terminal and confirm any and all messages on your android device
# https://wiki.archlinux.org/index.php/Android_Debug_Bridge
# https://github.com/Genymobile/scrcpy
# yay -S --needed --noconfirm android-tools
# yay -S --needed --noconfirm scrcpy
#next one does not seem necessary
#yay -S --needed --noconfirm android-udev