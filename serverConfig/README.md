# Setting Up the Server

## About

This `README.md` file contians all of the instructions that are necessary to
setup a server for the asgard cluster.

## Hardware Requirements

You'll need a machine with:

- Two ethernet ports

**NOTE:** These ports can be either from a network card or from OS compatible
USB dongles.

## Software Requirements

The machine will need to be running:

- Ubuntu 22.04

We haven't tested these instructions with other OSs at this time.

## Installation Instructions

We will forego instructions for installing the OS as others have already done
this.

Please follow the instructions in order.

### Install Avahi

1. Run `setupAvahi.bash` with the following command:

`./setupAvahi.bash`

### Setup DNSMasq

1. Run `setupDNSMasq.bash` with the following command:

`./setupDNSMasq.bash NETWORK_INTERFACE`

**NOTE:** `NETWORK_INTERFACE` is the interface that you want `dnsmasq` to
listen on.

You can find a list of available network interfaces by running:

`ifconfig`

See [Troubleshooting](#troubleshooting) for assistance resolving network
interface or `dnsmasq` problems.

### Setup NFS

1. Run `setupNFS.bash` with the following command:

`./setupNFS.bash`

## Possilbe Config Files to Change

## Troubleshooting

Check `/etc/netplan/*.yml` files
