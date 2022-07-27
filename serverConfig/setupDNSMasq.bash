#!/bin/bash

# https://www.howtoforge.com/how-to-setup-local-dns-server-using-dnsmasq-on-ubuntu-20-04/
# https://www.linuxuprising.com/2020/07/ubuntu-how-to-free-up-port-53-used-by.html
# https://wiki.debian.org/dnsmasq

# Network interface to use for subnet; found by running ifconfig

interface=$1
nameserver="1.1.1.1"

sudo apt remove dnsmasq dnsutils ldnsutils --purge -y

sudo apt update
sudo apt upgrade -y
sudo apt autoremove --purge -y

sudo systemctl disable --now systemd-resolved

sudo apt-get install dnsmasq dnsutils ldnsutils -y

# Configure dnsmasq
sudo cp /etc/resolv.conf /etc/resolv.conf.backup
sudo cp /etc/host.conf /etc/host.conf.backup
sudo cp /etc/dnsmasq.conf /etc/dnsmasq.conf.backup

echo "nameserver ${nameserver}" | sudo tee /etc/resolv.conf

echo """order hosts,bind
multi on""" | sudo tee /etc/host.conf

echo """interface=${interface}
port=53

dhcp-range=192.168.102.0,192.168.102.255,infinite

dhcp-option=option:netmask,255.255.255.0
dhcp-option=option:router,192.168.102.1
dhcp-option=option:dns-server,192.168.102.1

log-queries
log-dhcp""" | sudo tee /etc/dnsmasq.conf

# Set subnet IP address of network interface
sudo ifconfig $interface "192.168.102.1"

# Allow any connection through UFW on subnet
sudo ufw allow from "192.168.102.0/24" to any port 53

sudo systemctl restart dnsmasq
sudo systemctl status dnsmasq
