# kubernetes-install
Install Kubernetes cluster (manually) with 'kubeadm' on AWS EC2 instances.

Prerequisites:
 - Image: `Ubuntu 20.04`
 - Instance type: `t2.medium` (min:2 vCPU/2 RAM)

Copy files to server
 - `scp -i <path/to/ssh_key> -r <dir_with_installation_scripts> ubuntu@<host_ip>:~`
 - `ssh ubuntu@<host_ip> -i <path/to/ssh_key>`

Set hostname
 - `sudo hostnamectl set-hostname kube-control`

Make it executable
 - `chmod u+x install-docker-kube.sh config-cgroups-driver.sh install-kubeadm-kubelet-kubectl.sh make-control-node.sh network-setup.sh`

Run the scripts:
1. Control node
- `install-docker-kube.sh`
- `config-cgroups-driver.sh`
- `install-kubeadm-kubelet-kubectl.sh`
- `make-control-node.sh`
- `network-setup.sh`
2. Worker node 
- `install-docker-kube.sh`
- `config-cgroups-driver.sh`
- `install-kubeadm-kubelet-kubectl.sh`
3. Check the firewall settings!
- port 6443 for your Worker host (subnet) should be available!
4. Join Worker node to Control node with 'kubeadm join' command!
- don't forget `sudo` + `kubeadm join` (see from the console output at Control node)
