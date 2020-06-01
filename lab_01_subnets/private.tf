resource "aws_security_group" "db" {
  name   = "vpc_db"
  vpc_id = "${aws_vpc.default.id}"
  ingress {
    from_port       = 1433
    to_port         = 1433
    protocol        = "tcp"
    security_groups = ["${aws_security_group.web.id}"]
  }
  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
    security_groups = ["${aws_security_group.web.id}"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.vpc_cidr}"]
  }
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "db_1" {
  ami                    = "${lookup(var.amis, var.region)}"
  key_name               = "${var.aws_key_name}"
  availability_zone      = "us-east-2a"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.db.id}"]
  subnet_id              = "${aws_subnet.us-east-2a-private.id}"
  source_dest_check      = false
  tags = {
    Name = "DB server 1"
  }
}

