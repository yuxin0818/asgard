# Asgard

> Code to support the Asgard low powered computer vision cluster at Loyola University Chicago

## Table of Contents

-   [Asgard](#asgard)
    -   [Table of Contents](#table-of-contents)
    -   [About](#about)
    -   [Setup](#setup)
    -   [Frontend](#frontend)
    -   [Backend](#backend)
    -   [Intra-Node Communication](#intra-node-communication)
    -   [Architecture Diagrams](#architecture-diagrams)
    -   [File Format Documentation](#file-format-documentation)

## About

Asgard is a _simple_ cluster of NVIDIA Jetson Nano 2GB devices that aims to provide a test bed for running and testing Computer Vision models for low powered computing devices.

This repository contains all of the information regarding:

-   Setting up a NVIDIA Jetson 2GB for this project
-   The frontend web interface for uploading jobs (`.img` files) to the head node of the cluster
-   The backend server code to handle file transmission and storage
-   Scripts to send files from the head node to a node
-   Architecture diagrams to explain how this cluster is organized
-   File format documentation to explain what is an isn't a valid file format

## Setup

See [JETSON_SETUP.md](JETSON_SETUP.md) for more information.

## Frontend

Frontend code can be found [here](frontend/).

The frontend website is written in a single HTML, CSS, and JS file.
It uses [Pico.css](https://picocss.com/) as its CSS framework to simplify development.

## Backend

The server backend for the website is handled via [Flask](https://flask.palletsprojects.com/en/2.1.x/) and Python 3.10+.

Backend code can be found [here](backend/).

## Intra-Node Communication

## Architecture Diagrams

## File Format Documentation

The cluster executes programs that are encapsulated within a `.img` file containing a Debian environment.

For further information and how to get started , see [FILE_FORMAT.md](FILE_FORMAT.md).
