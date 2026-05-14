#!/bin/bash

update_package="sudo apt update"

echo "update package"
$update_package

echo "install a few prerequisite packages"
sudo apt install ca-certificates curl gnupg

echo "Add the GPG key for the official Docker repository to system"
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "Add the Docker repository to APT sources"
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Update package again"
$update_package

echo "Make sure to install from the Docker repo"
apt-cache policy docker-ce

echo "install docker"
sudo apt install docker-ce

echo "Check Docker"
sudo systemctl status docker