output "tars_core_iam_instance_profile_name" {
  value = "${aws_iam_instance_profile.tars-core.name}"
}

output "subnets_alb_public" {
  value = "${module.alb_public_subnets.subnet_ids}"
}

output "subnets_tars_backend" {
  value = "${module.tars_backend_subnets.subnet_ids}"
}

output "route_table_jenkins_nat" {
  value = "${aws_route_table.jenkins_nat.*.id}"
}

output "subnets_tars_db" {
  value = "${module.subnets_rds.subnet_ids}"
}

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "private_zone_id" {
  value = "${aws_route53_zone.tars.zone_id}"
}

output "public_route_table_id" {
  value = "${aws_route_table.public.id}"
}

output "jenkins_net_route_table_id" {
  value = "${aws_route_table.jenkins_nat.*.id}"
}
 
output "mgmt_peering_id" {
  value = "${aws_vpc_peering_connection.mgmt.id}"
}

output "kms_sg_id" {
  value = "${aws_security_group.kms_endpoint.id}"
}

output "subnets_tars_awsmq" {
  value = "${module.tars_awsmq_subnets.subnet_ids}"
}
