#!/bin/bash
#set -e
#######################################################
# Author    : Ahmet Önder Moğol
#######################################################
echo
tput setaf 3
echo "################################################################"
echo "################### video & Photo & Music install "
echo "################################################################"
tput sgr0
echo

list=(
gwenview
obs-studio 
kdenlive
spotify
vlc
aribb24 
spectacle
simplescreenrecorder
svgpart
)
# ip tv apps
	# qmplay2
#  Codecler
	# a52dec faac faad2 flac jasper lame
	# libdca libdv libmad libmpeg2 libtheora
	# libvorbis libxv wavpack x264 xvidcore

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



