resource "aws_db_subnet_group" "default" {
  name       = "bd"
  subnet_ids = ["${aws_subnet.us-east-2a-private-ael.id}", "${aws_subnet.us-east-2b-private-ael.id}"]

  tags = {
    Name = "DB subnet group"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage      = 20
  max_allocated_storage  = 30
  storage_type           = "gp2"
  engine                 = "postgres"
  engine_version         = "10.6"
  instance_class         = "db.t2.micro"
  name                   = "${var.db_name}"
  username               = "${var.db_username}"
  password               = "${var.db_password}"
  port                   = 5432
  db_subnet_group_name   = "${aws_db_subnet_group.default.id}"
  vpc_security_group_ids = ["${aws_security_group.instance-bd.id}"]
  storage_encrypted      = false
}

