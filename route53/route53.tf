resource "aws_route53_zone" "dev" {
  name          = "dev.usuarioroot.com"
  force_destroy = false
  vpc {
    vpc_id = "${aws_vpc.main.id}"
  }
}

resource "aws_route53_record" "server1" {
  zone_id = "${aws_route53_zone.dev.zone_id}"
  name    = "server1.dev.usuario.com"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.server1.private_ip}"]
}


resource "aws_route53_record" "server2" {
  zone_id = "${aws_route53_zone.dev.zone_id}"
  name    = "server2.dev.usuario.com"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.server2.private_ip}"]
}

