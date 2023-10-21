#!/bin/bash
#set -e
#######################################################
# Author    : Ahmet Önder Moğol
#######################################################

sudo pacman -S --needed --noconfirm base-devel git wget curl

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
echo
	yay -Syyu --noconfirm # Update Arch
tput setaf 6
echo "################### Yay-bin Install - Done"
tput sgr0
echo

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

echo "################### Linux "
yay -S --needed --noconfirm linux-headers 
yay -S --needed --noconfirm dkms

echo "################### package tools  "
yay -S --needed --noconfirm paru-bin
yay -S --needed --noconfirm pkgcacheclean
yay -S --needed --noconfirm pacman-contrib
yay -S --needed --noconfirm reflector

echo "################### Mirror List yenileme"
sudo reflector --latest 10  --fastest 10 --sort rate --protocol http,https --save /etc/pacman.d/mirrorlist

echo "################### # user group atamaları / wheell"
# EDITOR=nano sudo -E visudo
sudo usermod -aG wheel $USER
sudo usermod -aG users,power,lp,adm,audio,video,optical,storage,network,rfkill $USER

#echo "################### ilave disk ler için mount point"
# sudo mkdir /mnt/
# sudo mkdir /mnt/

echo "################### KDE applications "
yay -S --needed --noconfirm kdialog
yay -S --needed --noconfirm kdegraphics-thumbnailers # Thumbnailers for various graphics file formats
yay -S --needed --noconfirm kdenetwork-filesharing  #Properties dialog plugin to share a directory with the local network
yay -S --needed --noconfirm kcron #  Configure and schedule tasks
yay -S --needed --noconfirm filelight kdf # View disk usage information
yay -S --needed --noconfirm ocs-url # kde store
yay -S --needed --noconfirm konsave

#echo "################### XORG applications "
# yay -S --needed --noconfirm xorg-server xorg-xinit xorg-xrandr xorg-xfontsel xorg-xlsfonts xorg-xkill xorg-xinput xorg-xwininfo

echo "################### bash utilities"
yay -S --needed --noconfirm bash-completion
yay -S --needed --noconfirm zsh
yay -S --needed --noconfirm oh-my-zsh-git
yay -S --needed --noconfirm zsh-completions
yay -S --needed --noconfirm zsh-syntax-highlighting
yay -S --needed --noconfirm zsh-autosuggestions

echo "################### disk utility"
yay -S --needed --noconfirm partitionmanager 
yay -S --needed --noconfirm gparted
yay -S --needed --noconfirm os-prober #detect other OSes
yay -S --needed --noconfirm grub-customizer
yay -S --needed --noconfirm update-grub
yay -S --needed --noconfirm etcher-bin 
yay -S --needed --noconfirm gnome-firmware

echo "################### Backup utility"
yay -S --needed --noconfirm timeshift-bin

echo "################### file system tools "
yay -S --needed --noconfirm ntfs-3g xfsprogs jfsutils reiserfsprogs
yay -S --needed --noconfirm dosfstools fatresize f2fs-tools
yay -S --needed --noconfirm exfat-utils nilfs-utils udftools mtools

echo "################### yardımcı programlar "
yay -S --needed --noconfirm neofetch 
yay -S --needed --noconfirm archiso
yay -S --needed --noconfirm downgrade
yay -S --needed --noconfirm caffeine-ng

echo "################### fonts"
yay -S --needed --noconfirm ttf-meslo-nerd-font-powerlevel10k
yay -S --needed --noconfirm powerline-fonts
yay -S --needed --noconfirm ttf-ms-fonts
yay -S --needed --noconfirm awesome-terminal-fonts
yay -S --needed --noconfirm ttf-ubuntu-font-family
yay -S --needed --noconfirm ttf-hack
yay -S --needed --noconfirm ttf-roboto
yay -S --needed --noconfirm adobe-source-sans-fonts
#yay -S --needed --noconfirm ttf-fantasque-sans-mono 
#yay -S --needed --noconfirm ttf-iosevka-nerd 
#yay -S --needed --noconfirm ttf-material-design-iconic-font 
#yay -S --needed --noconfirm ttf-sourcecodepro-nerd 
#yay -S --needed --noconfirm ttf-hack ttf-roboto   
#yay -S --needed --noconfirm ttf-bitstream-vera 
#yay -S --needed --noconfirm ttf-dejavu 
#yay -S --needed --noconfirm ttf-droid 
#yay -S --needed --noconfirm ttf-inconsolata 
#yay -S --needed --noconfirm ttf-liberation 
#yay -S --needed --noconfirm ttf-roboto-mono 
#yay -S --needed --noconfirm noto-fonts 

