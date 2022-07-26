#!/bin/bash

npx prettier --write *
isort backend/*
black backend/*
