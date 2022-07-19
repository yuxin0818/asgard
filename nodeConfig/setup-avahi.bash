sudo apt update
sudo apt upgrade -y
sudo apt autoremove --purge -y
sudo apt-get install -y avahi-daemon
sudo apt-get install -y nss-mdns
sudo systemctl start avahi-daemon.service
cp /usr/share/doc/avahi/ssh.service /etc/avahi/services/
sed -i 's/hosts*/hosts: mymachines mdns_minimal [NOTFOUND=return] resolve [!UNAVAIL=return] files myhostname dns/' /etc/nsswitch.conf
