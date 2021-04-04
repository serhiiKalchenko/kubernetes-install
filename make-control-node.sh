#!/bin/bash

# exit when any command fails
trap 'catch' ERR
catch() {
  echo "This script has exited on error!"
}


# make it Kubernetes Control node:
sudo kubeadm init --config kube-config.yml


mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
