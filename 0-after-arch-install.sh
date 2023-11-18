#!/bin/bash
#set -e
#######################################################
# Author    : Ahmet Önder Moğol
#######################################################
sudo pacman -S --needed --noconfirm base-devel git wget curl

sh 1-yay-install*
sh 2-linux*
sh 3-package-tools*
sh 4-plasma-applications*
sh 5-core-software*
sh 6-browser-internettools*
sh 7-filemanagertools*
sh 8-ziptools*
sh 9-filesystemtools*
sh 10-networktools*
sh 11-bluetooth*
sh 12-cups*
sh 13-fonts*
sh 14-office-code-editors*
sh 15-remotedesktop-tools*
sh 16-video-photo-music*
sh 17-social-IM*
sh 18-development*
sh 19-docker*
sh 20-qemu*
sh 21-notebook*
sh 22-othertools*
sh 23-firmware*

# sh tuxedo*
# sh freshrss*

# sh personal-settings*
# sh nvidia*


echo "################### # user group atamaları / wheell"
# EDITOR=nano sudo -E visudo
sudo usermod -aG wheel $USER
sudo usermod -aG users,power,lp,adm,audio,video,optical,storage,network,rfkill $USER

echo "################################################################"
echo "Enable fstrim timer"

sudo systemctl enable fstrim.timer


echo "################################################################"
echo "Adding ubuntu keyserver"

if ! grep -q "hkp://keyserver.ubuntu.com:80" /etc/pacman.d/gnupg/gpg.conf; then
	echo 'keyserver hkp://keyserver.ubuntu.com:80' | sudo tee --append /etc/pacman.d/gnupg/gpg.conf
fi


echo "################################################################"
echo "Setting environment variables"
echo
if [ -f /etc/environment ]; then
	#		echo "QT_QPA_PLATFORMTHEME=qt5ct" | sudo tee /etc/environment
	#		echo "QT_STYLE_OVERRIDE=kvantum" | sudo tee -a /etc/environment
	echo "EDITOR=nano" | sudo tee -a /etc/environment
	echo "BROWSER=thorium-browser" | sudo tee -a /etc/environment
fi

####################################################################################
# Remove orphans &
yay -Rns $(pacman -Qtdq) --noconfirm
####################################################################################
echo "###################  Done- REBOOT"
