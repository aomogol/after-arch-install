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
dolphin 
dolphin-plugins 
ffmpegthumbs
ncdu
rsync 
rclone 
fuse3  
the_silver_searcher
hardcode-fixer-git  
bleachbit
fd
ripgrep
tldr
trash-cli 
procs
inxi
bat 
#czkawka-gui-bin
eza
the_platinum_searcher-bin
duf
syncthing
)
#the_platinum_searcher-bin
# egrep fgrep

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


# CD / DVD burn 
# yay -S --needed k3b cdrtools dvd+rw-tools vcdimager emovix cdrdao cdparanoia

if [ ! -f /usr/bin/duf ]; then
  yay -S --needed --noconfirm duf
fi

# Syncthing service
sudo systemctl enable --now syncthing@aom.service
