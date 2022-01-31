resource "aws_instance" "k8s" {
  ami           = var.aws_ami
  instance_type = var.istance_type
  key_name      = "AWS9"
  availability_zone = var.az1
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.k8s.id]
  subnet_id              = aws_subnet.k8s_public.id
  associate_public_ip_address = true
  count                  = 3

 
user_data = <<-EOF
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
                EOF
    tags = {
    Name = "k8s-${count.index}"
  }
  }
  output "instance_public_ip" {
  value = "aws_instance.k8s-*.public_ip"
}
  output "instance_private_ip" {
  value = "aws_instance.k8s-*.private_ip"
}