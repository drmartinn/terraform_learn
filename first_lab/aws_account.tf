provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "main" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags = {
    Name = "main vpc 1"
  }
}

resource "aws_subnet" "subnet_main" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.subnet1_cidr}"
  map_public_ip_on_launch = true
  availability_zone       = "${var.subnet1_zone}"


  tags = {
    Name = "Subnet Main us-east-2a"
  }
}

resource "aws_subnet" "subnet_main2" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.subnet2_cidr}"
  map_public_ip_on_launch = true
  availability_zone       = "${var.subnet2_zone}"

  tags = {
    Name = "Subnet Main us-east-2b"
  }
}

resource "aws_subnet" "subnet_main3" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.subnet3_cidr}"
  map_public_ip_on_launch = true
  availability_zone       = "${var.subnet3_zone}"

  tags = {
    Name = "Subnet Main us-east-2c"
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
  subnet_id      = "${aws_subnet.subnet_main.id}"
  route_table_id = "${aws_route_table.r.id}"
}

resource "aws_route_table_association" "table_subnet_main2" {
  subnet_id      = "${aws_subnet.subnet_main2.id}"
  route_table_id = "${aws_route_table.r.id}"
}

resource "aws_route_table_association" "table_subnet_main3" {
  subnet_id      = "${aws_subnet.subnet_main3.id}"
  route_table_id = "${aws_route_table.r.id}"
}




