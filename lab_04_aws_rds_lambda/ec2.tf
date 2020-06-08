resource "aws_instance" "server-web" {
  ami                         = "${lookup(var.amis, var.region)}"
  key_name                    = "${aws_key_pair.class_key.key_name}"
  availability_zone           = "us-east-2a"
  instance_type               = "t2.micro"
  user_data                   = "${file("userdata.sh")}"
  vpc_security_group_ids      = ["${aws_security_group.server-web.id}"]
  subnet_id                   = "${aws_subnet.us-east-2a-public-ael.id}"
  associate_public_ip_address = true
  source_dest_check           = false

  depends_on = ["aws_db_instance.default"]

  tags = {
    Name = "Instance web"
  }
}
