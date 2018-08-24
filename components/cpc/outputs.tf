# Output all the things needed by the other components
output "cpc-back-alb" {
  value = "${aws_security_group.cpc-back-alb.id}"
}

output "subnet_cidrs_cpc_backend" {
  value = "${module.cpc-back.subnet_ids}"
}

output "cpc-db-sg-id" {
  value = "${aws_security_group.cpc-db.id}"
}