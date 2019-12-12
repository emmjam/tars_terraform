module "cpc_batch" {
  source = "../../modules/microservice"

  name        = "cpc-batch"
  region      = var.aws_region
  project     = var.project
  environment = var.environment
  component   = var.component

  vpc_id = data.terraform_remote_state.base.outputs.vpc_id

  availability_zones = data.aws_availability_zones.available.names

  #TODO: smarts: 
  #  This is a terrible solution but until the component
  #  collapse is implmented then it is probably safer to
  #  leave the subnets in base and alter the microservice
  #  module to accept pre-existing subnets.
  subnets_ids = data.terraform_remote_state.cpc.outputs.subnet_cidrs_cpc_backend

  subnets_route_tables = data.terraform_remote_state.base.outputs.private_nat_route_table_id

  lc_ami_id        = data.aws_ami.cpc-batch.image_id
  lc_instance_type = var.cpc-batch_instance_type
  lc_user_data     = data.template_cloudinit_config.cpc-batch.rendered
  lc_spot_price    = var.spot_pricing[var.cpc-batch_instance_type]

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

  asg_size_min               = var.cpc-batch_asg_min_size
  asg_size_desired_on_create = var.cpc-batch_asg_min_size
  asg_size_max               = var.cpc-batch_asg_max_size
  asg_load_balancers         = []

  default_tags = local.default_tags

  asg_default_tags = local.asg_default_tags
}

