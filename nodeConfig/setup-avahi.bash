sudo apt update
sudo apt upgrade -y
sudo apt autoremove --purge -y
sudo apt-get install -y avahi-daemon
sudo systemctl enable avahi-daemon.server
sudo systemctl start avahi-daemon.server
