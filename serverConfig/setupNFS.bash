#!/bin/bash

# Tutorials followed:
# https://phoenixnap.com/kb/ubuntu-nfs-server

# Variables
folderPath="/mnt/asgard"
subnetIP=$1

# Update, Upgrade and Autoremove software
sudo apt update
sudo apt upgrade -y
sudo apt autoremove --purge -y

# Install software
sudo apt install nfs-kernel-server -y

# Setup shared folder
sudo rm -r $folderPath
sudo mkdir $folderPath
sudo chown nobody:nogroup $folderPath
sudo chmod 777 $folderPath

# Add IP addresses for devices that can connect to the HEAD node
sudo cp /etc/exports /etc/exports.backup2
echo "${folderPath} ${subnetIP}/24(rw,sync,no_subtree_check)" | sudo tee /etc/exports

# Export file system
sudo exportfs -a

# Restart NFS server
sudo systemctl restart nfs-kernel-server

# Add subnet IP addresses to pass through the firewall
sudo ufw allow from 10.22.74.229 to any port nfs
sudo ufw status
