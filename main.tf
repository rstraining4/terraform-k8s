resource "aws_instance" "k8s-node" {
  ami           = var.aws_ami
  instance_type = var.istance_type
  key_name      = "AWS9"
  availability_zone = var.az1
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.k8s.id]
  subnet_id              = aws_subnet.k8s_public.id
  associate_public_ip_address = true
  count                  = 2

  user_data = "${file("init.sh")}"

  tags = {
    Name = "${element(var.name_prefixes_node, count.index)}${count.index + 1}"
  }
  }

resource "aws_instance" "k8s-master" {
  ami           = var.aws_ami
  instance_type = var.istance_type
  key_name      = "AWS9"
  availability_zone = var.az1
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.k8s.id]
  subnet_id              = aws_subnet.k8s_public.id
  associate_public_ip_address = true
  

  user_data = "${file("init.sh")}"

  tags = {
    Name = var.name_prefixes_master
  }
  }