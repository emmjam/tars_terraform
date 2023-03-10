# output "hieradata_kms_key_id" {
#   value = "${module.kms_hieradata.key_id}"
# }

output "packer_iam_instance_profile_name" {
  value = aws_iam_instance_profile.packer.name
}

output "nat_public_ips" {
  value = aws_eip.nat.*.public_ip
}

output "vpc_cidr_block" {
  value = aws_vpc.mgmt.cidr_block
}

output "vpc_id" {
  value = aws_vpc.mgmt.id
}

output "jenkins_elb_sg_id" {
  value = module.jenkins.elb_sg_id
}

output "jenkins_iam_role_name" {
  value = module.jenkins.jenkins_blue_iam_role_name
}

output "gitlab_elb_sg_id" {
  value = module.gitlab-amzn2.elb_private_sg_id
}

output "private_alb_sg" {
  value = aws_security_group.alb_private.id
}

# SES SNS ARN
output "sns_topic_arn_ses_complaints" {
  value = aws_sns_topic.ses_complaints.arn
}

output "sns_topic_arn_ses_bounces" {
  value = aws_sns_topic.ses_bounces.arn
}
