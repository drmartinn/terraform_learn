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
  name                   = "mydbpostgres"
  username               = "${var.db_username}"
  password               = "${var.db_password}"
  port                   = 5432
  db_subnet_group_name   = "${aws_db_subnet_group.default.id}"
  vpc_security_group_ids = ["${aws_security_group.instance-bd.id}"]
  storage_encrypted      = false
}

resource "null_resource" "db_setup" {

  depends_on = ["aws_db_instance.default"]
  provisioner "local-exec"{
    command = "psql -h \"${aws_db_instance.default.endpoint} \" -p 5432 -U \"${var.db_username}\" -W \"${var.db_password}\" -d mydbpostgres -c \"${file("script.sh")}\""

    environment = {
      PGPASSWORD = "${var.db_password}"
    }
  }
}
