# Setting Up the Server<a name="setting-up-the-server"></a>

<!-- mdformat-toc start --slug=github --maxlevel=6 --minlevel=1 -->

- [Setting Up the Server](#setting-up-the-server)
  - [About](#about)
  - [Hardware Requirements](#hardware-requirements)
  - [Software Requirements](#software-requirements)
  - [Installation Instructions](#installation-instructions)
    - [Install Avahi](#install-avahi)
    - [Setup DNSMasq](#setup-dnsmasq)
    - [Setup NFS](#setup-nfs)
  - [Possilbe Config Files to Change](#possilbe-config-files-to-change)
  - [Troubleshooting](#troubleshooting)

<!-- mdformat-toc end -->

## About<a name="about"></a>

This `README.md` file contians all of the instructions that are necessary to
setup a server for the `asgard` cluster.

## Hardware Requirements<a name="hardware-requirements"></a>

You'll need a machine with:

- Two ethernet ports

**NOTE:** These ports can be either from a network card or from OS compatible
USB dongles.

## Software Requirements<a name="software-requirements"></a>

The machine will need to be running:

- Ubuntu 22.04

We haven't tested these instructions with other OSs at this time.

## Installation Instructions<a name="installation-instructions"></a>

We will forego instructions for installing the OS as others have already done
this.

Please follow the instructions in order.

### Install Avahi<a name="install-avahi"></a>

1. Run `setupAvahi.bash` with the following command:

`./setupAvahi.bash`

### Setup DNSMasq<a name="setup-dnsmasq"></a>

1. Run `setupDNSMasq.bash` with the following command:

`./setupDNSMasq.bash NETWORK_INTERFACE`

**NOTE:** `NETWORK_INTERFACE` is the interface that you want `dnsmasq` to
listen on.

You can find a list of available network interfaces by running:

`ifconfig`

**NOTE:** By default, the subnet is `192.168.102`.

**NOTE:** By default, the range of IP address is between is `${subnetIP}10, ${subnetIP}110`.

See [Troubleshooting](#troubleshooting) for assistance resolving network
interface or `dnsmasq` problems.

### Setup NFS<a name="setup-nfs"></a>

1. Run `setupNFS.bash` with the following command:

`./setupNFS.bash`

## Possilbe Config Files to Change<a name="possilbe-config-files-to-change"></a>

## Troubleshooting<a name="troubleshooting"></a>

Check `/etc/netplan/*.yml` files
