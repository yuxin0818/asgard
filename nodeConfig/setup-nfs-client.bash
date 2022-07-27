#!/bin/bash

# Tutorials followed
# https://phoenixnap.com/kb/ubuntu-nfs-server

serverIP=$1
serverFolderPath="/mnt/asgard"
clientFolderPath="/mnt/asgard"

sudo apt remove nfs-common --purge -y

sudo apt update
sudo apt upgrade -y
sudo apt autoremove --purge -y

sudo apt install nfs-common -y

sudo rm -r $clientFolderPath
sudo mkdir $clientFolderPath

# Connect to NFS server at mount point
sudo mount $serverIP:$serverFolderPath $clientFolderPath 
