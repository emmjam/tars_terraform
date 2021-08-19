################################################################################
#
# Squid NAT
#
################################################################################

module "squidnat" {
  source = "../../modules/squidnat"

  project     = var.project
  environment = var.environment
  component   = var.component
  region      = var.aws_region

  default_tags = local.default_tags

  asg_default_tags = var.asg_default_tags

  instance_type    = var.squidnat_instance_type
  root_domain_name = var.private_domain_name
  route_tables     = [aws_route_table.private_natgw.id]
  subnets_cidrs    = var.squidnat_subnets_cidrs
  vpc_id           = aws_vpc.vpc.id
  zone_id          = aws_route53_zone.vpc_private.zone_id

  lifecycle_hook_launching_default_result = "ABANDON"
  lifecycle_hook_launching_enabled        = "1"
  lifecycle_hook_launching_timeout        = "300"
  failed_lifecycle_action_sns_topic       = aws_sns_topic.alerts.arn

  # passed in for cloud init
  ami_id              = data.aws_ami.squidnat.image_id
  aws_account_id      = var.aws_account_id
  account_environment = var.account_environment
  aws_account_alias   = var.aws_account_alias
  spot_price          = var.spot_pricing[var.squidnat_instance_type]

  # IAM for hiera
  hiera_kms_key_id          = data.terraform_remote_state.acc.outputs.hieradata_kms_key_id
  kms_hiera_user_policy_arn = data.terraform_remote_state.acc.outputs.hieradata_kms_key_user_policy_arn

  cloudwatch_policy_arn = aws_iam_policy.cloudwatch.arn

  # jmeter CIDRs are not redirected though Squid for performance reasons
  squid_bypass_cidrs = []

  whitelist_cidrs = []

  cwl_retention_days = var.cwl_retention_days

  additional_sg_ids = [
    aws_security_group.core.id,
  ]

  squidnat_cw_alarm_failure_actions = [
    aws_sns_topic.alerts.arn,
  ]

  squidnat_unhealthy_host_alarm_count = var.unhealthy_host_alarm_count
}

