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

## Output the SES user secrets

output "secret" {
  value = aws_iam_access_key.ses_user.secret
}

output "user" {
  value = aws_iam_access_key.ses_user.user
}

output "access_key" {
  value = aws_iam_access_key.ses_user.id
}

output "ses_password" {
  value = aws_iam_access_key.ses_user.ses_smtp_password
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

# SES SNS ARN
output "sns_topic_arn_ses_complaints" {
  value = aws_sns_topic.ses_complaints.*.arn
}

output "sns_topic_arn_ses_bounces" {
  value = aws_sns_topic.ses_bounces.*.arn
}
