output "hieradata_kms_key_id" {
  value = "${module.kms_hieradata.key_id}"
}

output "tars_core_iam_instance_profile_name" {
  value = "${aws_iam_instance_profile.tars-core.name}"
}

output "subnets_alb_public" {
  value = "${module.alb_public_subnets.subnet_ids}"
}

output "subnets_tars_backend" {
  value = "${module.tars_backend_nat_subnets.subnet_ids}"
}

# output "route_table_private_nat" {
#   value = "${aws_route_table.private_nat.id}"
# }

output "subnets_tars_db" {
  value = "${module.subnets_rds.subnet_ids}"
}
