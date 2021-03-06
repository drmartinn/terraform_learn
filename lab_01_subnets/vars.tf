variable "region" {
  default = "us-east-2"
}

variable "vpc_cidr" {
  default = "192.168.0.0/16"
}

variable "public_subnet_cidr" {
  default = "192.168.1.0/24"
}

variable "private_subnet_cidr" {
  default = "192.168.2.0/24"
}

variable "amis" {
  type = "map"
  default = {
    us-east-2 = "ami-0a54aef4ef3b5f881"
    us-west-w = "ami-066df92ac6f03efca"
  }
}

variable "aws_key_name" {}

variable "aws_key_path" {}
