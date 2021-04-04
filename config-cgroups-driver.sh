#!/bin/bash
# Config cgroups drivers for Docker engine
# Configure the Docker daemon, in particular to use systemd for the management of the container’s cgroups.
# Only systemd should manage your docker engine!
# sudo mkdir /etc/docker
cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

# Restart Docker and enable on boot:
sudo systemctl enable docker
sudo systemctl daemon-reload
sudo systemctl restart docker

# Check default cgroups driver for Docker
docker info | grep -i 'cgroup driver'
