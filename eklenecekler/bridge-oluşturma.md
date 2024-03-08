## Bridge

yay -S netplan

https://discussion.scottibyte.com/t/what-is-a-bridge/193


cd /etc/netplan
sudo nano 00-installer-config.yml

network:
  version: 2

  ethernets:
    xxxx:
      dhcp4: false
      dhcp6: false

  bridges:
    bridge0:
      interfaces: [xxxx]
      addresses: [a.b.c.d/24]
      routes:
         - to: default
           via: g.g.g.g
      nameservers:
        addresses:
          - 1.1.1.1
          - 1.0.0.1
      parameters:
        stp: true
        forward-delay: 4
      dhcp4: no



sudo netplan apply

## docker varsa kontrol edilecek

docker network list

docker network create -d bridge --subnet=192.168.1.0/24 --gateway=192.168.1.1 -o parent=bridge0 doc-bridge

docker run -it --network=doc-bridge busybox