echo "################### network tools"
yay -S --needed --noconfirm kdeconnect
yay -S --needed --noconfirm gvfs
yay -S --needed --noconfirm gvfs-smb
yay -S --needed --noconfirm samba
yay -S --needed --noconfirm avahi
yay -S --needed --noconfirm traceroute
yay -S --needed --noconfirm warpinator
yay -S --needed --noconfirm nss-mdns
yay -S --needed --noconfirm networkmanager-openvpn  


sudo systemctl enable avahi-daemon.service

echo "################### file manager- file finder"
yay -S --needed --noconfirm dolphin dolphin-plugins ffmpegthumbs
yay -S --needed --noconfirm ncdu
yay -S --needed --noconfirm rsync
yay -S --needed --noconfirm the_platinum_searcher-bin
yay -S --needed --noconfirm the_silver_searcher
yay -S --needed --noconfirm hardcode-fixer-git  # Fixes Hardcoded Icons
yay -S --needed --noconfirm bleachbit
yay -S --needed --noconfirm fd ripgrep
yay -S --needed --noconfirm tldr 
yay -S --needed --noconfirm procs # replacement for ps 
yay -S --needed --noconfirm inxi
### czkawka duplicate finder
yay -S --needed --noconfirm czkawka-gui-bin
yay -S --needed --noconfirm autojump  # A faster way to navigate your filesystem from the command line
#>>>  Bash users will need to add the following to ~/.bashrc:
#     [[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
#
#     Fish users will need to add the following to ~/.config/fish/config.fish:
#     [ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish
#############################

if [ ! -f /usr/bin/duf ]; then
  yay -S --needed --noconfirm duf
fi

echo "################### # sıkıştırma ile ilgili toollar"
yay -S --needed --noconfirm p7zip zip unrar unzip
yay -S --needed --noconfirm file-roller
yay -S --needed --noconfirm unarchiver
yay -S --needed --noconfirm unace sharutils uudeview arj cabextract ark
yay -S --needed --noconfirm peazip quad arc zpaq upx paq8o
yay -S --needed --noconfirm gzip lrzip lzop

echo "################### cups"
yay -S --needed --noconfirm cups cups-pdf ghostscript gsfonts gutenprint
yay -S --needed --noconfirm gtk3-print-backends libcups system-config-printer
yay -S --needed --noconfirm sane simple-scan
yay -S --needed --noconfirm hplip
sudo systemctl enable --now cups.service

echo "################### #bluetooth enable"
yay -S --needed --noconfirm bluez
yay -S --needed --noconfirm bluez-utils 
yay -S --needed --noconfirm bluedevil # KDE's Bluetooth tool.
yay -S --needed --noconfirm blueman #  A full featured Bluetooth manager.
sudo systemctl enable bluetooth --now

echo "################### WEB browser, ftp, ssh"
yay -S --needed --noconfirm chromium
yay -S --needed --noconfirm firefox
yay -S --needed --noconfirm google-chrome
yay -S --needed --noconfirm brave-bin
yay -S --needed --noconfirm thorium-browser-bin
#yay -S --needed --noconfirm tor torbrowser-launcher
#yay -S --needed --noconfirm opera
#yay -S --needed --noconfirm vivaldi vivaldi-ffmpeg-codecs vivaldi-widevine
yay -S --needed --noconfirm filezilla ## FTP
yay -S --needed --noconfirm qbittorrent ## Torrent
yay -S --needed --noconfirm putty ## SSH tool
yay -S --needed --noconfirm sshfs #Filesystem client based on SSH.

echo "################### Office - Code editor - Editorvs."
yay -S --needed --noconfirm okular
yay -S --needed --noconfirm sublime-text-4
yay -S --needed --noconfirm visual-studio-code-bin
yay -S --needed --noconfirm meld 
yay -S --needed --noconfirm gedit
yay -S --needed --noconfirm thunderbird ## e-Mail
####  Office
yay -S --needed --noconfirm libreoffice aspell-en libmythes mythes-en languagetool
yay -S --needed --noconfirm onlyoffice

echo "###################  Remote desktop tools"
yay -S --needed --noconfirm remmina remmina-plugin-rdesktop
yay -S --needed --noconfirm freerdp
yay -S --needed --noconfirm spice-gtk libvncserver

echo "################## video & Photo & Music"
yay -S --needed --noconfirm gwenview # image viewer
yay -S --needed --noconfirm obs-studio 
yay -S --needed --noconfirm kdenlive
## Muzik
yay -S --needed --noconfirm spotify
### Video player
yay -S --needed --noconfirm vlc
##  codecler
yay -S --needed --noconfirm a52dec faac faad2 flac jasper lame
yay -S --needed --noconfirm libdca libdv libmad libmpeg2 libtheora
yay -S --needed --noconfirm libvorbis libxv wavpack x264 xvidcore
## ip tv için
yay -S --needed --noconfirm aribb24 #qmplay2
#### screeen shot
yay -S --needed --noconfirm spectacle
## Ekran kaydetmek için
yay -S --needed --noconfirm simplescreenrecorder
yay -S --needed --noconfirm svgpart #A KPart for viewing SVGs

