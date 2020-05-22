resource "aws_key_pair" "example_key_name" {
  key_name = "example_key_name"
  public_key = "${file("class_key.pem.pub")}"
}
