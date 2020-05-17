provider "aws" {
    region = "us-east-2"
}

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true

    tags = {
        Name = "main vpc 1"
    }
}

resource "aws_subnet" "subnet_main" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true


  tags = {
    Name = "Subnet Main"
  }
}
