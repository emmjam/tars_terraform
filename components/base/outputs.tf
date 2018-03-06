
output "tars_core_iam_instance_profile_name" {
  value = "${aws_iam_instance_profile.tars-core.name}"
}

output "subnets_alb_public" {
  value = "${module.alb_public_subnets.subnet_ids}"
}

output "subnets_tars_backend" {
  value = "${module.tars_backend_subnets.subnet_ids}"
}

# output "route_table_private_nat" {
#   value = "${aws_route_table.private_nat.id}"
# }

output "subnets_tars_db" {
  value = "${module.subnets_rds.subnet_ids}"
}

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "key_name" {
  value = "${aws_key_pair.deployer.key_name}"
}

output "private_zone_id" {
  value = "${aws_route53_zone.tars.zone_id}"
}
