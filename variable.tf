variable "aws_region" {
  default     = "ap-south-1"
  description = "aws region where our resources going to create choose"
  #replace the region as suits for your requirement
}
variable "aws_ami" {
  default     = "ami-0f5ee92e2d63afc18"
  description = "Ubuntu"
}

variable "az1" {
  default     = "ap-south-1a"
  description = "az1"
}
variable "az2" {
  default     = "ap-south-1b"
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
