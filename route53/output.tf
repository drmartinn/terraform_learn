output "elb_dns_name" {
  value = "${aws_elb.main_elb.dns_name}"
}

output "server1_private_ip" {
  value = "${aws_instance.server1.private_ip}"
}

output "server2_private_ip" {
  value = "${aws_instance.server2.private_ip}"
}

output "server1_eip" {
  value = "${aws_eip.one.public_ip}"
}

output "server2_eip" {
  value = "${aws_eip.two.public_ip}"
}
