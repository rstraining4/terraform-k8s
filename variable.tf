variable "aws_region" {
  default     = "us-west-2"
  description = "aws region where our resources going to create choose"
  #replace the region as suits for your requirement
}
variable "aws_ami" {
  default     = "ami-0b8c6b923777519db"
  description = "Amazon Linux"
}

variable "az1" {
  default     = "us-west-2a"
  description = "az1"
}
variable "az2" {
  default     = "us-west-2b"
  description = "az2"
}

variable "istance_type" {
  default     = "t2.micro"
  description = "aws istance type"
}
variable "istance_type_master" {
  default     = "t2.medium"
  description = "aws istance type"
}
variable "name_prefixes_node1" {
  default =  "k8s-node1"
}

variable "name_prefixes_node2" {
  default =  "k8s-node2"
}

variable "name_prefixes_master" {
  default = "k8s-master"
}
