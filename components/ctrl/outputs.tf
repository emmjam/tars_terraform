output "bastion_sg_id" {
  value = module.bastion.security_group_id
}

output "bastion_elb_sg_id" {
  value = aws_security_group.bastion_elb.id
}

output "vpc_id" {
  value = aws_vpc.ctrl.id
}

output "vpc_cidr_block" {
  value = aws_vpc.ctrl.cidr_block
}

output "eip_nat_public_ips" {
  value = aws_eip.nat.*.public_ip
}

output "rt_private_nat_id" {
  value = aws_route_table.private_nat.id
}

output "rt_private_id" {
  value = aws_route_table.private.id
}

output "vpc_endpoint_s3_prefix_list_id" {
  value = aws_vpc_endpoint.s3.prefix_list_id
}

## Output the SES user secrets

output "secret" {
  value     = aws_iam_access_key.ses_user.secret
  sensitive = true
}

output "user" {
  value = aws_iam_access_key.ses_user.user
}

output "access_key" {
  value = aws_iam_access_key.ses_user.id
}

output "ses_smtp_password_v4" {
  value     = aws_iam_access_key.ses_user.ses_smtp_password_v4
  sensitive = true
}

output "jenkinsctrl_sg_id" {
  value = module.jenkinsnode.security_group_id
}

# Grafana
output "grafana_sg_id" {
  value = module.grafana.security_group_id
}

# DX Gateway
output "dx_gateway_id" {
  value = aws_dx_gateway.dc-gateway.*.id
}

output "bastion_outbound-oracle_sg_id" {
  value = aws_security_group.outbound-oracle.id
}

output "tars_aws_backup_iam_role_arn" {
  value = aws_iam_role.tars_aws_backup.arn
}

output "tars_aws_backup_iam_tars_efs_id" {
  value = aws_backup_plan.tars_efs.id
}

output "tars_domain_name" {
  value = aws_ses_domain_identity.tars.domain
}

output "tars_acct_bucketlogs" {
  value = aws_s3_bucket.acc-bucketlogs.id
}

output "private_r53_zone" {
  value = aws_route53_zone.private_domain.*.id
}

output "s3_bucket_resources_arn" {
  value = aws_s3_bucket.resources.arn
}

output "tars_acct_bucketlog_arn" {
  value = aws_s3_bucket.acc-bucketlogs.arn
}

output "vpc_endpoint_api_execute_id" {
  value = var.environment == "nonprod" ? aws_vpc_endpoint.execute_api[0].id : null
}