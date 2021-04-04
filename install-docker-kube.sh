#!/bin/bash

# Installation method from Kubernetes
# https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

# exit when any command fails
trap 'catch' ERR
catch() {
  echo "This script has exited on error!"
}


# Uninstall old versions
# https://docs.docker.com/engine/install/ubuntu/#uninstall-old-versions
sudo apt-get remove docker docker-engine docker.io containerd runc

# Supported storage drivers (configure manually!)
# https://docs.docker.com/storage/storagedriver/aufs-driver/


# Install Docker using the repository
sudo apt-get update
sudo apt-get install -y\
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg \
     lsb-release


# Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Use the following command to set up the stable repository. 
echo \
"deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# INSTALL DOCKER ENGINE

# Update the apt package index
sudo apt-get update
#sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# See the list of specific version of Docker Engine
# apt-cache madison docker-ce 
# choose for example: "5:19.03.9~3-0~ubuntu-focal"

# Install a specific version of Docker Engine
# sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io
sudo apt-get install -y docker-ce=5:19.03.9~3-0~ubuntu-focal docker-ce-cli=5:19.03.9~3-0~ubuntu-focal containerd.io --allow-downgrades

# Verify that Docker Engine is installed correctly by running the hello-world image.
#sudo docker run hello-world

# Add user to group 'docker' & relogin to bash
# sudo groupadd docker # in Ubuntu group docker already exist!
sudo usermod -aG docker $USER

# On Linux, you can also run the following command to activate the changes to groups:
newgrp docker

# UPGRADE DOCKER ENGINE
# sudo apt-get update
# then follow the installation instructions: https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

docker --version
