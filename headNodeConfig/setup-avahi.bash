sudo apt update
sudo apt upgrade -y
sudo apt autoremove --purge -y
sudo apt-get install -y avahi-daemon
sudo systemctl enable avahi-daemon.server
sed -i 's/hosts*/hosts: mymachines mdns_minimal [NOTFOUND=return] resolve [!UNAVAIL=return] files myhostname dns/' /etc/nsswitch.conf
