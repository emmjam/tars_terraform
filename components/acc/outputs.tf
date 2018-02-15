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
