# Asgard<a name="asgard"></a>

> A low powered computer vision cluster at [Loyola University Chicago](https://cs.luc.edu)

<!-- mdformat-toc start --slug=github --maxlevel=6 --minlevel=1 -->

- [Asgard](#asgard)
  - [About](#about)
  - [Server Frontend](#server-frontend)
  - [Server Backend](#server-backend)
  - [Node (Client) Setup](#node-client-setup)
  - [Repository Tooling](#repository-tooling)

<!-- mdformat-toc end -->

## About<a name="about"></a>

Asgard is (currently) a cluster of [NVIDIA Jetson Nano 2GB](<>) tasked with completing
low powered computer vision tasks.

As Asgard is meant for low powered tasks, nodes on the network **do not** pool
resources together at this time.

This repository contains all of the code to setup the server backend and frontend,
and nodes.

This repository **does not** contain the image that is flashed to the nodes.
Rather, as we expect to be expanding this cluster with a number of different
devices in the future, we provide an installer to install all of the software to
a node.
In the future, we *may* publised images of the OS that is installed on the nodes.

## Server Frontend<a name="server-frontend"></a>

All code for the frontend can be found in [`app`](app).

The frontend HTML is written in standard HTML, CSS, and JS with [PicoCSS](<>) for
styling.

The frontend web server is built using Python and Flask.

## Server Backend<a name="server-backend"></a>

All code for the server backend can be found in [`server`](server).

The backend is consists of a subnet using [`dnsmasq`](<>), [`nfs`](<>), and [`avahi`](<>).
[`ssh`](<>) is included for managing the server remotely.

The server hardware and software requirements, as well as the installation instructions
are in [`backend/README.md`](server/README.md).
We also provide a reference network implmentation diagram in the instructions.

## Node (Client) Setup<a name="node-client-setup"></a>

All code for the nodes can be found in [`clients`](clients).

The node hardware and software requirements, as well as the installation instructions
are in [`clients/README.md`](clients/README.md).

## Repository Tooling<a name="repository-tooling"></a>

This repository utilizes [`poetry`](<>) for managing and building Python packages
and [`pre-commit`](<>) for code formatting.
