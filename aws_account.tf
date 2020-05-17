provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "main vpc 1"
  }
}

resource "aws_subnet" "subnet_main" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true


  tags = {
    Name = "Subnet Main"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"
  tags = {
    Name = "Gateway main"
  }
}

resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.main.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
  tags = {
    Name = "route table for main"
  }
}

resource "aws_route_table_association" "table_subnet_main" {
  subnet_id = "${aws_subnet.subnet_main.id}"
  route_table_id = "${aws_route_table.r.id}"
}



