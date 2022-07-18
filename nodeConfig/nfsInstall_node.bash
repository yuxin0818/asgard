#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install nfs-common
sudo rm -r /mnt/documents_node1
sudo mkdir -p /mnt/documents_node1
sudo mount 10.22.75.78:/mnt/documents /mnt/documents_node1
