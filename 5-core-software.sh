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
bash-completion
partitionmanager
gparted 
gpart 
polkit
os-prober #detect other OSes
grub-customizer
update-grub
etcher-bin 
gnome-firmware
gnome-disk-utility
plasma-disks
timeshift
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
echo "Installation Complete"
###############################################################################
count=0

for name in "${list[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	func_install $name
done




#echo "################### bash utilities"
# yay -S --needed --noconfirm bash-completion
# yay -S --needed --noconfirm zsh
# yay -S --needed --noconfirm oh-my-zsh-git
# yay -S --needed --noconfirm zsh-completions
# yay -S --needed --noconfirm zsh-syntax-highlighting
# yay -S --needed --noconfirm zsh-autosuggestions

#echo "################### disk utility"
#yay -S --needed --noconfirm partitionmanager 
#yay -S --needed --noconfirm gparted gpart polkit
##yay -S --needed --noconfirm os-prober #detect other OSes
#yay -S --needed --noconfirm grub-customizer
#yay -S --needed --noconfirm update-grub
#yay -S --needed --noconfirm etcher-bin 
#yay -S --needed --noconfirm gnome-firmware
#yay -S --needed --noconfirm gnome-disk-utility
#yay -S --needed --noconfirm plasma-disks

#echo "################### Backup utility"
#yay -S --needed --noconfirm timeshift-bin

#yay -S --needed --noconfirm borg borgmatic vorta