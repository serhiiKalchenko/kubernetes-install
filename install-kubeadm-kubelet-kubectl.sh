!#/bin/bash

# exit when any command fails
trap 'catch' ERR
catch() {
  echo "This script has exited on error!"
}


sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl

sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

# добавление автодополнения autocomplete постоянно в командную оболочку bash.
echo "source <(kubectl completion bash)" >> ~/.bashrc
source ~/.bashrc

kubeadm version
