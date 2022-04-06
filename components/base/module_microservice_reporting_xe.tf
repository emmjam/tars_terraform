module "microservice_reporting_xe" {
  source = "../../modules/microservice"
  count = var.reporting_xe_count

  name        = "reporting-xe"
  region      = var.aws_region
  project     = var.project
  environment = var.environment
  component   = var.component

  vpc_id             = aws_vpc.vpc.id
  availability_zones = data.aws_availability_zones.available.names
  subnets_cidrs      = var.reporting_xe_subnet_cidr

  subnets_route_tables = aws_route_table.private_nat.*.id

  lc_additional_sg_ids = [
    aws_security_group.core.id
  ]

  lc_ami_id        = data.aws_ami.reporting_xe.image_id
  lc_instance_type = var.reporting_xe_instance_type
  lc_user_data     = data.cloudinit_config.reporting_xe.rendered
  lc_spot_price    = var.spot_pricing[var.reporting_xe_instance_type]

  cwl_names = ["/cloud-init-output"]
  cwl_retention_days = 30

  lifecycle_hook_launching_default_result = "ABANDON"
  lifecycle_hook_launching_enabled        = "1"
  lifecycle_hook_launching_timeout        = "500"
  failed_lifecycle_action_sns_topic       = aws_sns_topic.alerts.arn

  asg_size_min               = var.reporting_xe_asg_min_size
  asg_size_desired_on_create = var.reporting_xe_asg_min_size
  asg_size_max               = var.reporting_xe_asg_max_size

  default_tags = local.default_tags

  asg_default_tags = local.asg_default_tags

}