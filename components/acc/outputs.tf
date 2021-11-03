output "public_domain_name" {
  value = var.public_domain_name
}

output "public_domain_name_ns_records" {
  value = flatten(aws_route53_zone.public_domain.*.name_servers)
}

output "public_domain_name_zone_id" {
  value = element(concat(aws_route53_zone.public_domain.*.zone_id, [""]), 0)
}

output "public_domain_root_zone_id" {
  value = element(concat(aws_route53_zone.public_domain_root.*.zone_id, [""]), 0)
}

output "account_alias" {
  value = var.aws_account_alias
}

output "notify_ops_sns_arn" {
  value = aws_sns_topic.notify_ops.arn
}

output "hieradata_kms_key_id" {
  value = module.kms_hieradata.key_id
}

output "hieradata_kms_key_arn" {
  value = module.kms_hieradata.key_arn
}

output "hieradata_kms_key_user_policy_arn" {
  value = module.kms_hieradata.user_policy_arn
}

output "platform_ops_kms_key_id" {
  value = module.kms_platform_ops.key_id
}

output "platform_ops_kms_key_arn" {
  value = module.kms_platform_ops.key_arn
}

output "platform_ops_kms_key_user_policy_arn" {
  value = module.kms_platform_ops.user_policy_arn
}

output "key_name" {
  value = aws_key_pair.deployer.key_name
}

##
# CWLES-CloudTrail
##

output "cwles_cloudtrail_id" {
  value = module.cwles_cloudtrail.cloudtrail_id
}

output "cwles_cloudtrail_arn" {
  value = module.cwles_cloudtrail.cloudtrail_arn
}

# The DVSA EC2 read_only role
output "DVSA-EC2-Read-Role-role-arn" {
  value = aws_iam_role.DVSA-EC2-Read-Role.arn
}

output "tars_dlm_lifecycle_role_arn" {
  value = aws_iam_role.dlm_lifecycle_role.arn
}

output "oom-s3-log-bucket" {
  value = aws_s3_bucket.oom-logs.arn
}

output "oom-s3-log-bucket_id" {
  value = aws_s3_bucket.oom-logs.id
}

output "lambda-artefacts-bucket" {
  value = aws_s3_bucket.lambda_artefacts.id
}
##
# SQS Queue outputs gov notify
##

output "sqs_queue_messages_name" {
  value = "${aws_sqs_queue.messages.name}"
}

output "sqs_queue_messages_arn" {
  value = "${aws_sqs_queue.messages.arn}"
}

output "sqs_queue_dead_letter_name" {
  value = "${aws_sqs_queue.dead_letter.name}"
}

output "sqs_queue_dead_letter_arn" {
  value = "${aws_sqs_queue.dead_letter.arn}"
}
