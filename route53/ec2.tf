resource "aws_instance" "server1" {
  ami                         = "ami-0a54aef4ef3b5f881"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.route_allow_http_ssh.id}"]
  subnet_id                   = "${aws_subnet.subnet1.id}"
  associate_public_ip_address = true
  private_ip                  = "192.168.1.10"
  key_name                    = "${aws_key_pair.example_key_name.id}"
  depends_on                  = ["${aws_internet_gateway.gw}"]
  user_data                   = "${file("userdata1.sh")}"
  tags = {
      Name = "server-1"
      Env = "dev"
  }
}

resource "aws_instance" "server2" {
  ami                         = "ami-0a54aef4ef3b5f881"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${aws_security_group.route_allow_http_ssh.id}"]
  subnet_id                   = "${aws_subnet.subnet1.id}"
  associate_public_ip_address = true
  private_ip                  = "192.168.1.11"
  key_name                    = "${aws_key_pair.example_key_name.id}"
  depends_on                  = ["${aws_internet_gateway.gw}"]
  user_data                   = "${file("userdata1.sh")}"
  tags = {
      Name = "server-2"
      Env = "dev"
  }
}

