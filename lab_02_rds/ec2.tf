resource "aws_instance" "server-web" {
  ami                         = "${lookup(var.amis, var.region)}"
  key_name                    = "${var.aws_key_name}"
  availability_zone           = "us-east-2a"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.server-web.id}"]
  subnet_id                   = "${aws_subnet.us-east-2a-public-ael.id}"
  associate_public_ip_address = true
  source_dest_check           = false
  tags = {
    Name = "Instance web"
  }
}
