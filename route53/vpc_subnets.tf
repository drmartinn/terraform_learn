provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "main" {
  cidr_block           = "${var.vpc_cidr}"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name     = "Main VPC"
    Location = "US"
  }
}

resource "aws_subnet" "subnet1" {
  availability_zone = "us-east-2a"
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "192.168.1.0/24"

  tags = {
    Name = "Subnet - 1"
  }
}
resource "aws_subnet" "subnet2" {
  availability_zone = "us-east-2b"
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "192.168.2.0/24"

  tags = {
    Name = "Subnet - 2"
  }
}

resource "aws_subnet" "subnet3" {
  availability_zone = "us-east-2c"
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "192.168.3.0/24"

  tags = {
    Name = "Subnet - 3"
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"
  tags = {
    Name = "VPC Main GW"
  }
}

resource "aws_route_table" "web_public_rt" {
  vpc_id = "${aws_vpc.main.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
  tags = {
    Name = "Public Subnet RT"
  }
}
resource "aws_route_table_association" "public-subnet1" {
  subnet_id      = "${aws_subnet.subnet1.id}"
  route_table_id = "${aws_route_table.web_public_rt.id}"
}
resource "aws_route_table_association" "public-subnet2" {
  subnet_id      = "${aws_subnet.subnet2.id}"
  route_table_id = "${aws_route_table.web_public_rt.id}"
}
resource "aws_route_table_association" "public-subnet3" {
  subnet_id      = "${aws_subnet.subnet3.id}"
  route_table_id = "${aws_route_table.web_public_rt.id}"
}
