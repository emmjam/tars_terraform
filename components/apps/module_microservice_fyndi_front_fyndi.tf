module "fyndi-f" {
  source = "../../modules/microservice"

  name        = "fyndi-front"
  region      = var.aws_region
  project     = var.project
  environment = var.environment
  component   = var.component

  vpc_id = data.terraform_remote_state.base.outputs.vpc_id

  availability_zones = data.aws_availability_zones.available.names

  subnets_cidrs = var.fyndi-f_subnets_cidrs

  subnets_route_tables = data.terraform_remote_state.base.outputs.private_nat_route_table_id

  lc_ami_id        = data.aws_ami.fyndi-f.image_id
  lc_instance_type = var.fyndi-f_instance_type
  lc_user_data     = data.cloudinit_config.fyndi-f.rendered
  lc_spot_price    = var.spot_pricing[var.fyndi-f_instance_type]

  lc_additional_sg_ids = [
    data.terraform_remote_state.base.outputs.core_sg_id,
  ]

  cwl_names = [
    "/cloud-init-output",
  ]

  cwl_retention_days = "30"

  lifecycle_hook_launching_default_result = "ABANDON"
  lifecycle_hook_launching_enabled        = "1"
  lifecycle_hook_launching_timeout        = "500"
  failed_lifecycle_action_sns_topic       = data.terraform_remote_state.base.outputs.sns_alerts_arn

  asg_size_min               = var.fyndi-f_asg_min_size
  asg_size_desired_on_create = var.fyndi-f_asg_min_size
  asg_size_max               = var.fyndi-f_asg_max_size
  asg_load_balancers         = []

  default_tags = local.default_tags

  asg_default_tags = local.asg_default_tags
}

