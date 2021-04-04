#!/bin/bash

# exit when any command fails
trap 'catch' ERR
catch() {
  echo "This script has exited on error!"
}


#Set up a networking ( deploy a pod network to the cluster)
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
