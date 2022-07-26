#!/bin/bash

# Tutorials followed
# https://phoenixnap.com/kb/ubuntu-nfs-server

# Variables
serverIP=""
serverFolderPath="/mnt/asgard"
clientFolderPath="/mnt/asgard_client"

# Update, Upgrade, and Autoremove
sudo apt update
sudo apt upgrade -y
sudo apt autoremove --purge -y

# Install software
sudo apt install nfs-common

# Setup mount point
sudo rm -r $clientFolderPath
sudo mkdir $clientFolderPath

# Connect to NFS server at mount point
sudo mount $serverIP:$serverFolderPath $clientFolderPath 
