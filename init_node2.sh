#!/bin/bash
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

cat <<EOF > /etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get update -y
apt-get install -y docker.io kubelet kubeadm kubectl kubernetes-cni
rm -rf /var/lib/kubelet/*
sysctl net.bridge.bridge-nf-call-iptables=1

cat >  /etc/docker/daemon.json << EOF 
{
"exec-opts": ["native.cgroupdriver=systemd"]
}
EOF

systemctl daemon-reload
systemctl restart docker

swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

sudo hostnamectl set-hostname k8s-node2

bash
