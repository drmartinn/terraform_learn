resource "aws_instance" "server1" {
  ami                         = "ami-0a54aef4ef3b5f881"
  instance_type               = "t2.micro"
  count                       = 1
  associate_public_ip_address = true
  subnet_id                   = "${aws_subnet.subnet_main.id}"
  vpc_security_group_ids = [
    "${aws_security_group.sg_http.id}",
    "${aws_security_group.sg_main.id}"
  ]
  key_name = "${aws_key_pair.key_class_file.key_name}"

  tags = {
    Name  = "server-1"
    Owner = "terraform"
    Env   = "dev"
  }
}
