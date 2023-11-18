#!/usr/bin/bash
#set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo "#####################################"
echo "       XeroLinux Snapper Setup       "
echo "#####################################"
echo
# Get current user's username
username=$(whoami)

# Welcome message
echo -e "${GREEN}Hi, $username! Checking for BTRFS, if so BTRFS Assistant & Snapper tools will be installed.${NC}"
echo
sleep 3
# Check if the file system is BTRFS
if lsblk -f | grep -q "btrfs"; then
    echo -e "${GREEN}BTRFS partitions found. Adding Necessary Modules, Installing Packages & Initializing Root/Home.r.${NC}"
    echo
    echo "Installing Packages & Updating mkinitcpio configuration"
    sudo pacman -Sy --noconfirm btrfs-assistant btrfs-du snapper-support btrfsmaintenance
    echo
    sleep 3
    sudo sed -i 's/MODULES="\(.*\)"/MODULES="\1 btrfs"/; s/crc32c//g' /etc/mkinitcpio.conf
    sudo mkinitcpio -P
    sleep 3
    echo
    echo "Initializing snapper for root subvolume"
    sudo snapper -c root create-config /
    sudo snapper -c root create
    echo
    sleep 3
    echo "Initializing snapper for home subvolume"
    sudo snapper -c home create-config /home
    sudo snapper -c home create
    echo
    sleep 3
    echo -e "${BLUE}Snapper installed and initialized. Reboot required.${NC}"
    echo
else
    echo -e "${RED}No BTRFS Partitions found. Exiting...${NC}"
    exit 1
fi
