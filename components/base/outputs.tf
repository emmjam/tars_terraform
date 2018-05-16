# Output all the things needed by the other components
output "tars_core_iam_instance_profile_name" {
  value = "${aws_iam_instance_profile.tars-core.name}"
}

output "tars_messaging_iam_instance_profile_name" {
  value = "${aws_iam_instance_profile.tars-messaging.name}"
}

output "subnets_alb_public" {
  value = "${module.alb_public_subnets.subnet_ids}"
}

output "subnets_tars_backend" {
  value = "${module.tars_backend_subnets.subnet_ids}"
}

output "subnets_tars_web" {
  value = "${module.tars_web_subnets.subnet_ids}"
}

output "subnets_tars_messaging" {
  value = "${module.tars_messaging_subnets.subnet_ids}"
}

output "route_table_jenkins_nat" {
  value = "${aws_route_table.private_nat.*.id}"
}

output "subnets_tars_db" {
  value = "${module.subnets_rds.subnet_ids}"
}

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "private_zone_id" {
  value = "${aws_route53_zone.vpc.zone_id}"
}

output "public_route_table_id" {
  value = "${aws_route_table.public.id}"
}

output "private_nat_route_table_id" {
  value = "${aws_route_table.private_nat.*.id}"
}

output "private_nonat_route_table_id" {
  value = "${aws_route_table.private_nonat.id}"
}

output "jenkins_net_route_table_id" {
  value = "${aws_route_table.private_nat.*.id}"
}
 
output "awsmq_sg_id" {
  value = "${aws_security_group.tars-awsmq.id}"
}
output "ctrl_peering_id" {
  value = "${aws_vpc_peering_connection.ctrl.id}"
}

output "kms_sg_id" {
  value = "${aws_security_group.kms_endpoint.id}"
}

output "subnets_tars_awsmq" {
  value = "${module.tars_awsmq_subnets.subnet_ids}"
}

output "jenkinsnode_sg_id" {
  value = "${module.jenkinsnode.security_group_id}"
}

output "core_sg_id" {
  value = "${aws_security_group.core.id}"
}

