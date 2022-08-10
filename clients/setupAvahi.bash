sudo apt update
sudo apt upgrade -y
sudo apt autoremove --purge -y

sudo apt install avahi-daemon -y

sudo systemctl enable avahi-daemon
sudo systemctl start avahi-daemon
sudo systemctl status avahi-daemon
