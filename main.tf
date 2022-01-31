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

  user_data = "${file("init.sh")}"

  tags = {
    #Name = "k8s-${count.index}"
    Name = "${element(var.name_prefixes, count.index)}${count.index + 1}"
  }
  }
  output "instance_public_ip" {
  value = "aws_instance.k8s-*.public_ip"
}
  output "instance_private_ip" {
  value = "aws_instance.k8s-*.private_ip"
}