module "tars_back" {
  source = "../../modules/microservice"

  #TODO: smarts
  #  "tars-back" breaks 64 characters when used with the
  #  alerts subscription inside the microservice module.
  #  The component collapse should address this issue and
  #. for now the CSI will suitably identify this resource.
  name        = "back"
  region      = "${var.aws_region}"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  vpc_id = "${data.terraform_remote_state.base.vpc_id}"

  availability_zones = [
    "${data.aws_availability_zones.available.names}",
  ]

  #TODO: smarts: 
  #  This is a terrible solution but until the component
  #  collapse is implmented then it is probably safer to
  #  leave the subnets in base and alter the microservice
  #  module to accept pre-existing subnets.
  subnets_ids = [
    "${data.terraform_remote_state.base.subnets_tars_backend}",
  ]

  subnets_route_tables = [
    "${data.terraform_remote_state.base.private_nat_route_table_id}",
  ]

  lc_ami_id        = "${data.aws_ami.wildfly-back.image_id}"
  lc_instance_type = "${var.wildfly-back_instance_type}"
  lc_user_data     = "${data.template_cloudinit_config.wildfly-back.rendered}"

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

  asg_size_min               = "${var.wildfly-back_asg_min_size}"
  asg_size_desired_on_create = "${var.wildfly-back_asg_min_size}"
  asg_size_max               = "${var.wildfly-back_asg_max_size}"
  asg_load_balancers         = []

  default_tags = "${local.default_tags}"

  asg_default_tags  = [
    "${local.asg_default_tags}",
  ]
}
