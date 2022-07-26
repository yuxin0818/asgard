#!/bin/bash

# Tutorials followed:
# https://phoenixnap.com/kb/ubuntu-nfs-server

# Variables
folderPath="/mnt/asgard"
subnetIP=""

# Update, Upgrade and Autoremove software
sudo apt update
sudo apt upgrade -y
sudo apt autoremove --purege -y

# Install software
sudo apt install nfs-kernel-server -y

# Setup shared folder
sudo rm -r $folder
sudo mkdir $folder
sudo chown nobody:nogroup $folder
sudo chmod 777 $folder

# Add IP addresses for devices that can connect to the HEAD node
# Add this "/mnt/nfsdir subnetIP/24(rw,sync,no_subtree_check)"
sudo nano /etc/exports

# Export file system
sudo exportfs -a

# Restart NFS server
sudo systemctl restart nfs-kernel-server

# Add subnet IP addresses to pass through the firewall
sudo ufw allow from 10.22.74.229 to any port nfs
sudo ufw status