echo "################### ## Video Konferans & IM "
yay -S --needed --noconfirm zoom
## IM
yay -S --needed --noconfirm discord
yay -S --needed --noconfirm telegram-desktop

echo "################### development tools "
yay -S --needed --noconfirm github-cli 
yay -S --needed --noconfirm github-desktop-bin
yay -S --needed --noconfirm go  
yay -S --needed --noconfirm clang cmake
# python 
yay -S --needed --noconfirm python python-setuptools
yay -S --needed --noconfirm python-pip python-pipx

#yay -S --needed --noconfirm nodejs npm
#yay -S --needed --noconfirm ninja pkgconf gtk3

#### development add-ons
#yay -S --needed --noconfirm node-gyp perl-xml-parser

echo "################### Java"
yay -S --needed --noconfirm jre11-openjdk jdk11-openjdk jre11-openjdk-headless
# flutter 8 yada 10 versiyonu istiyor
#archlinux-java status
#sudo archlinux-java set java-8-openjdk
echo "################### Docker"
yay -S --needed --noconfirm docker
sudo groupadd docker
#newgrp docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo systemctl enable containerd.service
sudo systemctl start containerd.service
sudo chmod 666 /var/run/docker.sock

echo "################### Android tools & Scrcpy Install "
# plugin your device with a usb cable
# keep it awake at all times so you see the message you need to noconfirm
# on your android device make sure you find the settings
# enable usb debugging on your android
# https://www.howtogeek.com/129728/how-to-access-the-developer-options-menu-and-enable-usb-debugging-on-android-4.2/
# then start scrcpy in a terminal and confirm any and all messages on your android device
# https://wiki.archlinux.org/index.php/Android_Debug_Bridge
# https://github.com/Genymobile/scrcpy
yay -S --needed --noconfirm android-tools
yay -S --needed --noconfirm scrcpy
#next one does not seem necessary
#yay -S --needed --noconfirm android-udev

echo "################### QEMU "
echo "################################################################"
#tutorial https://www.youtube.com/watch?v=JxSGT_3UU8w
#https://computingforgeeks.com/install-kvm-qemu-virt-manager-arch-manjar/
## Search for Kernel Module
## zgrep CONFIG_KVM /proc/config.gz
LC_ALL=C lscpu | grep Virtualization
# grep -E --color=auto 'vmx|svm|0xc0f' /proc/cpuinfo
lsmod | grep kvm
yay -Rdd iptables --noconfirm
yay -S --needed --noconfirm iptables-nft
yay -S --needed --noconfirm ebtables
yay -S --needed --noconfirm qemu-full
#yay -S --needed --noconfirm qemu-desktop
yay -S --needed --noconfirm virt-manager
yay -S --needed --noconfirm virt-viewer
yay -S --needed --noconfirm dnsmasq
yay -S --needed --noconfirm vde2
yay -S --needed --noconfirm bridge-utils #ovmf
yay -S --needed --noconfirm edk2-ovmf
#yay -S --needed --noconfirm spice-vdagent
#yay -S --needed --noconfirm xf86-video-qxl
yay -S --needed --noconfirm dmidecode

echo -e "options kvm-intel nested=1" | sudo tee -a /etc/modprobe.d/kvm-intel.conf
sudo gpasswd -a $USER libvirt
sudo gpasswd -a $USER kvm
#starting service
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service

echo 'nvram = ["/usr/share/ovmf/x64/OVMF_CODE.fd:/usr/share/ovmf/x64/OVMF_VARS.fd"]' | sudo tee --append /etc/libvirt/qemu.conf

sudo virsh net-define /etc/libvirt/qemu/networks/default.xml
sudo virsh net-autostart default
sudo systemctl restart libvirtd.service

echo "################### Notebook için  "
yay -S --needed --noconfirm tlp
sudo systemctl enable tlp.service

echo "################### Personal settings to install - "
installed_dir=$(dirname $(readlink -f $(basename `pwd`)))
	echo "Installing all shell files"
	echo
	cp $installed_dir/settings/shell-personal/.bashrc ~/.bashrc
	cp $installed_dir/settings/shell-personal/.bashrc-personal ~/.bashrc-personal
	cp $installed_dir/settings/shell-personal/.zshrc ~/.zshrc
	cp $installed_dir/settings/shell-personal/.zshrc-personal ~/.zshrc-personal
	#cp $installed_dir/settings/fish/alias.fish ~/.config/fish/alias.fish
	#sudo cp -f $installed_dir/settings/shell-personal/.bashrc /etc/skel/.bashrc
	#sudo cp -f $installed_dir/settings/shell-personal/.zshrc /etc/skel/.zshrc
	echo
