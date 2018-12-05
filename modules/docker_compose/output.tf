output "eip" {
  value = "${aws_eip.eip.public_ip}"
}

output "security_group_id" {
  value = "${aws_security_group.security_group.id}"
}
