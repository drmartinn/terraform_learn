resource "aws_instance" "server1" {
  ami           = "ami-0a54aef4ef3b5f881"
  instance_type = "t2.micro"
  count         = 1
  subnet_id     = "${aws_subnet.subnet_main.id}"
}
