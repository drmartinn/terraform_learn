variable "region" {
  default = "us-east-2"
}

variable "ec2_ami" {
  type = "map"
  default = {
    us-east-2 = "ami-0a54aef4ef3b5f881"
    us-west-w = "ami-066df92ac6f03efca"
  }

}

