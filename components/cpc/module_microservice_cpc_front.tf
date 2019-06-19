module "cpc-front" {
  source = "../../modules/microservice"

  name        = "cpc-front"
  region      = "${var.aws_region}"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  vpc_id             = "${data.terraform_remote_state.base.vpc_id}"
  availability_zones = "${data.aws_availability_zones.available.names}"

  subnets_cidrs = "${var.cpc-front_subnets_cidrs}"

  subnets_route_tables = [
    "${data.terraform_remote_state.base.private_nat_route_table_id}",
  ]

  lc_ami_id        = "${data.aws_ami.cpc-front.image_id}"
  lc_instance_type = "${var.cpc-front_instance_type}"
  lc_user_data     = "${data.template_cloudinit_config.cpc-front.rendered}"
  lc_spot_price    = "${lookup(var.spot_pricing, var.cpc-front_instance_type)}"

  lc_additional_sg_ids = [
    "${data.terraform_remote_state.base.core_sg_id}",
  ]

  cwl_names = [
    "/cloud-init-output",
  ]

  cwl_retention_days = "30"

  lifecycle_hook_launching_default_result = "ABANDON"
  lifecycle_hook_launching_enabled        = "1"
  lifecycle_hook_launching_timeout        = "500"
  failed_lifecycle_action_sns_topic       = "${data.terraform_remote_state.base.sns_alerts_arn}"

  asg_size_min               = "${var.cpc-front_asg_min_size}"
  asg_size_desired_on_create = "${var.cpc-front_asg_min_size}"
  asg_size_max               = "${var.cpc-front_asg_max_size}"
  asg_load_balancers         = []

  default_tags = "${local.default_tags}"

  asg_default_tags = [
    "${local.asg_default_tags}",
  ]
}
