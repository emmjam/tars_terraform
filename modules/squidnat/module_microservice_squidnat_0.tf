module "microservice_squidnat_0" {
  source = "../../modules/microservice"

  project     = var.project
  environment = var.environment
  component   = var.component
  region      = var.region

  name = "squidnat_0"

  asg_default_tags = var.asg_default_tags

  default_tags = local.default_tags

  asg_size_desired_on_create = var.squidnat_asg_size_desired_on_create_per_az
  asg_size_max               = var.squidnat_asg_size_max_per_az
  asg_size_min               = var.squidnat_asg_size_min_per_az

  availability_zones = [
    data.aws_availability_zones.azs.names[0],
  ]

  lc_additional_sg_ids = concat(tolist([aws_security_group.squidnat.id]), var.additional_sg_ids)

  lc_ami_id        = var.ami_id
  lc_instance_type = var.instance_type
  lc_spot_price    = var.spot_price
  lc_user_data     = data.cloudinit_config.squidnat.rendered

  lifecycle_hook_launching_default_result = var.lifecycle_hook_launching_default_result
  lifecycle_hook_launching_enabled        = var.lifecycle_hook_launching_enabled
  lifecycle_hook_launching_timeout        = var.lifecycle_hook_launching_timeout
  failed_lifecycle_action_sns_topic       = var.failed_lifecycle_action_sns_topic

  subnets_cidrs = [
    var.subnets_cidrs[0],
  ]

  subnets_map_public_ip_on_launch = "true"

  subnets_route_tables = var.route_tables

  vpc_id = var.vpc_id

  cwl_names = ["/cloud-init-output"]

  cwl_retention_days = var.cwl_retention_days
}