### Switch to ZSH
#sudo chsh $USER -s /bin/zsh
sudo usermod -s /bin/zsh $USER

echo
echo "################### Personal settings to install - "
echo "Sublime text settings"
echo
[ -d $HOME"/.config/sublime-text/Packages/User" ] || mkdir -p $HOME"/.config/sublime-text/Packages/User"
cp  $installed_dir/settings/sublimetext/Preferences.sublime-settings $HOME/.config/sublime-text/Packages/User/Preferences.sublime-settings
echo

echo "################### Graphics drive & tools- "
# Graphics Drivers find and install
if lspci | grep -E "NVIDIA|GeForce"; then
	yay -S --needed --noconfirm nvidia-dkms
    yay -S --needed --noconfirm nvidia-settings nvidia-utils lib32-nvidia-utils
    yay -S --needed --noconfirm envycontrol
elif lspci | grep -E "Radeon"; then
    yay -S --needed --noconfirm xf86-video-amdgpu

#elif lspci | grep -E "Integrated Graphics Controller"; then
#    yay -S --needed --noconfirm  libva-intel-driver libvdpau-va-gl lib32-vulkan-intel vulkan-intel libva-intel-driver libva-utils

echo -e "\nDone!\n"

# Optimus GPU switcher
# https://store.kde.org/p/2053791/

echo "################### firmware / Hardware "
yay -S --noconfirm --needed upd72020x-fw wd719x-firmware aic94xx-firmware lshw hw-probe hwinfo linux-firmware-qlogic

echo "################### Logitech MX Mouse"
yay -S --noconfirm --needed logiops

echo "################################################################"
echo "Enable fstrim timer"
sudo systemctl enable fstrim.timer
echo
echo "################################################################"
echo "Adding ubuntu keyserver"
if ! grep -q "hkp://keyserver.ubuntu.com:80" /etc/pacman.d/gnupg/gpg.conf; then
echo 'keyserver hkp://keyserver.ubuntu.com:80' | sudo tee --append /etc/pacman.d/gnupg/gpg.conf
fi
echo
echo "################################################################"
echo "################################################################"
echo
echo "Setting environment variables"
	echo
	if [ -f /etc/environment ]; then
#		echo "QT_QPA_PLATFORMTHEME=qt5ct" | sudo tee /etc/environment
#		echo "QT_STYLE_OVERRIDE=kvantum" | sudo tee -a /etc/environment
		echo "EDITOR=nano" | sudo tee -a /etc/environment
		echo "BROWSER=thorium-browser" | sudo tee -a /etc/environment
	fi
echo "################################################################"

echo "## Bluetooth install ##########################################################"
#yay -S --needed --noconfirm bluez blueman bluez-utils bluez-libs blueberry
# yay -S --needed --noconfirm gnome-bluetooth
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
sudo sed -i 's/'#AutoEnable=false'/'AutoEnable=true'/g' /etc/bluetooth/main.conf

if ! grep -q "load-module module-switch-on-connect" /etc/pulse/system.pa; then
    echo 'load-module module-switch-on-connect' | sudo tee --append /etc/pulse/system.pa
fi

if ! grep -q "load-module module-bluetooth-policy" /etc/pulse/system.pa; then
    echo 'load-module module-bluetooth-policy' | sudo tee --append /etc/pulse/system.pa
fi

if ! grep -q "load-module module-bluetooth-discover" /etc/pulse/system.pa; then
    echo 'load-module module-bluetooth-discover' | sudo tee --append /etc/pulse/system.pa
fi
echo "################################################################"
echo "###################################################################################"

if [ ! -f /usr/share/xsessions/plasma.desktop ]; then
  #sudo pacman -S --noconfirm --needed qt5ct
fi

echo "################################################################"
echo "################### Btrfs"
echo "################################################################"
if 	lsblk -f | grep btrfs > /dev/null 2>&1 ; then
	echo "################################################################"
	echo "################### Snapper to be installed"
	echo "################################################################"
	echo "You are using BTRFS. Installing the software ..."
	echo
	sudo pacman -S --needed --noconfirm snapper
	sudo pacman -S --needed --noconfirm grub-btrfs
	sudo pacman -S --needed --noconfirm btrfs-assistant
	sudo pacman -S --needed --noconfirm snap-pac
	sudo pacman -S --needed --noconfirm snapper-support
	echo "################################################################"
	echo "################### Snapper installed"
	echo "################################################################"
else
	echo "################################################################"
	echo "### Your harddisk/ssd/nvme is not formatted as BTRFS."
	echo "### Packages will not be installed."
	echo "################################################################"
fi

####################################################################################
# Remove orphans &
yay -Rns $(pacman -Qtdq) --noconfirm
####################################################################################
echo "###################  Done- REBOOT"
