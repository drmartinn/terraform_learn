variable "region" {
  default = "us-east-2"
}

variable "vpc_cidr" {
  default = "192.168.0.0/24"
}

variable "public_subnet_app_cidr" {
  default = "192.168.0.32/27"
}

variable "private_subnet_bd_cidr" {
  default = "192.168.0.64/27"
}

variable "private_subnet_bd2_cidr" {
  default = "192.168.0.96/27"
}

variable "amis" {
  type = "map"
  default = {
    us-east-2 = "ami-0a54aef4ef3b5f881"
    us-west-w = "ami-066df92ac6f03efca"
  }
}

variable "db_username" {
  default = "mydbpostgres"
}

variable "db_password" {
  default = "MyPasswordEsSegura!"
}
