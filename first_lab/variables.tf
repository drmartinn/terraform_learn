variable "region" {
  description = "Region a utilizar en AWS"
  #default     = "us-east-2"
}

variable "vpc_cidr" {
  description = "VPC cidr"
  #default     = "10.0.0.0/16"
}

variable "subnet1_cidr" {
  description = "Subnet 1 cidr"
  #default     = "10.0.1.0/24"
}

variable "subnet2_cidr" {
  description = "Subnet 2 cidr"
  #default     = "10.0.2.0/24"
}

variable "subnet3_cidr" {
  description = "Subnet 3 cidr"
  #default     = "10.0.3.0/24"
}

variable "subnet1_zone" {
  description = "Zone 2a"
  #default = "us-east-2a"
}

variable "subnet2_zone" {
  description = "Zone 2b"
  #default = "us-east-2b"
}

variable "subnet3_zone" {
  description = "Zone 2c"
  #default = "us-east-2c"
}

variable "ami_id" {
  description = "AMI para RHEL8"
  #default     = "ami-0a54aef4ef3b5f881"
}

variable "subnet1_private_ip" {
  description = "Ips private to subnet1"
  type        = list(string)
}
