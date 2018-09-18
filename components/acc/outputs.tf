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

##
# CWLES
##

# The Elasticsearch Domain ARN
output "cwles_es_domain_arn" {
  value = "${module.cwles.es_domain_arn}"
}

# The Elasticsearch Domain public endpoint
output "cwles_es_domain_endpoint" {
  value = "${module.cwles.es_domain_endpoint}"
}

# The Elasticsearch Domain ID (Name)
output "cwles_es_domain_id" {
  value = "${module.cwles.es_domain_id}"
}

# The LogsToES Lambda Function ARN (for use in cwles-cloudtrail and cwles-vpcflowlog modules)
output "cwles_logstoes_lambda_arn" {
  value = "${module.cwles.logstoes_lambda_arn}"
}

##
# CWLES-CloudTrail
##

output "cwles_cloudtrail_id" {
  value = "${module.cwles_cloudtrail.cloudtrail_id}"
}

output "cwles_cloudtrail_arn" {
  value = "${module.cwles_cloudtrail.cloudtrail_arn}"
}

# The DVSA EC2 read_only role
output "DVSA-EC2-Read-Role-role-arn" {
  value = "${aws_iam_role.DVSA-EC2-Read-Role.arn}"
}
