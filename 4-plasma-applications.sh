#!/bin/bash
#set -e
#######################################################
# Author    : Ahmet Önder Moğol
#######################################################
echo
tput setaf 3
echo "################################################################"
echo "###################  KDE-Applications install "
echo "################################################################"
tput sgr0
echo

list=(
plasma-desktop
plasma-nm 
plasma-pa
sddm-git
sddm-kcm
konsole
kate
kdeplasma-addons
kde-gtk-config 
breeze-gtk 
powerdevil
kdialog
kcalc
kcharselect
kcolorchooser
kdeconnect
kdegraphics-thumbnailers
kdesdk-thumbnailers
kdenetwork-filesharing 
kcron
filelight 
kdf 
ocs-url
konsave
kontrast
kolourpaint
systemd-kcm
systemd-manager-git
xorg-xwayland 
xorg-xlsclients 
qt5-wayland 
glfw-wayland 
plasma-wayland-session
xorg-xhost 
xdg-desktop-portal 
xdg-desktop-portal-kde
discover
print-manager
packagekit-qt5 
ffmpegthumbs
ark
dolphin 
dolphin-plugins 
#kmix
)

#echo "################### XORG applications "
# xorg-server xorg-xinit xorg-xrandr xorg-xfontsel xorg-xlsfonts xorg-xkill xorg-xinput xorg-xwininfo


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



#if [ ! -f /usr/share/xsessions/plasma.desktop ]; then
  #sudo pacman -S --noconfirm --needed qt5ct
#fi

sudo systemctl enable NetworkManager
sudo systemctl enable sddm


echo "################### Plasma related applications installed "