#!/bin/bash

# https://www.howtoforge.com/how-to-setup-local-dns-server-using-dnsmasq-on-ubuntu-20-04/
# https://www.linuxuprising.com/2020/07/ubuntu-how-to-free-up-port-53-used-by.html

# Network interface to use for subnet; found by running ifconfig
interface=""

sudo systemctl stop dnsmasq
sudo systemctl disable --now dnsmasq
sudo systemctl enable systemd-resolved

sudo apt remove dnsmasq dnsutils ldnsutils --purge -y
sudo apt update
sudo apt upgrade -y
sudo apt autoremove --purge -y

sudo systemctl disable --now systemd-resolved

sudo apt-get install dnsmasq dnsutils ldnsutils -y

sudo systemctl stop dnsmasq
sudo systemctl disable --now dnsmasq

sudo cp /etc/resolv.conf /etc/resolv.conf.backup
sudo cp /etc/host.conf /etc/host.conf.backup
sudo cp /etc/dnsmasq.conf /etc/dnsmasq.conf.backup

echo "nameserver 1.1.1.1" | sudo tee /etc/resolv.conf

echo """order hosts,bind
multi on""" | sudo tee /etc/host.conf

echo """interface=${interface}
listen-address=192.168.102.1
# set static ip addresses: dhcp-range=192.168.102.220,static,infinite
dhcp-range=192.168.102.220,infinite
dhcp-option=3,192.168.102.1
dhcp-option=6,1.1.1.1
dhcp-option=28,192.168.102.255
# dhcp-host=clientMacAddress,clientHostname,staticIP,infinite
log-dhcp""" | sudo tee /etc/dnsmasq.conf

sudo systemctl enable dnsmasq
sudo systemctl start dnsmasq
sudo systemctl status dnsmasq
