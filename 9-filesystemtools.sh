#!/bin/bash
set -e
#######################################################
# Author    : Ahmet Önder Moğol
#######################################################
echo
tput setaf 3
echo "################################################################"
echo "################### File System Tools install "
echo "################################################################"
tput sgr0
echo

list=(
ntfs-3g 
xfsprogs 
jfsutils 
reiserfsprogs
dosfstools 
fatresize 
f2fs-tools 
btrfs-progs
exfatprogs 
nilfs-utils 
udftools 
mtools
#ventoy-bin
nfs-utils
cifs-utils
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
		sudo pacman -S --noconfirm --needed $1
		#yay -S --needed --noconfirm $1
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



#echo "################### file system tools "
#yay -S --needed --noconfirm ntfs-3g xfsprogs jfsutils reiserfsprogs
#yay -S --needed --noconfirm dosfstools fatresize f2fs-tools btrfs-progs
#yay -S --needed --noconfirm exfat-utils nilfs-utils udftools mtools
#yay -S --needed --noconfirm ventoy-bin
#yay -S --needed --noconfirm xorg-xhost # xorg-xhost: authorization from wayland
#yay -S --needed --noconfirm btrfsmaintenance
#yay -S --needed --noconfirm snapper-support btrfs-assistant
#yay -S --needed --noconfirm nfs-utils
#yay -S --needed --noconfirm btrfsmaintenance


echo "################################################################"
echo "################### Btrfs"
echo "################################################################"
if 	lsblk -f | grep btrfs > /dev/null 2>&1 ; then
	echo "################################################################"
	echo "################### Snapper to be installed"
	echo "################################################################"
	echo "You are using BTRFS. Installing the software ..."
	echo
	yay -S --needed --noconfirm snapper
	yay -S --needed --noconfirm grub-btrfs
	yay -S --needed --noconfirm btrfs-assistant
	yay -S --needed --noconfirm snap-pac
	yay -S --needed --noconfirm snapper-support
	#yay -S --needed --noconfirm btrfsmaintenance

	echo "################################################################"
	echo "################### Snapper installed"
	echo "################################################################"
else
	echo "################################################################"
	echo "### Your harddisk/ssd/nvme is not formatted as BTRFS."
	echo "### Packages will not be installed."
	echo "################################################################"
fi
