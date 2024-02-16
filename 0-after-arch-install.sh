#!/bin/bash
set -e
#######################################################
# Author    : Ahmet Önder Moğol
#######################################################
sudo pacman -S --needed --noconfirm base-devel git wget curl

sh 1-yay-install*
sh 2-linux*
sh 3-package-tools*
sh 4-plasma-applications*
sh 18-development*
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
sh 19-docker*
sh 20-qemu*
sh 22-othertools*
sh 23-firmware*

sh switch_to_zsh*
sh personal-settings*

sh 21-notebook*
# sh nvidia*
# sh tuxedo*
# sh freshrss*



echo "###################  Done- REBOOT"
