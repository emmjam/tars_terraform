module "efs_backup" {
  source = "../../modules/microservice"

  name        = "efs-backup"
  region      = "${var.aws_region}"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  vpc_id               = "${aws_vpc.vpc.id}"
  availability_zones   = "${data.aws_availability_zones.available.names}"
  subnets_cidrs        = "${var.efs_backup_subnets_cidrs}"

  subnets_route_tables = [
    "${aws_route_table.private_nat.*.id}",
  ]
  
  lc_additional_sg_ids = [
    "${aws_security_group.core.id}"
  ]

  lifecycle_hook_launching_default_result = "ABANDON"
  lifecycle_hook_launching_enabled        = "1"
  lifecycle_hook_launching_timeout        = "500"
  failed_lifecycle_action_sns_topic       = "${aws_sns_topic.alerts.arn}"

  lc_ami_id        = "${data.aws_ami.efs_backup.image_id}"
  lc_instance_type = "${var.efs_backup_instance_type}"
  lc_user_data     = "${data.template_cloudinit_config.efs_backup.rendered}"

  asg_size_min               = "${var.efs_backup_asg_min_size}"
  asg_size_desired_on_create = "${var.efs_backup_asg_min_size}"
  asg_size_max               = "${var.efs_backup_asg_max_size}"

  default_tags = "${local.default_tags}"

  asg_default_tags  = [
    "${local.asg_default_tags}",
  ]
}
