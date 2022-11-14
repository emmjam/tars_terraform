module "sonarqube" {
  source = "../../modules/sonarqube"

  project     = var.project
  environment = var.environment
  component   = var.component
  region      = var.aws_region

  vpc_id                 = aws_vpc.mgmt.id
  aws_availability_zones = data.aws_availability_zones.available.names
  routing_table          = aws_route_table.private_nat.*.id
  vpc_domain_name        = local.vpc_domain_name
  aws_account_id         = var.aws_account_id
  kms_key                = data.terraform_remote_state.acc.outputs.hieradata_kms_key_id
  route53_zone           = aws_route53_zone.mgmt.id
  sq_asg_size_min        = var.sonarqube["sq_asg_size_min"]
  sq_asg_size_desired    = var.sonarqube["sq_asg_size_desired"]
  sq_asg_size_max        = var.sonarqube["sq_asg_size_max"]
  sq_ami_id              = data.aws_ami.sonarqube.image_id
  sq_instance_type       = var.sonarqube["sq_instance_type"]
  asg_default_tags       = local.asg_default_tags
  ebs_volume_size        = 50

  lc_additional_sg_ids = [
    aws_security_group.common.id,
  ]

  sq_subnets_cidrs = local.sq_subnets_cidrs

  rds_subnets_cidrs = local.sqdb_subnets_cidrs

  rds_pg_max_allowed_packet   = var.sonarqube["rds_pg_max_allowed_packet"]
  rds_storage_type            = var.sonarqube["rds_storage_type"]
  rds_allocated_storage       = var.sonarqube["rds_allocated_storage"]
  rds_engine                  = var.sonarqube["rds_engine"]
  rds_engine_version          = var.sonarqube["rds_engine_version"]
  rds_pg_family               = var.sonarqube["rds_pg_family"]
  rds_instance_class          = var.sonarqube["rds_instance_class"]
  rds_multi_az                = var.sonarqube["rds_multi_az"]
  rds_username                = var.sonarqube["rds_username"]
  rds_password                = var.sonarqube["rds_password"]
  rds_skip_final_snapshot     = var.sonarqube["rds_skip_final_snapshot"]
  rds_backup_retention_period = var.sonarqube["rds_backup_retention_period"]
  rds_backup_window           = var.sonarqube["rds_backup_window"]
  rds_maintenance_window      = var.sonarqube["rds_maintenance_window"]

  default_tags = merge(
    var.default_tags,
    {
      "Component" = var.component
    },
  )
}

