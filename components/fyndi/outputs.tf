# Output all the things needed by the other components
output "fyndi_back_alb_sg_id" {
  value = "${aws_security_group.fyndi-b-alb.id}"
}
