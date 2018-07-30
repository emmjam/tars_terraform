# Output all the things needed by the other components
output "cpc-back-alb" {
  value = "${aws_security_group.cpc-back-alb.id}"
}

