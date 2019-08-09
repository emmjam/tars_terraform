module "sonarqube" {
  source = "../../modules/sonarqube"

  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"
  region      = "${var.aws_region}"

  vpc_id                 = "${aws_vpc.mgmt.id}"
  aws_availability_zones = "${data.aws_availability_zones.available.names}"
  routing_table          = [ "${aws_route_table.private_nat.*.id}" ]
  vpc_domain_name        = "${local.vpc_domain_name}"
  aws_account_id         = "${var.aws_account_id}"
  kms_key                = "${data.terraform_remote_state.acc.hieradata_kms_key_id}"
  route53_zone           = "${aws_route53_zone.mgmt.id}"
  sq_asg_size_min        = "${lookup(var.sonarqube, "sq_asg_size_min")}"
  sq_asg_size_desired    = "${lookup(var.sonarqube, "sq_asg_size_desired")}"
  sq_asg_size_max        = "${lookup(var.sonarqube, "sq_asg_size_max")}"
  sq_ami_id              = "${data.aws_ami.sonarqube.image_id}"
  sq_instance_type       = "${lookup(var.sonarqube, "sq_instance_type")}"
  ebs_volume_size        = 50

  lc_additional_sg_ids = [
    "${aws_security_group.common.id}"
  ]

  sq_subnets_cidrs = [
    "${local.sq_subnets_cidrs}"
  ]

  rds_subnets_cidrs = [
    "${local.sqdb_subnets_cidrs}"
  ]

  rds_pg_max_allowed_packet   = "${lookup(var.sonarqube, "rds_pg_max_allowed_packet")}"
  rds_storage_type            = "${lookup(var.sonarqube, "rds_storage_type")}"
  rds_allocated_storage       = "${lookup(var.sonarqube, "rds_allocated_storage")}"
  rds_engine                  = "${lookup(var.sonarqube, "rds_engine")}"
  rds_engine_version          = "${lookup(var.sonarqube, "rds_engine_version")}"
  rds_pg_family               = "${lookup(var.sonarqube, "rds_pg_family")}"
  rds_instance_class          = "${lookup(var.sonarqube, "rds_instance_class")}"
  rds_multi_az                = "${lookup(var.sonarqube, "rds_multi_az")}"
  rds_username                = "${lookup(var.sonarqube, "rds_username")}"
  rds_password                = "${lookup(var.sonarqube, "rds_password")}"
  rds_skip_final_snapshot     = "${lookup(var.sonarqube, "rds_skip_final_snapshot")}"
  rds_backup_retention_period = "${lookup(var.sonarqube, "rds_backup_retention_period")}"
  rds_backup_window           = "${lookup(var.sonarqube, "rds_backup_window")}"
  rds_maintenance_window      = "${lookup(var.sonarqube, "rds_maintenance_window")}"

  default_tags = "${merge(
    var.default_tags,
    map("Component", var.component)
  )}"
}
