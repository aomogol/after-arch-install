# Incus install

https://discussion.scottibyte.com/t/incus-the-new-lxd-installation-demo/284
https://linuxcontainers.org/


yay -S incus incus-tools incus-ui-canonical

sudo usermod -aG incus-admin $USER
sudo usermod -aG incus $USER

sudo systemctl enable --now incus

incus admin init
incus list
incus storage create pool1 dir source=/home/aom/incuspool
incus storage list

 sudo systemctl status incus.socket incus.service

## Web girişi yapıp 
crt dosyasını idirip

incus config trust add-certificate incus-ui.crt

## Create and configure the profile in incus:
incus profile create Bridged-MAIN
incus profile device add Bridged-MAIN eth0 nic nictype=bridged parent=bridge0

incus create images:ubuntu/22.04 incus3 -c boot.autostart=true --profile default --profile Bridged-MAIN

incus create images:ubuntu/22.04 incus3 --profile default --profile Bridged-MAIN


## windows kurmak için gerekenler 
yay -S --needed distrobuilder libguestfs wimlib rsync 

sudo distrobuilder repack-windows Win11_23H2_English_x64.iso Win11_23H2_English_x64.incus.iso
incus init win11vm --empty --vm
incus config device override win11vm root size=85GiB
incus config set win11vm limits.cpu=4 limits.memory=8GiB
incus config device add win11vm vtpm tpm path=/dev/tpm0
incus config device add win11vm install disk source=/home/scott/Win11_23H2_English_x64.incus.iso boot.priority=10
incus config set win11vm raw.qemu -- "-device intel-hda -device hda-duplex -audio spice"
incus start win11vm --console=vga
incus console win11vm --type=vga


https://github.com/virtio-win/virtio-win-pkg-scripts/blob/master/README.md

incus config device remove win11vm install













