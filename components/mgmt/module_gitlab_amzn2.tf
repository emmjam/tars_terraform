module "gitlab-amzn2" {
  source      = "../../modules/gitlab"
  project     = var.project
  environment = var.environment
  component   = var.component

  name            = "gitlabaz2"
  r53_record_name = "gitlab_amzn2"

  vpc_id = aws_vpc.mgmt.id

  availability_zones = data.aws_availability_zones.available.names

  hosted_zone_id = aws_route53_zone.mgmt.zone_id

  # TODO: peacheym: gitlab and jenkins have different domain name values?
  domain_name = "${var.component}.${local.vpc_domain_name}"

  lc_instance_type = var.gitlab_instance_type
  lc_ami_id        = data.aws_ami.gitlab_amzn2.image_id

  lc_additional_sg_ids = [
    aws_security_group.common.id,
    aws_security_group.mgmt.id,
  ]

  ebs_volume_type = var.gitlab_ebs_volume_type
  ebs_volume_size = var.gitlab_ebs_volume_size

  gitlab_subnet_cidrs = var.gitlab_amzn2_subnets_cidrs

  gitlab_private_route_table_ids = aws_route_table.private_nat.*.id

  gitlab_whitelist = var.whitelist

  elb_private_subnets_cidrs = var.gitlab_amzn2_elb_private_subnets_cidrs

  elb_private_route_table_ids = aws_route_table.private.*.id

  elb_subnets_cidrs = var.gitlab_amzn2_elb_subnets_cidrs

  elb_public_route_table_ids = [
    aws_route_table.public.id,
  ]

  elb_public_external_address   = aws_route53_record.gitlab_amzn2.fqdn
  elb_public_port               = var.gitlab_elb_public_public_port
  elb_public_protocol           = var.gitlab_elb_public_public_protocol
  elb_public_ssl_certificate_id = data.aws_acm_certificate.tars_dvsacloud_uk.arn

  db_subnets_cidrs = var.gitlab_amzn2_db_subnets_cidrs

  db_private_route_table_ids = aws_route_table.private.*.id

  db_name                    = var.gitlab_amzn2_db_db_name
  db_allocated_storage       = var.gitlab_db_allocated_storage
  db_storage_type            = var.gitlab_db_storage_type
  db_engine_version          = var.gitlab_db_engine_version
  db_instance_class          = var.gitlab_db_instance_class
  db_multi_az                = var.gitlab_db_multi_az
  db_username                = var.gitlab_db_username
  db_password                = var.gitlab_db_password
  db_backup_retention_period = var.gitlab_db_backup_retention_period
  db_backup_window           = var.gitlab_db_backup_window
  db_maintenance_window      = var.gitlab_db_maintenance_window
  db_skip_final_snapshot     = var.gitlab_db_skip_final_snapshot
  db_pg_family               = var.gitlab_db_pg_family

  redis_subnets_cidrs = var.gitlab_amz2_redis_subnets_cidrs

  redis_private_route_table_ids = aws_route_table.private.*.id

  redis_engine_version           = var.gitlab_redis_engine_version
  redis_parameter_group_name     = var.gitlab_redis_parameter_group_name
  redis_node_type                = var.gitlab_redis_node_type
  redis_maintenance_window       = var.gitlab_redis_maintenance_window
  redis_snapshot_window          = var.gitlab_redis_snapshot_window
  redis_snapshot_retention_limit = var.gitlab_redis_snapshot_retention_limit
  redis_endpoint                 = var.gitlab_amzn2_redis_endpoint_address

  default_tags = local.default_tags
}

