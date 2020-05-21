resource "aws_instance" "server1" {
  ami                         = "${var.ami_id}"
  instance_type               = "t2.micro"
  count                       = 2
  associate_public_ip_address = true
  subnet_id                   = "${aws_subnet.subnet_main.id}"
  vpc_security_group_ids = [
    "${aws_security_group.sg_http.id}",
    "${aws_security_group.sg_main.id}"
  ]
  key_name  = "${aws_key_pair.key_class_file.key_name}"
  user_data = "${file("userdata.sh")}"

  tags = {
    Name  = "server- ${count.index + 1}"
    Owner = "terraform"
    Env   = "dev"
  }
}

# resource "aws_instance" "server2" {
#   ami                         = "ami-0a54aef4ef3b5f881"
#   instance_type               = "t2.micro"
#   count                       = 1
#   associate_public_ip_address = true
#   subnet_id                   = "${aws_subnet.subnet_main.id}"
#   vpc_security_group_ids = [
#     "${aws_security_group.sg_http.id}",
#     "${aws_security_group.sg_main.id}"
#   ]
#   key_name = "${aws_key_pair.key_class_file.key_name}"
#   user_data = <<EOF
# #!/bin/bash
# export PATH=$PATH:/usr/local/bin
# sudo -i
# exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
# yum install -y httpd
# echo "<html><h1>Hola, exclente ejercicio...<p></p><p>Continuamos 2</p></h1></html>" > /var/www/html/index.html
# systemctl start httpd
# systemctl enable httpd
# EOF

#   tags = {
#     Name  = "server-2"
#     Owner = "terraform"
#     Env   = "dev"
#   }
# }

