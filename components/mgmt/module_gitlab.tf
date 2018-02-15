module "gitlab" {
  source      = "../../modules/gitlab"
  project     = "${var.project}"
  environment = "${var.environment}"
  component   = "${var.component}"

  vpc_id             = "${aws_vpc.mgmt.id}"
  availability_zones = "${data.aws_availability_zones.available.names}"
  hosted_zone_id     = "${aws_route53_zone.mgmt.zone_id}"
  domain_name        = "${var.environment}.${var.private_domain_name}"

  lc_instance_type = "${lookup(var.gitlab,"instance_type")}"
  lc_ami_id        = "${data.aws_ami.gitlab.image_id}"

  lc_additional_sg_ids = [
    "${aws_security_group.common.id}",
    "${aws_security_group.mgmt.id}",
  ]

  ebs_volume_type = "${lookup(var.gitlab,"ebs_volume_type")}"
  ebs_volume_size = "${lookup(var.gitlab,"ebs_volume_size")}"

  gitlab_subnet_cidrs            = ["${var.gitlab_subnets_cidrs}"]
  gitlab_private_route_table_ids = ["${aws_route_table.private_nat.*.id}"]
  gitlab_whitelist               = "${var.gitlab_whitelist}"

  elb_private_subnets_cidrs     = "${var.gitlab_elb_private_subnets_cidrs}"
  elb_private_route_table_ids   = ["${aws_route_table.private.*.id}"]
  elb_subnets_cidrs             = "${var.gitlab_elb_subnets_cidrs}"
  elb_public_route_table_ids    = ["${aws_route_table.public.id}"]
  elb_public_port               = "${lookup(var.gitlab_elb_public,"public_port")}"
  elb_public_protocol           = "${lookup(var.gitlab_elb_public,"public_protocol")}"
  elb_public_ssl_certificate_id = "${data.aws_acm_certificate.tars_dvsacloud_uk.arn}"
  elb_public_external_address   = "${aws_route53_record.gitlab.fqdn}"

  db_subnets_cidrs           = "${var.gitlab_db_subnets_cidrs}"
  db_private_route_table_ids = ["${aws_route_table.private.*.id}"]
  db_name                    = "${lookup(var.gitlab_db,"db_name")}"
  db_allocated_storage       = "${lookup(var.gitlab_db,"allocated_storage")}"
  db_storage_type            = "${lookup(var.gitlab_db,"storage_type")}"
  db_engine_version          = "${lookup(var.gitlab_db,"engine_version")}"
  db_instance_class          = "${lookup(var.gitlab_db,"instance_class")}"
  db_multi_az                = "${lookup(var.gitlab_db,"multi_az")}"
  db_username                = "${lookup(var.gitlab_db,"username")}"
  db_password                = "${lookup(var.gitlab_db,"password")}"
  db_backup_retention_period = "${lookup(var.gitlab_db,"backup_retention_period")}"
  db_backup_window           = "${lookup(var.gitlab_db,"backup_window")}"
  db_maintenance_window      = "${lookup(var.gitlab_db,"maintenance_window")}"
  db_skip_final_snapshot     = "${lookup(var.gitlab_db,"skip_final_snapshot")}"
  db_pg_family               = "${lookup(var.gitlab_db,"pg_family")}"

  redis_subnets_cidrs            = "${var.gitlab_redis_subnets_cidrs}"
  redis_private_route_table_ids  = ["${aws_route_table.private.*.id}"]
  redis_engine_version           = "${lookup(var.gitlab_redis,"engine_version")}"
  redis_parameter_group_name     = "${lookup(var.gitlab_redis,"parameter_group_name")}"
  redis_node_type                = "${lookup(var.gitlab_redis,"node_type")}"
  redis_maintenance_window       = "${lookup(var.gitlab_redis,"maintenance_window")}"
  redis_snapshot_window          = "${lookup(var.gitlab_redis,"snapshot_window")}"
  redis_snapshot_retention_limit = "${lookup(var.gitlab_redis,"snapshot_retention_limit")}"
  redis_endpoint                 = "${lookup(var.gitlab_redis,"endpoint_address")}"

  default_tags = "${var.default_tags}"
}
