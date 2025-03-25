#!/bin/bash

echo "Starting system update..."

sudo apt update

sudo apt upgrade -y

sudo apt autoremove -y
sudo apt autoclean

echo "System updated successfully!"
