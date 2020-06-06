resource "aws_vpc" "ael" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true
  tags = {
    Name = "VPC AEL"
  }
}

resource "aws_internet_gateway" "ael-igw" {
  vpc_id = "${aws_vpc.ael.id}"
  tags = {
    Name = "Internet gateway ael"
  }
}

#public subnet
resource "aws_subnet" "us-east-2a-public-ael" {
  vpc_id            = "${aws_vpc.ael.id}"
  cidr_block        = "${var.public_subnet_app_cidr}"
  availability_zone = "us-east-2a"
  tags = {
    Name = "Subnet us-east-2a-public-ael"
  }
}

resource "aws_route_table" "us-east-2a-public-ael" {
  vpc_id = "${aws_vpc.ael.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ael-igw.id}"
  }
}

resource "aws_route_table_association" "us-east-2a-public-ael" {
  subnet_id      = "${aws_subnet.us-east-2a-public-ael.id}"
  route_table_id = "${aws_route_table.us-east-2a-public-ael.id}"
}

#private subnet
resource "aws_subnet" "us-east-2a-private-ael" {
  vpc_id            = "${aws_vpc.ael.id}"
  cidr_block        = "${var.private_subnet_bd_cidr}"
  availability_zone = "us-east-2a"
  tags = {
    Name = "Private Subnet BD"
  }
}


resource "aws_subnet" "us-east-2b-private-ael" {
  vpc_id            = "${aws_vpc.ael.id}"
  cidr_block        = "${var.private_subnet_bd2_cidr}"
  availability_zone = "us-east-2b"
  tags = {
    Name = "Private Subnet BD 2"
  }
}
