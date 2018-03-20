output "public_domain_name" {
  value = "${var.public_domain_name}"
}

output "public_domain_name_ns_records" {
  value = "${aws_route53_zone.public_domain.name_servers}"
}

output "public_domain_name_zone_id" {
  value = "${aws_route53_zone.public_domain.zone_id}"
}

output "account_alias" {
  value = "${var.aws_account_alias}"
}

output "notify_ops_sns_arn" {
  value = "${aws_sns_topic.notify_ops.arn}"
}

output "hieradata_kms_key_id" {
  value = "${module.kms_hieradata.key_id}"
}

output "hieradata_kms_key_arn" {
  value = "${module.kms_hieradata.key_arn}"
}

output "hieradata_kms_key_user_policy_arn" {
  value = "${module.kms_hieradata.user_policy_arn}"
}

output "key_name" {
  value = "${aws_key_pair.deployer.key_name}"
}