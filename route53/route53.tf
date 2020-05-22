resource "aws_route53_zone" "dev" {
  name = "dev.usuarioroot.com"
  force_destroy = false
  vpc {
      vpc_id = "${aws_vpc.main.id}"
  }

}
