# Asgard

> Code to support the Asgard low powered computer vision cluster at Loyola University Chicago

## Table of Contents

- [Asgard](#asgard)
  - [Table of Contents](#table-of-contents)
  - [About](#about)

## About

Asgard is a *simple* cluster of NVIDIA Jetson Nano 2GB devices that aims to provide a test bed for running and testing Computer Vision models for low powered computing devices.

This repository contains all of the information regarding:

- Setting up a NVIDIA Jetson 2GB for this project
- The frontend web interface for uploading jobs (`.img` files) to the head node of the cluster
- The backend server code to handle file transmission and storage
- Scripts to send files from the head node to a node
- Architecture diagrams to explain how this cluster is organized
- File format documentation to explain what is an isn't a valid file format
