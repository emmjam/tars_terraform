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

output "cpc-back-sg-id" {
  value = "${module.cpc-back.security_group_id}"
}

output "cpc-front-sg-id" {
  value = "${module.cpc-front.security_group_id}"
}

output "cpc-alb-target-group-internet-frontend" {
  value = "${aws_alb_target_group.cpc-front-internet-9443.arn}"
}
