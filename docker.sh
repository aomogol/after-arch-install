echo "################### Docker"
# Docker Desktop needs for non-Gnome Desktop environments, gnome-terminal must be installed
yay -S --needed --noconfirm gnome-terminal
yay -S --needed --noconfirm docker
#yay -S --needed --noconfirm docker-desktop
sudo groupadd docker
#newgrp docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo systemctl enable containerd.service
sudo systemctl start containerd.service
sudo chmod 666 /var/run/docker.sock