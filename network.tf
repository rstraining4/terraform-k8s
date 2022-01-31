resource "aws_vpc" "K8SVPC" {
  cidr_block       = "172.20.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "K8SVPC"
  }
}

resource "aws_subnet" "k8s_public" {
  vpc_id     = aws_vpc.K8SVPC.id
  cidr_block = "172.20.1.0/24"
  availability_zone = var.az1

  tags = {
    Name = "k8s_public"
  }
}

resource "aws_subnet" "k8s_private" {
  vpc_id     = aws_vpc.K8SVPC.id
  cidr_block = "172.20.2.0/24"
  availability_zone = var.az2

  tags = {
    Name = "k8s_private"
  }
}

#Internet gateway
resource "aws_internet_gateway" "K8SIGW" {
  vpc_id = aws_vpc.K8SVPC.id

  tags = {
    Name = "K8SIGW"
  }
}

#route tables

resource "aws_route_table" "k8s-public-route" {
  vpc_id = aws_vpc.K8SVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.K8SIGW.id
  }

  tags = {
    Name = "k8s-public-route"
  }
}

#subnet association

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.k8s_public.id
  route_table_id = aws_route_table.k8s-public-route.id
}

#security group


resource "aws_security_group" "k8s" {
  name        = "k8s"
  description = "Allow web inbound traffic"
  vpc_id      = aws_vpc.K8SVPC.id

  ingress {
    
  }
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "k8s"
  }
}

#Private IP Address

#resource "aws_network_interface" "web-instance-nic" {
#  subnet_id       = aws_subnet.public1.id
#  private_ips     = ["10.0.1.50"]
#  security_groups = [aws_security_group.allow_web.id]
#}

#Public Elastic IP Address
#resource "aws_eip" "one" {
#  vpc                       = true
#  network_interface         = aws_network_interface.web-instance-nic.id
#  associate_with_private_ip = "10.0.1.50"
#  depends_on = [aws_internet_gateway.MyIGW]
#}