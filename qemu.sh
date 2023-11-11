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