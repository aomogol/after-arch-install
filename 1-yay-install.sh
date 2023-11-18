#!/bin/bash
#set -e
#######################################################
# Author    : Ahmet Önder Moğol
#######################################################
echo
tput setaf 3
echo "################################################################"
echo "################### yay install & pacman configure" 
echo "################################################################"
tput sgr0
echo

echo
list=(
yay-bin
)

func_install() {
    if pacman -Qi $1 &> /dev/null; then
        tput setaf 2
        echo "################## The package "$1" is already installed"
        echo
        tput sgr0
    else
        tput setaf 3
        echo "##################  Installing package "  $1
        tput sgr0
		git clone https://aur.archlinux.org/yay-bin.git
		cd yay-bin
		makepkg -si
		cd ..
		rm -r yay-bin
    fi
}
count=0

for name in "${list[@]}" ; do
    count=$[count+1]
    tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
    func_install $name
done

echo "########## /etc/pacman.conf düzenleme color ve paralel download"
# sudo nano /etc/pacman.conf
echo "Pacman parallel downloads set to 20"
	FIND="#ParallelDownloads = 5"
	REPLACE="ParallelDownloads = 20"
	sudo sed -i "s/$FIND/$REPLACE/g" /etc/pacman.conf

echo "Color"
	FIND="#Color"
	REPLACE="Color"
	sudo sed -i "s/$FIND/$REPLACE/g" /etc/pacman.conf


echo
	yay -Syyu --noconfirm # Update Arch
tput setaf 6
echo "################### "$1" Install - Done #############################"
tput sgr0
echo