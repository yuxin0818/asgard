#!/bin/bash

# Tutorials followed:
# https://phoenixnap.com/kb/ubuntu-nfs-server

folderPath="/mnt/asgard"
subnetIP="192.168.102.0"

sudo apt remove nfs-kernel-server --purge -y

sudo apt update
sudo apt upgrade -y
sudo apt autoremove --purge -y

sudo apt install nfs-kernel-server -y

# Setup shared folder
sudo rm -r $folderPath
sudo mkdir $folderPath
sudo chown nobody:nogroup $folderPath
sudo chmod 777 $folderPath

# Expose shared folder to the subnet
sudo cp /etc/exports /etc/exports.backupd
echo "${folderPath} ${subnetIP}/24(rw,sync,no_subtree_check)" | sudo tee /etc/exports

sudo exportfs -a

sudo systemctl restart nfs-kernel-server
sudo systemctl status nfs-kernel-server

# Add subnet IP addresses to pass through the firewall
sudo ufw allow from "${subnetIP}/24" to any port nfs
sudo ufw status
