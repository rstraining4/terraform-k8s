variable "aws_region" {
  default     = "ap-south-1"
  description = "aws region where our resources going to create choose"
  #replace the region as suits for your requirement
}
variable "aws_ami" {
  default     = "ami-0851b76e8b1bce90b"
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

variable "name_prefixes" {
  default = ["k8s-master", "k8s-node"]
}